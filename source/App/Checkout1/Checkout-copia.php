<?php

namespace Source\App;

use PagarMe\Client;
use Source\Models\Kit;
use Source\Models\Pedido;
use Source\Models\Comprador;
use League\Plates\Engine;
use Source\App\Validacao;

class Checkout
{
    private $view;
    protected $validacao;
    public function __construct($router)
    {
        $this->view = Engine::create(__DIR__ . "/../../pagamentos", "php");
        $this->view->addData(["router" => $router]);
        $this->validacao = new Validacao();
    }
    
    public function home($data):void
    {
        echo $this->view->render("checkout", [
            "title" => "Produto Não Encontrado | " . SITE,
            "mensagem" => "Produto Não Encontrado",
            "dados" => false
        ]);
    }

    public function produto($data):void
    {
        $kit = $data["plano"];
        $plano = (new Kit())->find("codigo_plano = :plano", "plano={$kit}")->fetch(true);
        foreach ($plano as $kit) {
            $nome = $kit->nome;
        }
        echo $this->view->render("checkout", [
            "title" => $nome . " | " . SITE,
            "mensagem" => "Produto Não Encontrado",
            "plano" => $plano
        ]);
    }

    public function transacao($data) 
    {
        $data["cpf"] = $this->validacao->limpaStr($data["cpf"]);
        $data["cep"] = $this->validacao->limpaStr($data["cep"]);
        $data["telefone"] = $this->validacao->limpaStr($data["telefone"]);

        $validaCpf   = $this->validacao->validaCPF($data["cpf"]);
        $validaTel   = $this->validacao->validaTel($data["telefone"]);
        $validaCep   = $this->validacao->validaCep($data["cep"]);
        $validaEmail = $this->validacao->validaEmail($data["email"]);

        if ($validaCpf == false || $validaTel == false || $validaCep == false || $validaEmail == false) {
            echo $this->view->render("validacao", [
                "title" => "Dados Inválidos | " . SITE,
                "mensagem" => "Verifique os dados pessoais e tente novamente"
            ]);
            exit;
        }
        if($data["complemento"] == "") {
            $data["complemento"] = "default";
        }
        if ($data["pagamento"] == "boleto") {
            $this->boleto($data);
        }
        else if ($data["pagamento"] == "credit_card") {
            if($data["numcart"] == "" || $data["titular"] == "" || $data["validade"] == "" || $data["cvv"] == ""){
                echo $this->view->render("validacao", [
                    "title" => "Dados Inválidos | " . SITE,
                    "mensagem" => "Verifique os dados pessoais e do cartão e tente novamente"
                ]);
                exit;
            }
            else {
                $this->cartao($data);
            }
        }
        echo json_encode($data);
    }

    

    public function boleto($data)
    {
        $pagarme = new Client(PAGARME_API_KEY);

        $preco = explode(".", $data["preco"], 2);
        $preco = $preco[0].@$preco[1];

        $transaction = $pagarme->transactions()->create([
          'amount' => $preco,
            'payment_method' => 'boleto',
            'async' => false,
            'customer' => [
                'external_id' => '1',
                'name' => $data["nome"],
                'type' => 'individual',
                'country' => 'br',
                'documents' => [
                [
                    'type' => 'cpf',
                    'number' => $data["cpf"]
                ]
                ],
                'phone_numbers' => ["+55{$data["telefone"]}"],
                'email' => $data["email"],
            ],
            'postback_url' => "http://checkout.octa.life/postback",
            'boleto_instructions' => "Caixa, não receber pagamento após o vencimento.",
            'shipping' => [
                'name' => $data["nome"],
                'fee' => $data["frete"],
                'address' => [
                    'country' => 'br',
                    'street' => $data["rua"],
                    'street_number' => $data["numero"],
                    'state' => $data["estado"],
                    'city' => $data["cidade"],
                    'neighborhood' => $data["bairro"],
                    'zipcode' => $data["cep"],
                    'complementary' => $data["complemento"]
                ]
            ],
            'items' => [
                [
                'id' => "{$data["planokit"]}",
                'title' => "{$data["nomekit"]}",
                'unit_price' => (int) $preco,
                'quantity' => (int) $data["qtd"],
                'tangible' => true
                ]
            ]
        ]);

        if($transaction->status == "waiting_payment") {
            $pedido = array(
                "status" => $transaction->status,
                "tid" => $transaction->tid,
                "boleto_url" =>$transaction->boleto_url
            );
            $dados = array($data, $pedido);
            $this->pedido($dados);
            header("Location: /pedido-reservado?boleto=".$pedido["boleto_url"]);
        }
    }

    public function cartao($data)
    {
      $pagarme = new Client(PAGARME_API_KEY);

      $preco = number_format($this->validacao->montante($data["parcelas"], 0.0199, $data["preco"]), 2);
      $preco = explode(".", $preco, 2);
      $preco = $preco[0].@$preco[1];

      $validade = explode("/", $data["validade"], 2);
      $validade = $validade[0].@$validade[1];

      $transaction = $pagarme->transactions()->create([
        'amount' => $preco,
        'payment_method' => 'credit_card',
        'card_holder_name' => $data["titular"],
        'card_cvv' => $data["cvv"],
        'card_number' => $data["numcart"],
        'card_expiration_date' => $validade,
        'installments' => $data["parcelas"],
        //'postback_url' => "http://checkout.octa.life/postback",
        'customer' => [
            'external_id' => '1',
            'name' => $data["nome"],
            'type' => 'individual',
            'country' => 'br',
            'documents' => [
              [
                'type' => 'cpf',
                'number' => $data["cpf"]
              ]
            ],
            'phone_numbers' => ["+55{$data["telefone"]}"],
            'email' => $data["email"]
        ],
        'billing' => [
            'name' => $data["nome"],
            'address' => [
                'country' => 'br',
                'street' => $data["rua"],
                'street_number' => $data["numero"],
                'state' => $data["estado"],
                'city' => $data["cidade"],
                'neighborhood' => $data["bairro"],
                'zipcode' => $data["cep"]
            ]
        ],
        'shipping' => [
            'name' => $data["nome"],
            'fee' => $data["frete"],
            'address' => [
                'country' => 'br',
                'street' => $data["rua"],
                'street_number' => $data["numero"],
                'state' => $data["estado"],
                'city' => $data["cidade"],
                'neighborhood' => $data["bairro"],
                'zipcode' => $data["cep"],
                'complementary' => $data["complemento"]
            ]
        ],
        'items' => [
            [
            'id' => "{$data["planokit"]}",
            'title' => "{$data["nomekit"]}",
            'unit_price' => (int) $preco,
            'quantity' => (int) $data["qtd"],
            'tangible' => true
            ]
        ]
      ]);

        $pedido = array(
            "status" => $transaction->status,
            "tid" => $transaction->tid,
            "boleto_url" => "credit_card"
        );
        if($transaction->status == "paid"){
            $dados = array($data, $pedido);
            $this->pedido($dados);
            header("Location: /obrigado?title=Obrigado Pela Compra");
        }
        else if($transaction->status == "processing") {
            $dados = array($data, $pedido);
            $this->pedido($dados);
            header("Location: /processando");
        }
        else if($transaction->status == "refused") {
            $dados = [$data, $transaction];
            $this->pedido($dados);
            echo $this->view->render("desaprovado", [
                "title" => "Compra não autorizada | " . SITE,
                "transaction" => $transaction
            ]);
        }
    }

    public function obrigadoCartao($data)
    {
        echo $this->view->render("obrigado_cartao", [
            "title" => "Obrigado Pela Compra | " . SITE,
        ]);
    }

    public function obrigadoProcessando($data)
    {
        echo $this->view->render("obrigado", [
            "title" => "Recebemos Seu Pedido | " . SITE,
        ]);
    }

    public function obrigadoBoleto($data)
    {
        $dados = $_GET;
        echo $this->view->render("obrigado_boleto", [
            "title" => "Pedido Reservado | " . SITE,
            "boleto" => $dados["boleto"]
        ]);
    }

    public function pedido(array $data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $comprador = new Comprador();
        $pedido = new Pedido();
        $kit = new Kit();

        $cpf = $comprador->find("cpf = :cpf", "cpf={$data[0]['cpf']}")->fetch(true);

        $nome = explode(" ", $data[0]["nome"], 2);
        $comprador->nome = $nome[0];
        $comprador->sobrenome = $nome[1];
        $comprador->email = $data[0]["email"];
        $comprador->telefone = $data[0]["telefone"];
        $comprador->rua = $data[0]["rua"];
        $comprador->numero = $data[0]["numero"];
        $comprador->bairro = $data[0]["bairro"];
        $comprador->cidade = $data[0]["cidade"];
        $comprador->estado = $data[0]["estado"];
        $comprador->cep = $data[0]["cep"];

        $comprador->add("ativo", $data[0]["complemento"], "BR");

        if($cpf) {
            foreach ($cpf as $cpf) {
                $pedido->id_comprador = $cpf->id;
            }
            $nome = explode(" ", $data[0]["nome"], 2);
            $cpf->nome = $nome[0];
            $cpf->sobrenome = $nome[1];
            $cpf->email = $data[0]["email"];
            $cpf->telefone = $data[0]["telefone"];
            $cpf->rua = $data[0]["rua"];
            $cpf->numero = $data[0]["numero"];
            $cpf->bairro = $data[0]["bairro"];
            $cpf->cidade = $data[0]["cidade"];
            $cpf->estado = $data[0]["estado"];
            $cpf->cep = $data[0]["cep"];
            $cpf->cpf = $data[0]["cpf"];

            $cpf->add("ativo", $data[0]["complemento"], "BR");
            if(!$cpf->save()){
                echo "t1 ".$cpf->fail()->getMessage();
            }
        }
        else {
            $comprador->cpf = $data[0]["cpf"];
            if(!$comprador->save()){
                echo "t2 ". $comprador->fail()->getMessage();
            }
            
            $cpf = $comprador->find("cpf = :cpf", "cpf={$data[0]['cpf']}")->fetch(true);
            $pedido->id_comprador = $comprador->id;
        }

        $pedido->id_kit = $data[0]["idkit"];
        $pedido->data_pedido = date("Y-m-d");
        $pedido->pagamento = $data[0]["pagamento"];
        $pedido->id_cliente = $data[0]["idcliente"];
        $pedido->status_pagamento = $data[1]["status"];
        $pedido->status_pedido = "pendente";
        $pedido->codigo_venda = $data[1]["tid"];
        $pedido->link_boleto = $data[1]["boleto_url"];
        $pedido->save();
    }

    public function error(array $data):void
    {
        echo $this->view->render("error", [
            "title" => "Erro {$data['errcode']} | " . SITE,
            "error" => $data["errcode"]
        ]);
    }    
}