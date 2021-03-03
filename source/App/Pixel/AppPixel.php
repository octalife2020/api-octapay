<?php

//CLASSE QUE CONTROLA AS ROTAS DOS USUÁRIOS

namespace Source\App\Pixel;

session_start();

use League\Plates\Engine;
use Source\Models\Pixel\Pixel;
use Source\App\Sessao\AppSessao;
use Source\Helpers\Paginador;

class AppPixel
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

    public function pixel($data)
    {
        $paginador = new Paginador();
        $pagina = @$data["page"];
        $offset = 15;

        $pixelCount = (new Pixel())->find("usuario = {$_SESSION["id"]}")->count();
        $paginas = ceil($pixelCount / $offset);
        $pixel = (new Pixel())->find("usuario = {$_SESSION["id"]}")->limit($offset)->offset($paginador->paginador($pagina, $offset))->order("id ASC")->fetch(true);
        echo $this->view->render("pixel", [
            "title" => "Gerenciar Pixels",
            "pixel" => $pixel,
            "paginador" => $paginador,
            "total" => $paginas,
            "pagina" => @$data["page"] ? $data["page"] : 1,
            "msg" => @$data["msg"],
            "classCss" => @$data["classCss"]
        ]);
    }

    public function cadastroPixel($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $codigo = mt_rand(10000, 999999);

        $pixel = (new Pixel());
        $pixel->codigo = $codigo;
        $pixel->nome = $data["nome"];
        $pixel->usuario = $_SESSION["id"];

        if(@$data["observacao"])
        $pixel->observacao = $data["observacao"];

        $pixel->boleto = $data["boleto"];
        $pixel->status = $data['status'];
        $pixel->executar_checkout = $data['executar_checkout'];
        
        if(@$data["valor"])
        $pixel->valor = $data['valor'];
        
        $pixel->plataforma = $data["plataforma"];
        $pixel->id_pixel = $data["id_pixel"];
        
        if($pixel->save()){
            echo "Cadastrado Com Sucesso!";
        } else {
            echo $pixel->fail()->getMessage();
        }
    }

    public function editarPixel($data): void
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $pixel = (new Pixel())->findById($data["id"]);
        $pixel->nome = $data["nome"];
        $pixel->usuario = $_SESSION["id"];

        if(@$data["observacao"])
        $pixel->observacao = $data["observacao"];

        $pixel->boleto = $data["boleto"];
        $pixel->status = $data['status'];
        $pixel->executar_checkout = $data['executar_checkout'];
        
        if(@$data["valor"])
        $pixel->valor = $data['valor'];
        
        $pixel->plataforma = $data["plataforma"];
        $pixel->id_pixel = $data["id_pixel"];

        if($pixel->save()){
            echo "Atualizado Com Sucesso!";
        } 
        else {
            echo $usuario->fail()->getMessage();
        }
    }

    public function excluirPixel($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $pixel = (new Pixel())->findById($data["id"]);
        if($pixel->destroy()){
            echo "Excluido com sucesso";
        }
        else {
            echo $pixel->fail()->getMessage();
        }
    }
}