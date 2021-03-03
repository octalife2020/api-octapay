<?php

namespace Source\App\Vendas;

use League\Plates\Engine;
use Source\Models\Vendas\Venda;
use Source\Models\Produtos\Produto;
use Source\Helpers\Paginador;

class AppVendas
{
    private $view;
    private $tema;

    public function __construct($router)
    {
        $this->tema = @$_SESSION["tema"] ? @$_SESSION["tema"] : "tema1";

        $this->view = Engine::create(__DIR__ . "/../../../themes/$this->tema", "php");
        $this->view->addData(["router" => $router]);
    }

    public function vendas($data)
    {
        $filtros = $this->filtros();
        // var_dump($filtros);

        $paginador = new Paginador();
        $pagina = @$data["page"];
        $offset = 30;

        $vendasCount = (new Venda())->find($filtros)->count();

        $paginas = ceil($vendasCount / 30);
        $vendas = (new Venda())->find($filtros)->limit($offset)->offset($paginador->paginador($pagina, $offset))->order("id DESC")->fetch(true);
        
        // var_dump($vendas);
        if ($vendas) {
            foreach ($vendas as $venda) {
                var_dump($venda->id);
            }
        } else {
            echo "Nenhum resultado encontrado";
        }
    }

    public function filtros()
    {
        $inicio = @$_GET["inicio"];
        $fim = @$_GET["fim"];
        $venda = @$_GET["venda"];
        $status = @$_GET["status"];
        $produto = @$_GET["produto"];
        $comprador = @$_GET["comprador"];
        $pagamento = @$_GET["pagamento"];
        $sql = array();

        if($inicio != "" || $fim !=""){
            if($inicio == "")
                $inicio = date("Y-m-d");

            if($fim == "")
                $fim = date("Y-m-d");

            $sql[] = "(created_at BETWEEN '{$inicio} 00:00:00' AND '{$fim} 23:59:59' OR data_finalizada BETWEEN '{$inicio} 00:00:00' AND '{$fim} 23:59:59')";
        }

        if($venda != "") {
            $sql[] = "transacao = '$venda' OR id = '$venda'";
        }

        if($status != "") {
            $sql[] = "status_transacao = $status";
        }

        if($produto != "") {
            $sql[] = "produto = $produto";
        }

        if($comprador != "") {
            $sql[] = "comprador IN ( SELECT usuario_dados.id FROM usuario_dados WHERE nome LIKE '%$comprador%' OR cpf_cnpj = '$comprador' OR email LIKE '%$comprador%')";
        }

        if($pagamento != "") {
            $sql[] = "forma_pagamento = $pagamento";
        }

        $result = count($sql);
        
        for($i = 0; $i < $result - 1; $i++) {
            $sql[$i] .= " AND";
        }
        
        return implode(" ", $sql);
        
    }

    public function error($data)
    {
        echo "error " . $data["errcode"];
    }
}