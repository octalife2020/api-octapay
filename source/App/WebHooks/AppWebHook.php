<?php

//CLASSE QUE CONTROLA AS ROTAS DOS CLIENTES

namespace Source\App\WebHooks;

use Moip\Moip;
use Moip\Auth\BasicAuth;

use Source\Models\Vendas\Venda;
use Source\Models\Configuracoes\ConfiguracaoCheckout;
use Source\App\Checkout1\AppProcessos;

class AppWebHook
{
    private $endpoint;
    private $token;
    private $key;
    
    public function criarNotificacaoWebhook($data)
    {
        /*$token = 'K5DRSX8C9CVGZMQGEFMMT03YVQOKJTYF';
        $key = 'LWSLY0OKFYUYJAV1LAQSSMNYOL6OVGK4KCED87FO';*/

        // AMBIENTE PRODUÇÃO
        /*$token = 'AVR8C7GI6HJCLIAUH41SB75MQGTMPKCN';
        $key = 'UWXSO3C1ZBCK8UUYB2J2YLRMNK2KFPTCEPV47CVW';*/

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

        $moip = new Moip(new BasicAuth($this->token, $this->key), ENDPOINT);

        $url = url("webhook");
        $notification = $moip->notifications()
            ->addEvent('PAYMENT.AUTHORIZED')
            ->addEvent('PAYMENT.CANCELLED')
            ->addEvent('REFUND.COMPLETED')
            ->setTarget($url)
            ->create();
        print_r($notification);

    }
    public function webhook($data)
    {
        // Pega o RAW data da requisição
        $json = file_get_contents('php://input');
        // Converte os dados recebidos
        $response = json_decode($json);

        if($response->event == "PAYMENT.AUTHORIZED"){
            $status = 4;
            $payID = $response->resource->payment->id;
            $finalizada = date("Y-m-d H:i:s");
            $ultimo_evento = $finalizada;
        } 
        else if($response->event == "PAYMENT.CANCELLED"){
            $status = 5;
            $payID = $response->resource->payment->id;
            $motivo = @$response->resource->payment->cancellationDetails->description;
            $ultimo_evento = date("Y-m-d H:i:s");
            $finalizada = date("Y-m-d H:i:s");
        } 
        else if($response->event == "REFUND.COMPLETED"){
            $status = 6;
            $payID = $response->resource->refund->_links->payment->title;
            $ultimo_evento = date("Y-m-d H:i:s");
            $finalizada = date("Y-m-d H:i:s");
        }

        $venda = (new Venda())->find("transacao = '$payID'")->fetch();
        if($venda){
            echo @$finalizada . "<br>";
            $venda->status_transacao = $status;
            $venda->data_finalizada = @$finalizada != "" ? $finalizada : "0000-00-00 00:00:00";
            $venda->data_ultimo_evento = $ultimo_evento;
            
            if(@$motivo)
                $venda->motivo = $motivo;

            if($venda->save()){
                $msg = "Salvo";
            } else {
                $msg = $venda->fail()->getMessage();
            }
        }

        
        $arquivo = fopen('webhook.json','a+');
        $arquivo2 = fopen('webhook2.json','a+');
        fwrite($arquivo, $json . "\n\n");
        fwrite($arquivo2, "$status - $payID - $msg\n");
        fclose($arquivo);
        fclose($arquivo2);

        if($venda->endereco){
            $dados["nome"] = $venda->dataEndereco()->nome;
            $dados["email"] = $venda->dataEndereco()->email;
            $dados["telefone"] = $venda->dataEndereco()->telefone;
        } else {
            $dados["nome"] = $venda->dataComprador()->nome;
            $dados["email"] = $venda->dataComprador()->email;
            $dados["telefone"] = $venda->dataComprador()->telefone;
        }

        $dados["status_transacao"] = $status;
        $dados["transacao"] = $payID;
        $dados["produtor"] = $venda->produtor;

        if(@$venda->afiliado)
        $dados["afiliado"] = $venda->afiliado;

        $dados["valor_bruto"] = $venda->valor_bruto;
        $dados["valor_produto"] = $venda->valor_produto;
        $dados["valor_desconto"] = $venda->valor_desconto;

        if(@$venda->plano){
            $dados["nomekit"] = $venda->dataPlano()->nome;
            $dados["produto"] = $venda->dataPlano()->nome;
        }
        else {
            $dados["nomekit"] = $venda->dataProduto()->nome;
            $dados["produto"] = $venda->dataProduto()->nome;
        }

        $processos = (new AppProcessos())->processos($dados);

        $arquivo = fopen('processos.txt','a+');
        fwrite($arquivo, implode($dados) . "\n");
        fclose($arquivo);
    }

    public function webhookVendas($data)
    {
        $forma_pagamento = array(
            1 => "CARTÃO DE CRÉDITO",
            2 => "BOLETO"
        );

        $status_transacao = array(
            1 => "Aguardando pagamento",
            2 => "EM ANÁLISE",
            3 => "PRÉ AUTORIZADA",
            4 => "Finalizada",
            5 => "Cancelada",
            6 => "DEVOLVIDA",
            7 => "CHARGEBACK",
            8 => "CONCLUÍDA",
            9 => "BLOQUEADA"
        );

        $vendas = (new Venda())->find("st4rt = 1 AND postback_st4rt = 0 AND status_transacao = 4")->fetch(true);
        if($vendas){
            echo "Tem vendas<br>";
            foreach($vendas as $venda){

                echo $venda->id . " - " . $venda->transacao . "<br>";

                $content = http_build_query(array(
                    'chave_unica'        => 'db890335eaf4a7cb8df604ec01fdaf17',
                    'codigoProduto'      => $venda->dataProduto()->codigo,
                    'nomeProduto'        => @$venda->dataPlano()->nome . " - " . $venda->dataProduto()->nome,
                    'codVenda'           => $venda->transacao,
                    'codPlano'           => @$venda->dataPlano()->codigo,
                    'dataInicio'         => $venda->created_at,
                    'dataFim'            => $venda->data_finalizada,
                    'formaPagamento'     => $forma_pagamento[$venda->forma_pagamento],
                    'statusVenda'        => $status_transacao[$venda->status_transacao],
                    'valorVenda'         => $venda->valor_bruto,
                    'linkBoleto'         => $venda->link_boleto,
                    'nomeComprador'      => $venda->dataComprador()->nome,
                    'email'              => $venda->dataComprador()->email,
                    'cnpj_cpf'           => $venda->dataComprador()->cpf_cnpj,
                    'telefone'           => $venda->dataComprador()->telefone,
                    'cep'                => $venda->dataComprador()->cep_entrega,
                    'endereco'           => $venda->dataComprador()->rua_entrega,
                    'numero'             => $venda->dataComprador()->numero_entrega,
                    'complemento'        => $venda->dataComprador()->complemento_entrega,
                    'bairro'             => $venda->dataComprador()->bairro_entrega,
                    'cidade'             => $venda->dataComprador()->cidade_entrega,
                    'estado'             => $venda->dataComprador()->estado_entrega,
                    'pais'               => $venda->dataComprador()->pais_entrega,
                    'nomeProdutor'       => $venda->dataProdutor()->nome,
                    'emailProdutor'      => $venda->dataProdutor()->email,
                    'afiliado'           => @$venda->dataAfiliado()->nome,
                    'fonte-pedido'       => "OctaPay"
                ));

                //var_dump($content, "<br><br>");

                $context = stream_context_create(array(
                    'http' => array(
                        'method'  => 'POST',
                        'header'=> "Content-type: application/x-www-form-urlencoded",
                        'content' => $content,
                    )
                ));
                
                //$result = file_get_contents('http://localhost/sistema/pedidos-hubsale', null, $context);
                $result = file_get_contents('https://st4rt.com.br/painel/pedidos-hubsale', null, $context);

                var_dump($result);

                $pedigo = (new Venda())->findById($venda->id);
                $pedigo->postback_st4rt = 1;
                $pedigo->save();
            }
        } else {
            echo "Nenhuma venda corresponde à pesquisa<br>";
        }
    }
}