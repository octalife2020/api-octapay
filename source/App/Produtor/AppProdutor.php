<?php

//CLASSE QUE CONTROLA AS ROTAS DOS PRODUTORES

namespace Source\App\Produtor;

session_start();

use League\Plates\Engine;

use Source\Models\Produtor\Produtor;
use Source\Models\Produtos\Produto;
use Source\Models\Usuarios\Usuario;
use Source\Models\Usuarios\UsuarioDados;
use Source\Helpers\Paginador;
use Source\Models\Vendas\Venda;
use Source\App\Sessao\AppSessao;

class AppProdutor
{
    private $view;
    private $sessao;
    private $tema;

    public function __construct($router)
    {
        $this->tema = @$_SESSION["tema"] ? @$_SESSION["tema"] : "tema1";
        $this->view = Engine::create(__DIR__ . "/../../../themes/$this->tema", "php");
        $this->view->addData(["router" => $router]);

        $this->sessao = (new AppSessao())->verificaSeLogado();
    }

    public function produtor($data)
    {
        $filtros = $this->filtros();
        
        $paginador = new Paginador();
        $pagina = @$data["page"];
        $offset = 30;
        $produtorCount = (new Usuario())->find($filtros)->count();
        $paginas = ceil($produtorCount / $offset);
        $usuarios = (new Usuario())->find($filtros)->limit($offset)->offset($paginador->paginador($pagina, $offset))->fetch(true);
        $usuarioDados = new UsuarioDados();
        $vendas = (new Venda());

        /*$usuario = (new Usuario())->find("chave_unica is null")->fetch(true);
        foreach ($usuario as $usuario) {
            $user = (new Usuario())->findById($usuario->id);
            $user->chave_unica = md5(time().$usuario->nome);
            $user->save();
        }*/

        echo $this->view->render("produtor", [
            "title" => "Usuários",
            "usuarios" => $usuarios,
            "usuarioDados" => $usuarioDados,
            "vendas" => $vendas,
            "paginador" => $paginador,
            "total" => $paginas,
            "pagina" => @$data["page"] ? $data["page"] : 1,
            "msg" => @$data["msg"],
            "classCss" => @$data["classCss"]
        ]);
    }

    public function filtros()
    {
        $tipo = @$_GET["tipo"];
        $grupo = @$_GET["grupo"];
        $status = @$_GET["status"];
        $nome = @$_GET["nome"];
        $st4rt = @$_GET["st4rt"];
        $sql = array();

        if($tipo != "") {
            $sql[] = "tipo_usuario = $tipo";
        }

        if($grupo != "") {
            $sql[] = "grupo = $grupo";
        }

        if($status != "") {
            $sql[] = "ativo = $status";
        }

        if($nome != "") {
            $sql[] = "(nome LIKE '%$nome%' OR email LIKE '%$nome%')";
        }

        if($st4rt != "") {
            $sql[] = "cliente_st4rt = $st4rt";
        }

        $result = count($sql);
        
        for($i = 0; $i < $result - 1; $i++) {
            $sql[$i] .= " AND";
        }
        
        return implode(" ", $sql);
    }

    public function editarProdutor($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $produtor = (new Usuario())->findById($data["id"]);
        $produtor->tempo_saque = $data["tempo_saque"];
        //$produtor->taxa_saque = $data["taxa_saque"];
        $produtor->taxa_octapay = @$data["taxa_octapay"];
        $produtor->observacao = @$data["observacao"];
        $produtor->ativo = $data["ativo"];
        $produtor->grupo = $data["grupo2"];
        $produtor->cliente_st4rt = $data["cliente_st4rt"];
        $produtor->status = $data["status_user"];
        
        if($produtor->save()){
            echo "Atualizado Com Sucesso!";
        } 
        else {
            echo $produtor->fail()->getMessage();
        }
    }

    public function inativarProdutor($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $produtor = (new Usuario())->findById($data["id"]);
        $produtor->ativo = $data["ativo"];
        if($produtor->save()){
            echo "Atualizado com sucesso";
        } else {
            echo $produtor->fail()->getMessage();
        }
    }

    private function deleteProdutor(array $data): void
    {
        if(empty($data["id"])) {
            return;
        }

        $id = filter_var($data["id"], FILTER_VALIDATE_INT);
        $user = (new Produtor())->findById($id);
        if($user) {
            $user->destroy();
        }

        $callback["remove"] = true;
        echo json_encode($callback);
    }
}