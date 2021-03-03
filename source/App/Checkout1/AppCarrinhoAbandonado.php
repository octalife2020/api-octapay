<?php

namespace Source\App\Checkout1;

session_start();

use League\Plates\Engine;
use Source\Helpers\Emails;

use Source\Models\CarrinhoAbandonado\CarrinhoAbandonado;
use Source\Models\Vendas\Venda;
use Source\Models\Produtos\Produto;
use Source\Models\Afiliados\Afiliacao;
use Source\Helpers\Paginador;
use Source\App\Sessao\AppSessao;
use Source\App\Postback\AppPostback;

class AppCarrinhoAbandonado
{
    private $view;
    private $sessao;
    private $tema;

    public function __construct($router)
    {
        $this->tema = @$_SESSION["tema"] ? @$_SESSION["tema"] : "tema1";

        $this->view = Engine::create(__DIR__ . "/../../../themes/$this->tema", "php");
        $this->view->addData(["router" => $router]);
        //$this->sessao = (new AppSessao())->verificaSeLogado();
    }
    
    public function abandonos($data)
    {
        $this->sessao = (new AppSessao())->verificaSeLogado();

        $filtros = $this->filtros();
        //var_dump($filtros);

        $paginador = new Paginador();
        $pagina = @$data["page"];
        $offset = 30;

        if(@$_SESSION["tipo"] == 4){
            if($filtros)
                $filtros .= " AND ";

            $busca = $filtros . "(produtor = " . @$_SESSION["id"] . ")";
        }
        else {
            $busca = $filtros;
        }

        //echo "id u ".$_SESSION["idU"];var_dump($busca);

        $vendasCount = (new CarrinhoAbandonado())->find($busca)->count();
        $paginas = ceil($vendasCount / 30);
        $vendas = (new CarrinhoAbandonado())->find($busca)->limit($offset)->offset($paginador->paginador($pagina, $offset))->order("id DESC")->fetch(true);
        $produtos = new Produto();
        //var_dump($vendasCount);

        echo $this->view->render("vendas/abandonos", [
            "title" => "Abandono de checkout",
            "vendas" => $vendas,
            "produtos" => $produtos,
            "count" => $vendasCount,
            "paginador" => $paginador,
            "total" => $paginas,
            "pagina" => @$data["page"],
            "msg" => @$data["msg"],
            "classCss" => @$data["classCss"]
        ]);
    }

    public function filtros()
    {
        $inicio = @$_GET["inicio"];
        $fim = @$_GET["fim"];
        $produto = @$_GET["produto"];
        $comprador = @$_GET["comprador"];
        $sql = array();

        if($inicio != "" || $fim !=""){
            if($inicio == "")
                $inicio = date("Y-m-d");

            if($fim == "")
                $fim = date("Y-m-d");

            $sql[] = "created_at BETWEEN '{$inicio} 00:00:00' AND '{$fim} 23:59:59'";
        }

        if($produto != "") {
            $sql[] = "produto = $produto";
        }

        if($comprador != "") {
            $sql[] = "nome LIKE '%$comprador%' OR cpf_cnpj = '$comprador' OR email LIKE '%$comprador%'";
        }

        $result = count($sql);
        
        for($i = 0; $i < $result - 1; $i++) {
            $sql[$i] .= " AND";
        }
        
        return implode(" ", $sql);
        
    }

    public function cadastroCarrinho(array $data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $carrinho = new CarrinhoAbandonado();

        $plano = @$data["plano"] ? " OR plano = " . @$data["plano"] : "";
        $produto = @$data["produto"];
        $cpf = @$data["cpf"];

        if(@$cpf == ""){
            $dados["msg"] = "CPF vazio";
            echo json_encode($dados);
            exit;
        }
        $busca = $carrinho->find("cpf_cnpj = '$cpf' AND (produto = $produto $plano)")->fetch();
        //var_dump($busca);
        if (@$busca) {
            $dados["msg"] = "Carrinho já cadastrado";
            $dados["msg"] .= " $cpf $produto $plano";
            $dados["carrinho"] = $busca->id.$busca->nome;

            $carrinho = (new CarrinhoAbandonado())->findById($busca->id);
            $carrinho->nome             = @$data["nome"];
            $carrinho->email            = @$data["email"];
            $carrinho->telefone         = @$data["telefone"];
            $carrinho->cpf_cnpj         = @$data["cpf"];
            $carrinho->cep              = @$data["cep"];
            $carrinho->rua              = @$data["rua"];
            $carrinho->numero           = @$data["numero"];
            $carrinho->complemento      = @$data["complemento"];
            $carrinho->bairro           = @$data["bairro"];
            $carrinho->cidade           = @$data["cidade"];
            $carrinho->estado           = @$data["estado"];
            $carrinho->url_checkout     = @$data["url_checkout"];

            if($carrinho->save()){
                $dados["msg1"] =  "Dados atualizados";
            } else {
                $dados["msg"] =  $carrinho->fail()->getMessage();
            }
        } else {

            $carrinho->produtor         = @$data["produtor"];
            $carrinho->produto          = @$data["produto"];

            if(@$data["plano"])
            $carrinho->plano            = @$data["plano"];

            if(@$data["afiliado"])
            $carrinho->afiliado         = @$data["afiliado"];
            
            if(@$data["campanha"])
            $carrinho->campanha         = @$data["campanha"];

            $carrinho->nome             = @$data["nome"];
            $carrinho->email            = @$data["email"];
            $carrinho->telefone         = @$data["telefone"];
            $carrinho->cpf_cnpj         = @$data["cpf"];
            $carrinho->cep              = @$data["cep"];
            $carrinho->rua              = @$data["rua"];
            $carrinho->numero           = @$data["numero"];
            $carrinho->complemento      = @$data["complemento"];
            $carrinho->bairro           = @$data["bairro"];
            $carrinho->cidade           = @$data["cidade"];
            $carrinho->estado           = @$data["estado"];
            $carrinho->url_checkout     = @$data["url_checkout"];
            
            //var_dump($carrinho);

            function comprador($data){
                $comprador  = "Nome: " . $data["nome"] . "<br>";
                $comprador .= "Email: <a href='{$data["email"]}'>" . $data["email"] . "</a><br>";
                $comprador .= "Telefone: " . $data["ddd"] . $data["telefone"] . "<br>";
                $comprador .= "Cidade: " . $data["cidade"] . "<br>";
                $comprador .= "Estado: " . $data["estado"] . "<br><br>";
                
                return $comprador;
            }

            if($carrinho->save()){
                $dados["id"] = $carrinho->id;

                $data["id_produto"] = $data["produto"];
                $data["comprador"] = comprador($data);
                $data["nome"] = $carrinho->dataProdutor()->nome;
                $data["email"] = $carrinho->dataProdutor()->email;
                $data["produto"] = $carrinho->dataProduto()->nome;
                
                if(@$data["plano"])
                    $data["plano"] = $carrinho->dataPlano()->nome;

                /*$boleto = (new Emails())->carrinhoAbandonado($data);
                $enviaEmail = (new Emails())->enviaSendGrid($boleto);

                $dados["email"] = $enviaEmail;*/

                $data["carrinho"] = $carrinho->id;
                $data["produto"] = $data["id_produto"];
                $postback = (new AppPostback(null))->enviarPostbackCarrinho($data);
                $dados["postback"] = @$postback;
            } else {
                $dados["msg"] =  $carrinho->fail()->getMessage();
            }
        }
        
        echo json_encode($dados);

    }

    public function excluirCarrinho($data)
    {
        $vendas = (new Venda())->find("carrinho_abandonado IS NOT NULL")->fetch(true);
        $contarVendas = (new Venda())->find("carrinho_abandonado IS NOT NULL")->count();
        $carrinho = new CarrinhoAbandonado();
        //var_dump($contarVendas);

        if($vendas){
            foreach ($vendas as $venda) {
                echo "<h4>Carrinho abandonado encontrado em venda</h4>";
                echo "<b>Venda: </b> $venda->id - $venda->transacao | <b>Carrinho:</b> $venda->carrinho_abandonado <br>";

                $abandono = $carrinho->findById($venda->carrinho_abandonado);
                echo "Nome: $abandono->nome <br>";
                $abandono->destroy();
                $venda->carrinho_abandonado = NULL;
                if($venda->save()){
                    echo "Venda atualizada<br>";
                } else {
                    echo $venda->fail()->getMessage() . "<br>";
                }
            }
        }
    }    
}