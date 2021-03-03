<?php

//CLASSE QUE CONTROLA AS ROTAS DOS PRODUTORES

namespace Source\App\Configuracoes;

session_start();

use League\Plates\Engine;

use Source\App\Sessao\AppSessao;
use Source\Models\Configuracoes\Taxa;
use Source\Models\Configuracoes\Antecipacao;
use Source\Models\Comissao\Comissao;

class AppTaxas
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

    public function taxas($data)
    {
        $taxa = (new Taxa())->findById(1);
        $antecipacao = (new Antecipacao())->findById(1);

        echo $this->view->render("configuracoes/taxas", [
            "title" => "Taxas",
            "taxa" => $taxa,
            "antecipacao" => $antecipacao
        ]);
    }

    public function editarTaxa($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $taxa = (new Taxa())->findById($data["id"]);

        $taxa->usuario_ultima_alteracao = $_SESSION["id"];
        $taxa->parcelamento = @$data["parcelamento"];
        $taxa->saque = @$data["saque"];
        $taxa->taxa_octapay = @$data["taxa_octapay"];
        $taxa->valor_transacao = @$data["valor_transacao"];
        $taxa->taxa_iniciante = @$data["taxa_iniciante"];
        $taxa->vendas_iniciante = @$data["vendas_iniciante"];
        $taxa->dias_iniciante = @$data["dias_iniciante"];
        $taxa->taxa_bronze = @$data["taxa_bronze"];
        $taxa->vendas_bronze = @$data["vendas_bronze"];
        $taxa->dias_bronze = @$data["dias_bronze"];
        $taxa->taxa_prata = @$data["taxa_prata"];
        $taxa->vendas_prata = @$data["vendas_prata"];
        $taxa->dias_prata = @$data["dias_prata"];
        $taxa->taxa_ouro = @$data["taxa_ouro"];
        $taxa->vendas_ouro = @$data["vendas_ouro"];
        $taxa->dias_ouro = @$data["dias_ouro"];
        
        if($taxa->save()){
            echo "Atualizado Com Sucesso!";
        } 
        else {
            echo $taxa->fail()->getMessage();
        }
    }

    public function editarAntecipacao($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);

        $antecipacao = (new Antecipacao())->findById($data["idA"]);

        $antecipacao->usuario_ultima_alteracao = $_SESSION["id"];
        $antecipacao->dias_antecipar = $data["dias_antecipar"]; // dias para começar a antecipar
        $antecipacao->periodo_antecipacao = $data["periodo_antecipacao"]; // quantidade de dias para antecipar
        $antecipacao->porcentagem = $data["porcentagem"];
        $antecipacao->taxa_antecipacao = $data["taxa_antecipacao"];
        
        if($antecipacao->save()){
            echo "Atualizado Com Sucesso!";
        } 
        else {
            echo $antecipacao->fail()->getMessage();
        }
    }

    public function antecipar($data)
    {
        $antecipacao = (new Antecipacao())->findById(1);
        $dias_antecipar = date("Y-m-d", strtotime("+" . $antecipacao->dias_antecipar . " days"));
        $periodo = $antecipacao->dias_antecipar + $antecipacao->periodo_antecipacao;
        $periodo_antecipacao = date("Y-m-d", strtotime("+" . $periodo . " days"));

        echo "$dias_antecipar dias antecipar <br>";
        echo "$periodo_antecipacao periodo antecipacao <br><br>";
        echo "================================================<br><br>";

        $valor = (new Comissao())->find("tempo_saque BETWEEN '$dias_antecipar' AND '$periodo_antecipacao' AND usuario = " . $_SESSION["id"], null, "SUM(valor) as soma")->fetch();

        $porcentagem = number_format(($valor->soma * ($antecipacao->porcentagem / 100)), 2);
        $taxa_antecipacao = $antecipacao->taxa_antecipacao / 100;
        $valor_porcentagem = number_format($porcentagem * $taxa_antecipacao, 2);
        $valor_liberado = number_format($porcentagem - $valor_porcentagem, 2);

        echo "Total: " . $valor->soma . "<br>";
        echo "Taxa: $taxa_antecipacao - Valor liberado: $valor_liberado - Porcentagem: $porcentagem - Valor porcentagem: $valor_porcentagem <br><br>";
        echo "================================================<br><br>COMISSÕES<br>";

        $comissoes = (new Comissao())->find("tempo_saque BETWEEN '$dias_antecipar' AND '$periodo_antecipacao' AND usuario = " . $_SESSION["id"])->fetch(true);
        foreach($comissoes as $comissao){
            
            echo "usuario: " . $comissao->dataUsuario()->nome . "<br>";
            echo "R$ " . $comissao->valor . "<br>";
            echo "tempo saque: " . $comissao->tempo_saque . "<br>";
            echo "pedido: " . $comissao->tempo_saque . "<br><br>";
            echo "#####################################################<br><br>";
        }
    }
}