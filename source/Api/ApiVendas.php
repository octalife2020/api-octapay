<?php

//CLASSE QUE CONTROLA AS ROTAS DOS AFILIADOS

namespace Source\Api;

session_start();

use League\Plates\Engine;

use Source\Models\Afiliados\Afiliacao;
use Source\Models\Usuarios\Usuario;
use Source\Models\Usuarios\UsuarioDados;
use Source\Models\Vendas\Venda;
use Source\Models\Api;

use Source\Helpers\Paginador;
use Source\Helpers\Emails;

class ApiVendas
{
    public $version = 1.0;
    private $view;
    private $api;
    private $tema;

    public function __construct($router)
    {
        $this->tema = @$_SESSION["tema"] ? @$_SESSION["tema"] : "tema1";
        $this->view = Engine::create(__DIR__ . "/../../../themes/$this->tema", "php");
        $this->view->addData(["router" => $router]);
    }

    public function buscaVendas($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $usuario = (new Api())->find("token = '$token' AND chave = '$chave'")->fetch();
        $filtros = $this->filtros($data);

        $paginador = new Paginador();
        $pagina = @$data["page"];
        $offset = 30;

        $vendasCount = (new Venda())->find($filtros)->count();
        $paginas = ceil($vendasCount / 30);
        $vendas = (new Venda())->find($filtros)->limit($offset)->offset($paginador->paginador($pagina, $offset))->order("id DESC")->fetch(true);
    }

    public function filtros($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);
        
        $transacao_inicio =     @$data["transacao_inicio"];
        $transacao_fim =        @$data["transacao_fim"];
        $finalizada_inicio =    @$data["finalizada_inicio"];
        $finalizada_fim =       @$data["finalizada_fim"];

        $status_transacao =     @$data["status_transacao"];
        $venda =                @$data["venda"];
        $forma_pagamento =      @$data["forma_pagamento"];
        $produto =              @$data["produto"];
        
        $sql = array();

        if($transacao_inicio != "" || $transacao_fim !=""){
            $sql[] = "(created_at BETWEEN '{$transacao_inicio} 00:00:00' AND '{$transacao_fim} 23:59:59')";
        }

        if($finalizada_inicio != "" || $finalizada_fim !=""){
            $sql[] = "(data_finalizada BETWEEN '{$finalizada_inicio} 00:00:00' AND '{$finalizada_fim} 23:59:59')";
        }

        if($venda != "") {
            $sql[] = "transacao = '$venda' OR id = '$venda'";
        }

        if($status_transacao != "") {
            $sql[] = "status_transacao = $status_transacao";
        }

        if($produto != "") {
            $sql[] = "produto = $produto";
        }

        if($forma_pagamento != "") {
            $sql[] = "forma_pagamento = $forma_pagamento";
        }

        $result = count($sql);
        
        for($i = 0; $i < $result - 1; $i++) {
            $sql[$i] .= " AND";
        }
        
        return implode(" ", $sql);
    }

    public function afiliacaoExcluir($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $afiliacao = (new Afiliacao())->findById($data["id"]);
        if($afiliacao->destroy()){
            echo "Excluido com sucesso";

            $email = new Emails();
            $usuario = (new Usuario())->findById($afiliacao->afiliado);
            $data["nome"] = $usuario->nome;
            $data["email"] = $usuario->email;
            $data["produto"] = $afiliacao->dataProduto()->nome;
            
            $emailAfiliado = $email->afiliacaoExcluir($data);
            $email->enviaSendGrid($emailAfiliado);
        }
        else {
            echo "Erro ao excluir <br>";
            echo $afiliacao->fail()->getMessage();
        }
    }

    public function afiliacaoExcluirTodos($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $afiliacao = (new Afiliacao())->find("produto = " . $data["id"])->fetch(true);
        
        if($afiliacao){
            foreach($afiliacao as $afiliacao){
                $afiliacao->destroy();
            }
        }
    }

    public function afiliados($data)
    {
        $paginador = new Paginador();
        $pagina = @$data["page"];
        $offset = 10;
        $afiliadoCount = (new Usuario())->find("tipo_usuario = 5")->count();
        $paginas = ceil($afiliadoCount / $offset);
        $afiliado = (new Usuario())->find("tipo_usuario = 5")->limit($offset)->offset($paginador->paginador($pagina, $offset))->order("grupo DESC")->fetch(true);
        $afiliadoDados = new UsuarioDados();
        $vendas = (new Venda());
        echo $this->view->render("afiliados", [
            "title" => "Afiliados",
            "afiliado" => $afiliado,
            "count" => $afiliadoCount,
            "afiliadoDados" => $afiliadoDados,
            "vendas" => $vendas,
            "paginador" => $paginador,
            "total" => $paginas,
            "pagina" => @$data["page"] ? $data["page"] : 1,
            "msg" => @$data["msg"],
            "classCss" => @$data["classCss"]
        ]);
    }

    public function editarAfiliado($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $afiliado = (new Usuario())->findById($data["id"]);
        $afiliado->tempo_saque = $data["tempo_saque"];
        $afiliado->taxa_saque = $data["taxa_saque"];
        $afiliado->observacao = @$data["observacao"];
        $afiliado->ativo = $data["ativo"];
        $afiliado->grupo = $data["grupo"];
        
        if($afiliado->save()){
            echo "Atualizado Com Sucesso!";
        } 
        else {
            echo $afiliado->fail()->getMessage();
        }
    }

    public function inativarAfiliado($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $afiliado = (new Usuario())->findById($data["id"]);
        $afiliado->ativo = $data["ativo"];
        if($afiliado->save()){
            echo "Atualizado com sucesso";
        } else {
            echo $afiliado->fail()->getMessage();
        }
    }
}