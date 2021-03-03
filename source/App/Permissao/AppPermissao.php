<?php

namespace Source\App\Permissao;

session_start();

use League\Plates\Engine;
use Source\Models\Permissao\Permissao;
use Source\Models\Permissao\PermissaoModulo;
use Source\Models\Usuarios\Usuario;
use Source\App\Sessao\AppSessao;

class AppPermissao
{
    private $view;
    private $sessao;

    public function __construct($router)
    {
        $this->view = Engine::create(__DIR__ . "/../../../themes/tema2", "php");
        $this->view->addData(["router" => $router]);

        $this->sessao = (new AppSessao())->verificaSeLogado();
    }

    public function permissao($data)
    {
        echo $this->view->render("usuarios/permissao", [
            "title" => "Permissões",
            "msg" => "",
            "classCss" => ""
        ]);
    }

    public function usuarioPermissao($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $permissao = new Permissao();

        $verifica = $permissao->find("usuario = '{$_SESSION["id"]}' AND permitido = '{$data["permitido"]}'")->fecth();
        if($verifica){
            echo "Email já adicionado";
            exit;
        }

        $permissao->usuario = $_SESSION["id"]; // ID DE USUÁRIO QUE ESTÁ DANDO AS PERMISSÕES
        $permissao->permitido = $data["permitido"]; // ID DE USUÁRIO QUE IRÁ RECEBER AS PERMISSÕES
        $permissao->ativo = 1;

        if($permissao->save()){
            echo "Email adicionado com sucesso!";
        }
        else {
            echo "Erro ao adicionar";
        }
    }

    public function permissaoModulo($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $permissao = new PermissaoModulo();

        $permissao->usuario = $_SESSION["id"]; // ID DE USUÁRIO QUE ESTÁ DANDO AS PERMISSÕES
        $permissao->permitido = $data["permitido"]; // ID DE USUÁRIO QUE IRÁ RECEBER AS PERMISSÕES
        $permissao->modulo = $data["modulo"];
        $permissao->acesso = $data["acesso"];
        $permissao->incluir = @$data["incluir"];
        $permissao->alterar = @$data["alterar"];
        $permissao->excluir = @$data["excluir"];

        if($permissao->save()){
            echo "Permissões salvas com sucesso!";
        }
        else {
            echo "Erro ao salvar";
        }
    }

}
