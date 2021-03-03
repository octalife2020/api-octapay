<?php

namespace Source\App\Checkout1;

use League\Plates\Engine;

use Source\Models\Checkout\Checkout;
use Source\Models\Produtos\Produto;
use Source\Models\Produtos\Plano;
use Source\Models\CoProdutor\CoProdutor;
use Source\Models\Vendas\Venda;

use Source\Models\Usuarios\UsuarioDados;
use Source\Models\Usuarios\Usuario;
use Source\Models\Configuracoes\Taxa;
use Source\Models\Configuracoes\ConfiguracaoCheckout;

use Source\Helpers\Emails;

use Source\App\Checkout1\Validacao;
use Source\App\Usuarios\AppUsuarios;
use Source\App\Postback\AppPostback;
use Source\App\Checkout1\AppProcessos;


use Moip\Moip;
use Moip\Auth\BasicAuth;

class AppCheckout
{
    private $view;
    protected $validacao;
    private $endpoint;
    private $token;
    private $key;

    public function __construct($router)
    {
        $this->view = Engine::create(__DIR__ . "/../../../pagamentos", "php");
        $this->view->addData(["router" => $router]);
        $this->validacao = new Validacao();

        $configuracaoCheckout = (new ConfiguracaoCheckout())->findById(1);
        if ($configuracaoCheckout->sandbox == 1) {
            define("ENDPOINT", Moip::ENDPOINT_SANDBOX);
            $this->token = $configuracaoCheckout->token_sandbox;
            $this->key = $configuracaoCheckout->chave_sandbox;
        } else {
            define("ENDPOINT", Moip::ENDPOINT_PRODUCTION);
            $this->token = $configuracaoCheckout->token_producao;
            $this->key = $configuracaoCheckout->chave_producao;
        }
        
    }
    
    public function home($data)
    {
        echo $this->view->render("checkout", [
            "title" => "Produto Não Encontrado | " . SITE,
            "mensagem" => "Produto Não Encontrado",
            "dados" => false
        ]);
    }

    public function pixel($data)
    {
        echo $this->view->render("pixel", [
            "title" => "Pixel",
        ]);
    }

    public function analytics($data)
    {
        echo $this->view->render("analytics", [
            "title" => "Analytics",
        ]);
    }

    public function produto($data)
    {
        $kit = $data["plano"];
        $checkout = (new Checkout())->find("codigo = :plano", "plano={$kit}")->fetch();
        $taxa = (new Taxa())->findById(1);
        
        //echo $checkout->usuario;
        $usuario = (new Usuario())->findById($checkout->usuario);
        if (@$usuario && @$usuario->taxa_octapay) {
            $taxa_transacao = $usuario->taxa_octapay;
        } else {
            $taxa_transacao = $taxa->taxa_octapay;
        }

        //echo $taxa_transacao;
        
        if(!$checkout){
            echo "Produto Não Encontrado";
            exit;
        }
        
        $produto = (new Produto())->find("id = $checkout->produto AND status = 2")->fetch();
        if($checkout->plano != ""){
            $plano = (new Plano())->find("id = $checkout->plano AND status = 2 AND ativo = 1")->fetch();
            $idPlano = @$plano->id;
        } else {
            $plano = @$produto;
            $idPlano = "";
        }
        
        if(!$plano){
            echo "Produto Não Encontrado";
            exit;
        }

        $coproducao = (new CoProdutor())->find("produto = $checkout->produto AND aceito = 1")->fetch(true);
        $coproducaoCount = (new CoProdutor())->find("produto = $checkout->produto  AND aceito = 1")->count();
        $i = 1;
        if($coproducao){
            foreach ($coproducao as $coprodutor) {
                @$coprodutores .= "/$coprodutor->co_produtor/";
                if ($coprodutor->tipo_comissao) {
                    $comissao = 1;
                }
                //var_dump($coprodutor->co_produtor, $coprodutor->tipo_comissao, $coprodutor->comissao);
                
                $i++;
            }
            //echo $coprodutores;
        }

        $configuracaoCheckout = (new ConfiguracaoCheckout())->findById(1);
        $sandbox = $configuracaoCheckout->sandbox;
        //var_dump($this->token, $this->key, ENDPOINT);

        echo $this->view->render("checkout", [
            "title" => $plano->nome . " | " . SITE,
            "mensagem" => "",
            "taxa" => $taxa,
            "taxa_transacao" => $taxa_transacao,
            "plano" => $plano,
            "produto" => $produto,
            "idPlano" => $idPlano,
            "checkout" => $checkout,
            "sandbox" => $sandbox,
            "coprodutores" => @$coprodutores,
            "coproducao" => @$coproducao,
        ]);
    }

    public function transacao($data) 
    {
        if($data["email"] == ""){
            $data["email"] = "sac@octa.life";
        }

        var_dump($data);
    }

    public function transacao2($data) 
    {
        if($data["email"] == ""){
            $data["email"] = "sac@octapay.com.br";
        }

        $usuario = (new UsuarioDados());
        $cadastrado = $usuario->verificaCpf(["cpf" => $data["cpf"]]);

        $customer =  $usuario->findById($cadastrado);

        $data["tipo_doc"] = 1;
        $data["pais"] = "BR";
        
        if($cadastrado){
            $comprador = $this->criarComprador($data);
            $customer1 = json_encode($comprador);
            $customer1 = json_decode($customer1);
            $data["customer_id"] = $customer1->id;

            $data["id"] = $cadastrado;

            $user = (new Usuario())->find("usuario_dados = $cadastrado")->fetch();
            $data["usuario"] = $user->id;
            $data["comprador"] = $cadastrado;
        } else {
            $comprador = $this->criarComprador($data);
            $customer1 = json_encode($comprador);
            $customer1 = json_decode($customer1);
            $data["customer_id"] = $customer1->id;

            $data["pais"] = "BR";
            $comprador = (new AppUsuarios(null))->cadastroUsuarioDados($data);
            $data["comprador"] = $comprador;

            $user = (new Usuario())->find("usuario_dados = $comprador")->fetch();
            $data["usuario"] = $user->id;
        }

        $data["meio_pagamento"] = "Moip";

        $status_transacao = array(
            "CREATED" => 1,
            "WAITING" => 1,
            "IN_ANALYSIS" => 2,
            "PRE_AUTHORIZED" => 3,
            "AUTHORIZED" => 4,
            "CANCELLED" => 5,
            "REFUNDED" => 6,
            "REVERSED" => 7,
            "SETTLED" => 8
        );

        $telefone = (new Validacao())->limpaStr($data["telefone"]);
        $data["ddd"] = substr($telefone, 0, 2);
        $data["telefone"] = substr($telefone, 2, 12);

        if($data["pagamento"] == "credit_card"){
            $hoje = date("Ym");
            $exp = $data["ano-val"].$data["mes-val"];
            if(strtotime($exp) < strtotime($hoje)){
                echo "Data de expiração do cartão inválida";
                echo "<script>setTimeout(function(){ history.go(-1); }, 3000);</script>";
                exit;
            }

            $valProd = $data["valor_produto"] + @$data["frete"];
            $preco = number_format($this->validacao->juros($data["parcela"], $data["taxa_juros"], $valProd), 2, ".", "");
            $preco = $preco * $data["parcela"];
            $preco = (string) ($preco - $data["valor_desconto"]) * 100;

            $data["preco"] = $preco;
            $data["valor_bruto"] = ($preco / 100);
            $data["valor_frete"] = @$data["frete"];
            $data["valor_liquido"] -=  @$data["valor_desconto"];

            $data["valor_octapay"] = number_format(($valProd * ($data["taxa_octapay"] / 100)) + 1, 2);
            $data["valor_liquido"] = $valProd - $data["valor_octapay"];

            $val = $preco / 100;
            if ($val <= $data["valor_produto"]) {
                $data["valor_juros"] = 0;
            } else {
                $data["valor_juros"] = ($preco / 100) - @$data["valor_frete"] - $data["valor_produto"];
            }

            $data["data_ultimo_evento"] = date("Y-m-d H:i:s");

            $pedido = $this->criaPedido($data);
            $data["order"] = $pedido;
            $transacao = $this->compraCartao($data);

            //var_dump($transacao);
            
            $transacao1 = json_encode($transacao);
            $transacao1 = json_decode($transacao1);

            $data["transacao"] = $transacao1->id;
            $data["status_transacao"] = $status_transacao[$transacao1->status];
            $data["forma_pagamento"] = 1;
            $venda = $this->venda($data);
            //echo $venda;
            
            $data["venda"] = $venda["venda"];
            if($venda["msg"] == "Venda salva com sucesso"){
                $this->notificacao($data);
            }

            $dados["msg"] = $venda;
            $dados["status_transacao"] = $data["status_transacao"];

            if($data["status_transacao"] == 4 || $data["status_transacao"] == 8){
                $dados["url"] =  url("checkout/obrigado?title=Obrigado Pela Compra");
                $cartao = (new Emails())->cartaoAprovado($data);
            }
            else if($data["status_transacao"] == 2 || $data["status_transacao"] == 3) {
                $dados["url"] = url("checkout/processando");
                $cartao = (new Emails())->cartaoProcessando($data);
            }
            else {
                $dados["url"] = url("checkout/recusado");
                $cartao = (new Emails())->cartaoRecusado($data);
            }
            
            $enviaEmail = (new Emails())->enviaSendGrid($cartao);
            $dados["whatsapp"] = @$venda["whatsapp"];
        }

        else if($data["pagamento"] == "boleto"){
            if(@$data["so_cartao"] == 0)
                $val =  ($data["valor_produto"] + @$data["frete"]) - $data["valor_desconto"];
            else 
                $val =  $data["valor_produto"] + @$data["frete"];

            $preco = explode(".", $val);
            $data["preco"] = $val * 100;

            $data["valor_bruto"] = $data["preco"] / 100;
            $data["valor_juros"] = 0.00;
            $data["valor_frete"] = @$data["frete"];
            $data["taxa_juros"] = 0;

            $valProd = $data["valor_produto"] + @$data["frete"];
            $data["valor_octapay"] = number_format(($valProd * ($data["taxa_octapay"] / 100)) + 1, 2);
            $data["valor_liquido"] = $valProd - $data["valor_octapay"];
            
            if($data["so_cartao"] == 1) {
                $data["valor_desconto"] = 0.00;
                $data["valor_liquido"] = $data["valor_liquido"];
            }
            else {
                $data["valor_desconto"] = $data["valor_desconto"];
                $data["valor_liquido"] -=  $data["valor_desconto"];
            }
            $data["parcela"] = 1;
            $data["data_ultimo_evento"] = date("Y-m-d H:i:s");

            $pedido = $this->criaPedido($data);
            $data["order"] = $pedido;
            $transacao = $this->compraBoleto($data);
            $transacao1 = json_encode($transacao);
            $transacao1 = json_decode($transacao1);

            $data["transacao"] = $transacao1->id;
            $data["link_boleto"] = $transacao1->_links->payBoleto->printHref;
            $data["status_transacao"] = $status_transacao[$transacao1->status];
            $data["forma_pagamento"] = 2;
            $data["linha_digitavel"] = $transacao1->fundingInstrument->boleto->lineCode;

            $boleto = (new Emails())->boleto($data);
            $enviaEmail = @(new Emails())->enviaSendGrid($boleto);

            $venda = $this->venda($data);
            //echo $venda;

            @$data["venda"] = @$venda["venda"];
            if($venda["msg"] == "Venda salva com sucesso"){
                $this->notificacao($data);
            }

            $dados["msg"] = $venda["msg"];
            $dados["whatsapp"] = @$venda["whatsapp"];
            $dados["coprodutores"] = @$venda["coprodutores"];
            $dados["status_transacao"] = $data["status_transacao"];
            $dados["url"] = url("checkout/pedido-reservado?boleto=" . $data["link_boleto"]);
        }

        $_SESSION["pagamento"] = $data;
        echo json_encode($dados);
    }

    public function gerarNovoBoleto($data) 
    {
        //var_dump($data);
        if(@$data["email"] == ""){
            $data["email"] = "sac@octa.life";
        }

        $comprador = $this->criarComprador($data);
        $customer1 = json_encode($comprador);
        $customer1 = json_decode($customer1);

        $data["customer_id"] = $customer1->id;

        $val =  $data["valor_venda"];
        $data["preco"] = $val * 100;

        $data["data_ultimo_evento"] = date("Y-m-d H:i:s");

        $pedido = $this->criaPedido($data);

        $data["order"] = $pedido;
        $transacao = $this->compraBoleto($data);
        $transacao1 = json_encode($transacao);
        $transacao1 = json_decode($transacao1);

        $data["transacao"] = $transacao1->id;
        $data["link_boleto"] = $transacao1->_links->payBoleto->printHref;
        $data["forma_pagamento"] = 2;

        $boleto = (new Emails())->novoBoleto($data);
        $enviaEmail = (new Emails())->enviaSendGrid($boleto);

        if(@$data["vencimento"] == ""){
            if(date("D") != "Sun" || date("D") != "Mon" || date("D") != "Tue"){
                $expiration_date = date("Y-m-d", strtotime("+5 days"));
            } else if(date("D") == "Sat"){
                $expiration_date = date("Y-m-d", strtotime("+4 days"));
            } else {
                $expiration_date = date("Y-m-d", strtotime("+3 days"));
            }
        } else {
            $expiration_date = @$data["vencimento"];
        }

        $venda = (new Venda())->findById($data["id"]);
        $venda->transacao = $transacao1->id;
        $venda->link_boleto = $transacao1->_links->payBoleto->printHref;
        $venda->data_vencimento = $expiration_date;
        $venda->save();

        //var_dump($venda);
        echo json_encode($data);
    }

    public function criarComprador($data)
    {
        $moip = new Moip(new BasicAuth($this->token, $this->key), ENDPOINT);

        $customer = $moip->customers()->setOwnId(uniqid())
            ->setFullname($data["nome"])
            ->setEmail($data["email"])
            ->setBirthDate($data["nasc"])
            ->setTaxDocument($data["cpf"])
            ->setPhone($data["ddd"], $data["telefone"])
            ->addAddress('BILLING',
                $data["rua"], $data["numero"], 
                $data["bairro"], $data["cidade"], $data["estado"],
                $data["cep"], $data["complemento"])
            ->addAddress('SHIPPING',
                $data["rua"], $data["numero"],
                $data["bairro"], $data["cidade"], $data["estado"],
                $data["cep"], $data["complemento"])
            ->create();

        return $customer;
    }

    public function criaPedido($data)
    {
        $moip = new Moip(new BasicAuth($this->token, $this->key), ENDPOINT);

        $order = $moip->orders()->setOwnId(uniqid())
            ->addItem($data["nomekit"],1, $data["nomekit"], (int) $data["preco"])
            //->setShippingAmount(3000)->setAddition(1000)->setDiscount(5000)
            ->setCustomerId($data["customer_id"])
            ->create();

        return $order;
    }

    public function compraCartao($data)
    {
        $moip = new Moip(new BasicAuth($this->token, $this->key), ENDPOINT);

        $holder = $moip->holders()->setFullname($data["titular"])
            ->setBirthDate($data["nasc"])
            ->setTaxDocument($data["cpf"], 'CPF')
            ->setPhone($data["ddd"], $data["telefone"], 55)
            ->setAddress('BILLING', $data["rua"], $data["numero"], $data["bairro"], $data["cidade"], $data["estado"], $data["cep"], $data["complemento"] . " ");

            $payment = $data["order"]->payments()->setCreditCard((int) $data["mes-val"], (int) $data["ano-val"], $data["numcart"], $data["cvv"], $holder)
            ->setInstallmentCount($data["parcela"])
            ->execute();
        
        return $payment;
    }

    public function compraBoleto($data)
    {
        $logo_uri = "https://octapay.com.br/octapay/themes/tema2/assets/imgs/OCTAPAY_H-14.png";

        if(@$data["vencimento"] == ""){
            if(date("D") != "Sun" || date("D") != "Mon" || date("D") != "Tue"){
                $expiration_date = date("Y-m-d", strtotime("+5 days"));
            } else if(date("D") == "Sat"){
                $expiration_date = date("Y-m-d", strtotime("+4 days"));
            } else {
                $expiration_date = date("Y-m-d", strtotime("+3 days"));
            }
        } else {
            $expiration_date = @$data["vencimento"];
        }
        
        $instruction_lines = [
            "Atenção,",                                         //First
            "fique atento à data de vencimento do boleto.",     //Second
            "Pague em qualquer casa lotérica."                  //Third
        ];

        $payment = $data["order"]->payments()
            ->setBoleto($expiration_date, $logo_uri, $instruction_lines)
            ->setStatementDescriptor("OctaPay")
            ->execute();
        
        return $payment;
    }

    public function obrigadoCartao($data)
    {
        session_start();
        //var_dump($_SESSION);

        $usuario = (new Usuario())->findById(@$_SESSION["pagamento"]["produtor"]);
        $dados["nome"] = $usuario->nome;
        $dados["email"] = $usuario->email;
        $dados["transacao"] = @$_SESSION["pagamento"]["transacao"];
        $dados["produto"] = @$_SESSION["pagamento"]["nomekit"];
        $dados["valor_bruto"] = @$_SESSION["pagamento"]["valor_bruto"];

        if(@$_SESSION["pagamento"]["afiliado"]){
            $dados["afiliado"] = @$_SESSION["pagamento"]["afiliado"];
            $dados["comissao_afiliado"] = @$_SESSION["pagamento"]["comissao_afiliado"];
        }
        
        if ($_SESSION["enviado"] == 0) {
            $email = new Emails();
            $venda = $email->vendaRealizada($dados);
            if($email->enviaSendGrid($venda))
                $_SESSION["enviado"] = 1;
        }

        echo $this->view->render("obrigado_cartao", [
            "title" => "Obrigado Pela Compra | " . SITE,
        ]);
    }

    public function obrigadoProcessando($data)
    {
        session_start();
        //var_dump($_SESSION);

        /*$usuario = @(new Usuario())->findById(@$_SESSION["pagamento"]["produtor"]);
        $dados["nome"] = $usuario->nome;
        $dados["email"] = $usuario->email;
        $dados["transacao"] = @$_SESSION["pagamento"]["transacao"];
        $dados["produto"] = @$_SESSION["pagamento"]["nomekit"];
        $dados["valor_bruto"] = @$_SESSION["pagamento"]["valor_bruto"];

        if(@$_SESSION["pagamento"]["afiliado"]){
            $dados["afiliado"] = @$_SESSION["pagamento"]["afiliado"];
            $dados["comissao_afiliado"] = @$_SESSION["pagamento"]["comissao_afiliado"];
        }
        
        if (@$_SESSION["enviado"] == 0) {
            $email = new Emails();
            $venda = $email->vendaProcessando($dados);
            if($email->enviaSendGrid($venda))
                $_SESSION["enviado"] = 1;
        }*/

        echo $this->view->render("obrigado", [
            "title" => "Recebemos Seu Pedido | " . SITE,
        ]);
    }

    public function obrigadoBoleto($data)
    {
        $dados = $_GET;

        session_start();
        //var_dump($_SESSION);

        $usuario = @(new Usuario())->findById(@$_SESSION["pagamento"]["produtor"]);
        $dados["nome"] = $usuario->nome;
        $dados["email"] = $usuario->email;
        $dados["transacao"] = @$_SESSION["pagamento"]["transacao"];
        $dados["produto"] = @$_SESSION["pagamento"]["nomekit"];
        $dados["valor_bruto"] = @$_SESSION["pagamento"]["valor_bruto"];

        if(@$_SESSION["pagamento"]["afiliado"]){
            $dados["afiliado"] = @$_SESSION["pagamento"]["afiliado"];
            $dados["comissao_afiliado"] = @$_SESSION["pagamento"]["comissao_afiliado"];
        }
        
        if ($_SESSION["enviado"] == 0) {
            $email = new Emails();
            $boleto = $email->boletoGerado($dados);
            if(@$email->enviaSendGrid($boleto))
                $_SESSION["enviado"] = 1;
        }

        echo $this->view->render("obrigado_boleto", [
            "title" => "Pedido Reservado | " . SITE,
            "boleto" => $_SESSION["pagamento"]["link_boleto"],
        ]);
    }

    public function recusado($data)
    {
        //$this->pedido($dados);
        session_start();
        echo $this->view->render("desaprovado", [
            "title" => "Compra não autorizada | " . SITE
        ]);
    }

    public function redirect($data)
    {
        session_start();
        //var_dump($_SESSION);
        //$this->pedido($dados);
        echo $this->view->render("redirect", [
            "title" => "Você Acabou De Realizar Um Pedido"
        ]);
    }

    public function venda(array $data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        if(@$data["vencimento"] == ""){
            if(date("D") != "Sun" || date("D") != "Mon" || date("D") != "Tue"){
                $expiration_date = date("Y-m-d", strtotime("+5 days"));
            } else if(date("D") == "Sat"){
                $expiration_date = date("Y-m-d", strtotime("+4 days"));
            } else {
                $expiration_date = date("Y-m-d", strtotime("+3 days"));
            }
        } else {
            $expiration_date = $data["vencimento"];
        }

        $venda = new Venda();
        $venda->transacao               = $data["transacao"];
        $venda->produto                 = $data["produto"];

        if(@$data["plano"])
        $venda->plano                   = $data["plano"];

        $venda->comprador               = $data["comprador"];
        $venda->produtor                = $data["produtor"];
        
        if(@$data["campanha"])
        $venda->campanha                = @$data["campanha"];

        $venda->afiliado                = @$data["afiliado"];
        $venda->comissao_afiliado       = @$data["comissao_afiliado"];
        $venda->meio_pagamento          = $data["meio_pagamento"];
        $venda->forma_pagamento         = $data["forma_pagamento"];
        $venda->status_transacao        = $data["status_transacao"];
        $venda->url_checkout            = @$data["url_checkout"];
        $venda->link_boleto             = @$data["link_boleto"];
        
        if(@$data["linha_digitavel"])
        $venda->linha_digitavel         = @$data["linha_digitavel"];

        $venda->valor_bruto             = @$data["valor_bruto"];
        $venda->valor_produto           = @$data["valor_produto"];
        $venda->valor_juros             = @$data["valor_juros"];
        $venda->valor_frete             = @$data["valor_frete"];
        $venda->taxa_juros              = @$data["taxa_juros"];
        $venda->taxa_octapay            = @$data["taxa_octapay"];
        $venda->valor_octapay           = @$data["valor_octapay"];
        $venda->valor_desconto          = @$data["valor_desconto"];
        $venda->valor_liquido           = @$data["valor_liquido"];
        $venda->parcelas                = @$data["parcela"];
        $venda->data_vencimento         = @$expiration_date;
        $venda->data_pedido             = date("Y-m-d");
        $venda->data_finalizada         = @$data["data_finalizada"];
        $venda->data_ultimo_evento      = @$data["data_ultimo_evento"];
        $venda->src                     = @$data["src"];
        $venda->utm_source              = @$data["utm_source"];
        $venda->utm_campaign            = @$data["utm_campaign"];
        $venda->utm_medium              = @$data["utm_medium"];
        $venda->utm_content             = @$data["utm_content"];
        $venda->st4rt                   = @$data["st4rt"];
        $venda->ip                      = @$_SERVER['REMOTE_ADDR'];

        foreach ($data as $chave => $valor) {
            @$texto .= '"' . $chave . '": "' . $valor . '",' . "\n";
        }
        $arquivo = fopen('log-vendas.txt','a+');
            
        if ($arquivo == false) 
            die('Não foi possível criar o arquivo.');
        $texto .= "}\n";
        $texto .= "#################################################";

        fwrite($arquivo, $texto . "\n\n");
        fclose($arquivo);

        if($venda->status_transacao == 5 && $venda->forma_pagamento == 1){
            $venda->motivo = "SALDO INSUFICIENTE OU DADOS INCORRETOS - OCTAPAY";
        }

        if(@$data["carrinho_abandonado"])
        $venda->carrinho_abandonado     = @$data["carrinho_abandonado"];
        
        $venda->coprodutores            = @$data["coprodutores"];
        //var_dump($venda);

        if($venda->save()){
            $dados["msg"] = "Venda salva com sucesso";
            $dados["venda"] = $venda->id;
            $data["venda"] = $venda->id;

            $postback = (new AppPostback(null))->enviarPostback(["venda" => $venda->id, "produto" => $venda->produto, "produtor" => $venda->produtor]);
            $endereco = (new AppUsuarios(null))->cadastroEndereco($data);
            $dados["endereco"] = $endereco;

            $venda = (new Venda())->findById($venda->id);
            $venda->endereco = $endereco;
            $venda->save();

            $whatsapp = (new AppProcessos())->processos($data);
            $dados["whatsapp"] = "Enviando... " . @$whatsapp;
            $dados["coprodutores"] = @$data["coprodutores"];
        } else {
            $dados["msg"] =  $venda->fail()->getMessage();
        }

        return $dados;
    }

    public function notificacao($data)
    {
        $content = http_build_query(array(
            "venda"             => @$data["venda"],
            "forma_pagamento"   => @$data["forma_pagamento"],
            "produto"           => @$data["produto"],
            "produtor"          => @$data["produtor"],
            "afiliado"          => @$data["afiliado"],
            "comissao_afiliado" => @$data["comissao_afiliado"],
            "transacao"         => @$data["transacao"],
        ));

        $context = stream_context_create(array(
            'http' => array(
                'method'  => 'POST',
                'header'=> "Content-type: application/x-www-form-urlencoded",
                'content' => $content,
            )
        ));

        $result = file_get_contents(url("notificacoes"), null, $context);
        //var_dump($result);
    }

    public function error(array $data)
    {
        echo $this->view->render("error", [
            "title" => "Erro {$data['errcode']} | " . SITE,
            "error" => $data["errcode"]
        ]);
    }    
}