<?php

//CLASSE QUE CONTROLA AS ROTAS DOS AFILIADOS

namespace Source\App\Comissao;

session_start();

use League\Plates\Engine;

use Source\Models\Comissao\Comissao;
use Source\Models\Comissao\Banco;
use Source\Models\Comissao\Saldo;
use Source\Models\Vendas\Venda;
use Source\Models\CoProdutor\CoProdutor;
use Source\Models\Usuarios\Usuario;
use Source\Models\Usuarios\UsuarioDados;
use Source\Models\Usuarios\UsuarioPremium;
use Source\Models\Configuracoes\Antecipacao;
use Source\Helpers\Paginador;
use Source\App\Sessao\AppSessao;
use Source\Helpers\Emails;

class AppComissao
{
    private $view;
    private $sessao;
    private $tema;

    public function __construct($router)
    {
        $this->tema = @$_SESSION["tema"] ? @$_SESSION["tema"] : "tema1";
        $this->view = Engine::create(__DIR__ . "/../../../themes/$this->tema", "php");
        $this->view->addData(["router" => $router]);
    }

    public function comissao($data)
    {
        $this->sessao = (new AppSessao())->verificaSeLogado();

        $paginador = new Paginador();
        $pagina = @$data["page"] ? $data["page"] : 1;
        $offset = 30;

        if(@$_GET["meus"]){
            $busca = "usuario = " . $_SESSION["id"];
        }

        $tempo_saque = @$_SESSION["tempo_saque"] ? $_SESSION["tempo_saque"] : 30;

        if($_SESSION["tipo"] == 1 || $_SESSION["tipo"] == 2){
            $comissaoCount = (new Comissao())->find(@$busca)->count();
            $paginas = ceil($comissaoCount / $offset);
            $comissao = (new Comissao())->find(@$busca)->limit($offset)->offset($paginador->paginador($pagina, $offset))->order("id DESC")->fetch(true);
        } else {
            $comissaoCount = (new Comissao())->find("usuario = " . $_SESSION["id"])->count();
            $paginas = ceil($comissaoCount / $offset);
            $comissao = (new Comissao())->find("usuario = " . $_SESSION["id"])->limit($offset)->offset($paginador->paginador($pagina, $offset))->order("id DESC")->fetch(true);            
        }
        $usuario = $_SESSION["id"];
        $hoje = (new Comissao())->find("tipo = 1 AND usuario = $usuario AND tempo_saque = '" . date("Y-m-d") . "'", null, "SUM(valor)")->fetch();
        $ontem = (new Comissao())->find("tipo = 1 AND usuario = $usuario AND tempo_saque = '" . date("Y-m-d", strtotime("-1 day")) . "'", null, "SUM(valor)")->fetch();
        $mes = (new Comissao())->find("tipo = 1 AND usuario = $usuario AND tempo_saque BETWEEN '" . date("Y-m-01") . "' AND '"  . date("Y-m-d") . "'", null, "SUM(valor)")->fetch();
        $pendente = (new Comissao())->find("(antecipado = 1 OR antecipado = 0) and disponivel = 0 and tipo = 1 and usuario = $usuario", null, "SUM(valor)")->fetch();
        $antecipado = (new Comissao())->find("usuario = $usuario AND disponivel = 0", null, "SUM(antecipado)")->fetch();
        $saldo = (new Saldo())->find("usuario = " . $_SESSION["id"])->fetch();
    
        $usuarioDados = (new UsuarioDados())->find("usuario = $usuario")->fetch();
        $bancos = (new Banco())->find("status = 2 AND usuario = " . $_SESSION["id"])->fetch(true);
        $saqueMes = (new Comissao())->find("tipo = 2 and status = 2 AND usuario = $usuario AND created_at BETWEEN '" . date("Y-m-01 00:00:00") . "' AND '"  . date("Y-m-d H:i:s") . "'", null, "SUM(valor)")->fetch();

        foreach($hoje->data() as $hoje) null;
        foreach($ontem->data() as $ontem) null;
        foreach($mes->data() as $mes) null;
        foreach($pendente->data() as $pendente) null;
        foreach($antecipado->data() as $antecipado) null;
        foreach($saqueMes->data() as $saqueMes) null;

        echo $this->view->render("comissao/comissao", [
            "title" => "Saldos e Extratos",
            "comissao" => $comissao,
            "bancos" => $bancos,
            "hoje" => @$hoje,
            "ontem" => @$ontem,
            "mes" => @$mes,
            "pendente" => @$pendente,
            "antecipado" => @$antecipado,
            "comissao" => @$comissao,
            "saldo" => @$saldo->valor,
            "usuario" => @$usuarioDados,
            "saqueMes" => @$saqueMes,
            "count" => $comissaoCount,
            "paginador" => @$paginador,
            "paginas" => @$paginas,
            "pagina" => @$data["page"] ? $data["page"] : 1,
        ]);
    }

    public function comissaoOctapay($data)
    {
        $this->sessao = (new AppSessao())->verificaSeLogado();

        $paginador = new Paginador();
        $pagina = @$data["page"] ? $data["page"] : 1;
        $offset = 30;

        $tempo_saque = @$_SESSION["tempo_saque"] ? $_SESSION["tempo_saque"] : 30;

        $comissaoCount = (new Comissao())->find("usuario = 1")->count();
        $paginas = ceil($comissaoCount / $offset);
        $comissao = (new Comissao())->find("usuario = 1")->limit($offset)->offset($paginador->paginador($pagina, $offset))->order("id DESC")->fetch(true);
        
        $hoje = (new Comissao())->find("usuario = 1 AND tempo_saque = '" . date("Y-m-d") . "'", null, "SUM(valor)")->fetch();
        $ontem = (new Comissao())->find("usuario = 1 AND tempo_saque = '" . date("Y-m-d", strtotime("-1 day")) . "'", null, "SUM(valor)")->fetch();
        $mes = (new Comissao())->find("usuario = 1 AND tempo_saque BETWEEN '" . date("Y-m-01") . "' AND '"  . date("Y-m-d") . "'", null, "SUM(valor)")->fetch();
        $pendente = (new Comissao())->find("usuario = 1 AND disponivel = 0", null, "SUM(valor)")->fetch();
        $saldo = (new Saldo())->find("usuario = 1")->fetch();

        foreach($hoje->data() as $hoje) null;
        foreach($ontem->data() as $ontem) null;
        foreach($mes->data() as $mes) null;
        foreach($pendente->data() as $pendente) null;

        echo $this->view->render("comissao/comissao-octapay", [
            "title" => "Comissão OctaPay",
            "comissao" => $comissao,
            "hoje" => @$hoje,
            "ontem" => @$ontem,
            "mes" => @$mes,
            "pendente" => @$pendente,
            "comissao" => @$comissao,
            "saldo" => @$saldo->valor,
            "count" => $comissaoCount,
            "paginador" => @$paginador,
            "paginas" => @$paginas,
            "pagina" => @$data["page"] ? $data["page"] : 1,
        ]);
    }

    /** FAZ UMA VERIFICAÇÃO NAS VENDAS PARA VER SE EXISTE COMISSÕES NÃO LANÇADAS */
    public function verificaComissao($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);
        $vendas = (new Venda())->find("vendas.id NOT IN (SELECT comissao.venda FROM comissao WHERE comissao.venda IS NOT NULL) AND status_transacao = 4")->order("id ASC")->fetch(true);

        $i = 1;
        foreach($vendas as $venda){
            echo "<pre>";
            echo "*************************************************************************************************** <br>";
            echo "***                     <b>VERIFICAR COMISSÃO DA VENDA $venda->id - $venda->transacao</b>                        *** <br>";
            echo "*************************************************************************************************** <br>";


            echo "***<br>";
            echo "*** count: <b>$i</b> <br>" .
                 "*** produto: <b>$venda->produto</b> <br>" . 
                 "*** valor bruto: <b>R$ $venda->valor_bruto</b><br>" . 
                 "*** valor do produto: <b>R$ $venda->valor_produto</b><br>" . 
                 "*** valor líquido: <b>R$ $venda->valor_liquido</b><br>" . 
                 "*** Valor OctaPay: <b>R$ $venda->valor_octapay</b><br>";
                 "*** Valor Frete: <b>R$ $venda->valor_frete</b><br>";

            echo "***<br>";
            echo "*************************************************************************************************** <br>";

            echo "</pre>";
                

            /** ESTRUTURA BÁSICA CADASTRO DE COMISSÕES */
            $data["venda"] = $venda->id;
            $data["produto"] = $venda->produto;
            $data["data_pedido"] = $venda->data_finalizada;
            $data["tipo"] = 1;

            /** 
             * USUARIO PREMIUM 
             */

            echo "<br><pre>";
            echo "*************************************************************************************************** <br>";
            echo "***                       VERIFICAR USUÁRIOS PREMIUNS                                           *** <br>";
            echo "*************************************************************************************************** <br>";

            $comissaoPremium = number_format($venda->valor_bruto * (1 / 100), 2);
            echo "***<br>";
            echo "*** COMISSÃO PREMIUM: <b>R$ $comissaoPremium</b> <br>";

            $usuarioPremium = new UsuarioPremium();

            /** AFILIADO PREMIUM */
            $afiliadoPremium = $venda->afiliado;
            $hoje = date("Y-m-d");
            $userPremium = $usuarioPremium->find("indicado = $venda->afiliado AND expiracao >= '$hoje'")->fetch();
            if($userPremium){
                $indicandoAfiliadoPremium = $usuarioPremium->usuario;
                $indicando[0] = $indicandoAfiliadoPremium;
                echo "*** Afiliado premium <b>$indicandoAfiliadoPremium</b> <br>";
            }
            /** FIM AFILIADO PREMIUM */

            /** PRODUTOR PREMIUM */
            $produtorPremium = $venda->produtor;
            $userPremium = $usuarioPremium->find("indicado = $venda->produtor  AND expiracao >= '$hoje'")->fetch();
            if($userPremium){
                $indicandoProdutorPremium = $userPremium->usuario;
                $indicando[1]= $indicandoProdutorPremium;
                echo "*** Produtor premium <b>$indicandoProdutorPremium</b> <br>";
            }
            /** FIM PRODUTOR PREMIUM */

            if(@$indicandoProdutorPremium || @$indicandoAfiliadoPremium){
                $venda->valor_liquido -= $comissaoPremium;
            }
            echo "*** Valor liquido <b>R$ $venda->valor_liquido</b> <br>";
            //var_dump($indicando);

            if(@$indicandoAfiliadoPremium){
                $afiliado = 1;
            } else {
                $afiliado = 0;
            }

            if(@$indicandoProdutorPremium){
                $produtor = 1;
            } else {
                $produtor = 0;
            }

            $somaIndicandos = @$afiliado + @$produtor;

            if($somaIndicandos == 1){
                $data["usuario"] = @$indicando[0] ? $indicando[0] : $indicando[1];
                $data["valor"] = $comissaoPremium;
                $data["descricao"] = "Indicação Premium";
                $data["tempo_saque"] = date("Y-m-d", strtotime("+30 days"));
                $this->cadastroComissao($data);
            } else if($somaIndicandos == 2){
                $data["valor"] = $comissaoPremium / 2;
                $data["descricao"] = "Indicação Premium";
                $data["tempo_saque"] = date("Y-m-d", strtotime("+30 days"));

                $data["usuario"] = $indicando[0];
                $this->cadastroComissao($data);

                $data["usuario"] = $indicando[1];
                $this->cadastroComissao($data);
            }

            echo "*** Produtor $produtor - Afiliado $afiliado <br>";

            echo "***<br>";
            echo "*************************************************************************************************** <br>";
            echo "</pre>";

            /** 
             * FIM USUARIO PREMIUM 
             */

            /** 
             * TAXA OCTAPAY 
             */

            echo "<br><pre>";
            echo "*************************************************************************************************** <br>";
            echo "***                                      TAXA OCTAPAY                                           *** <br>";
            echo "*************************************************************************************************** <br>";

            echo "***<br>";
            echo "*** count: <b>$i</b> <br>" . 
                 "*** venda: <b>$venda->id</b> <br>" . 
                 "*** valor octapay: <b>R$ $venda->valor_octapay</b><br>";

            $data["usuario"] = 1;
            $data["valor"] = $venda->valor_octapay;
            $data["descricao"] = "Taxa OctaPay";
            $data["tempo_saque"] = date("Y-m-d", strtotime("+15 days"));
            $data["taxa_saque"] = 0;
            $this->cadastroComissao($data);

            if($venda->valor_juros > 0){
                echo "<br>*** JUROS CARTÃO <br>";
                $data["usuario"] = 1;
                $data["valor"] = $venda->valor_juros;
                $data["descricao"] = "Juros Cartão";
                $data["tempo_saque"] = date("Y-m-d", strtotime("+15 days"));
                $data["taxa_saque"] = 0;
                
                echo "*** juros do cartão: <b>R$ $venda->valor_juros</b><br>";
                $this->cadastroComissao($data);
            }

            echo "***<br>";
            echo "*************************************************************************************************** <br>";
            echo "</pre>";

            /** 
             * FIM TAXA OCTAPAY
             */

            /** 
             * COMISSÃO AFILIADO
             */

            if($venda->afiliado){
                echo "<br><pre>";
                echo "*************************************************************************************************** <br>";
                echo "***                                      TEM AFILIADO                                           *** <br>";
                echo "*************************************************************************************************** <br>";

                echo "***<br>";
                echo "*** count: $i<br>" . 
                     "*** venda: $venda->id<br>" . 
                     "*** id afiliado: $venda->afiliado<br>" . 
                     "*** Comissão afiliado: R$ $venda->comissao_afiliado<br>";
                
                //$taxa_octapay_saque = number_format($venda->comissao_afiliado * ($venda->dataAfiliado()->taxa_saque / 100), 2);
                //$comissaoAfiliado = $venda->comissao_afiliado - $taxa_octapay_saque;
                /*echo "<br>*** Taxa octapay saque: <b>R$ $taxa_octapay_saque </b> - 
                <b>Comissao afiliado:</b> total <b>R$ $venda->comissao_afiliado</b> - liquido <b>R$ $comissaoAfiliado</b> ***<br>";*/

                $data["usuario"] = $venda->afiliado;
                $data["valor"] = $venda->comissao_afiliado;
                $data["descricao"] = "Comissão afiliado";
                $data["taxa_saque"] = 0; //$venda->dataAfiliado()->taxa_saque;
                $data["tempo_saque"] = date("Y-m-d", strtotime("+" . $venda->dataAfiliado()->tempo_saque." days", strtotime($venda->data_finalizada)));
                
                echo "*** Tempo de Saque: ". $venda->dataAfiliado()->tempo_saque . " dias <br>";
                echo "*** data finalizada: $venda->data_finalizada <br>" . 
                     "*** tempo saque ". $data["tempo_saque"] . "<br>";
                
                $this->cadastroComissao($data);

                echo "***<br>";
                echo "*************************************************************************************************** <br>";
                echo "</pre>";
            }

            /** 
             * FIM COMISSÃO AFILIADO
             */

            $coprodutores = (new CoProdutor())->find("aceito = 1 AND produto = $venda->produto AND data_limite <= '" . date("Y-m-d") . "'")->fetch(true);

            if($coprodutores){ // TEM COPRODUTORES
                $comissaoCoProdutor = array();
                $somaComissao = 0;
                $j = 1;
                foreach($coprodutores as $coprodutor){
                    
                    echo "<br><pre>";
                    echo "*************************************************************************************************** <br>";
                    echo "***                                 VERIFICAÇÃO COPRODUTORES                                    *** <br>";
                    echo "*************************************************************************************************** <br>";

                    echo "***<br>";
                    echo "*** Período: <b>$coprodutor->created_at (" . strtotime($coprodutor->created_at) . ") $coprodutor->data_limite</b> <br>";
                    echo "*** Data venda: <b>$venda->created_at (" . strtotime($venda->created_at) . ")</b> <br>";

                    if(strtotime($venda->created_at) >= strtotime($coprodutor->created_at)){
                        echo "<br><br>***   <b>ÍNDICE: $j</b>   ***<br><br>";
                        echo "***   SUPERIOR    ***<br><br>";

                        /** 
                         * => SE COPRODUTOR 
                         */

                        if($coprodutor->gerente == 0){

                            /**
                             * => SE COPRODUTOR
                             * => TIPO COMISSAO == 0 (%)
                             */

                            echo "* => SE COPRODUTOR <br>";

                            if($coprodutor->tipo_comissao == 0){
                                $comissaoCoProdutor[$j] = ($venda->valor_liquido) * $coprodutor->comissao / 100;
                                echo "* => SE COPRODUTOR * => TIPO COMISSAO == 0 (%) $coprodutor->comissao% - <b>R$ $comissaoCoProdutor[$j]</b><br>";
                            } 

                            /**
                             * => SE COPRODUTOR
                             * => TIPO COMISSAO == 1 (R$)
                             */

                            else {
                                $comissaoCoProdutor[$j] = $coprodutor->comissao;
                                echo "* => SE COPRODUTOR * => TIPO COMISSAO == 1 (R$) <b>R$ $comissaoCoProdutor[$j]</b> <br>";
                            }
                            
                        /** 
                         * => SE GERENTE
                         */

                        } else {

                            /** 
                             * => SE GERENTE
                             * => A VENDA TEM AFILIADO
                             */
                            echo "* => SE GERENTE <br>";

                            if($venda->afiliado){

                                /**
                                 * => SE GERENTE
                                 * => A VENDA TEM AFILIADOS
                                 * => TIPO COMISSAO == 0 (%)
                                 */

                                echo "* => SE GERENTE * => A VENDA TEM AFILIADO <br>";

                                if($coprodutor->tipo_comissao_afiliado == 0){
                                    $comissaoCoProdutor[$j] = $venda->valor_liquido * $coprodutor->comissao_afiliados / 100;
                                    echo "* => SE GERENTE * => A VENDA TEM AFILIADOS * => TIPO COMISSAO == 0 (%) $coprodutor->comissao_afiliados% - <b>R$ $comissaoCoProdutor[$j]</b> <br>";
                                } 
        
                                /**
                                 * => SE GERENTE
                                 * => A VENDA TEM AFILIADOS
                                 * => TIPO COMISSAO == 1 (R$)
                                 */
        
                                else {
                                    $comissaoCoProdutor[$j] = $coprodutor->comissao_afiliados;
                                    echo "* => SE GERENTE * => A VENDA TEM AFILIADOS * => TIPO COMISSAO == 1 (R$) <b> R$ $comissaoCoProdutor[$j]</b> <br>";
                                }
                            }
                            
                            /** 
                             * => SE GERENTE
                             * => A VENDA NÃO TEM AFILIADO
                             */

                            else {

                                /**
                                 * => SE GERENTE
                                 * => A VENDA NÃO TEM AFILIADOS
                                 * => TIPO COMISSAO == 0 (%)
                                 */

                                echo "* => SE GERENTE * => A VENDA NÃO TEM AFILIADOS  <br>";

                                if($coprodutor->tipo_comissao == 0){
                                    $comissaoCoProdutor[$j] = $venda->valor_liquido * $coprodutor->comissao / 100;
                                    $somaComissao += $comissaoCoProdutor[$j];
                                    echo "* => SE GERENTE * => A VENDA NÃO TEM AFILIADOS * => TIPO COMISSAO == 0 (%) $coprodutor->comissao% - <b>R$ $comissaoCoProdutor[$j]</b> <br>";
                                } 
        
                                /**
                                 * => SE GERENTE
                                 * => A VENDA NÃO TEM AFILIADOS
                                 * => TIPO COMISSAO == 1 (R$)
                                 */
        
                                else {
                                    $comissaoCoProdutor[$j] = $coprodutor->comissao;
                                    echo "* => SE GERENTE * => A VENDA NÃO TEM AFILIADOS * => TIPO COMISSAO == 1 (R$) <b>R$ $coprodutor->comissao</b> <br>";
                                }
                            } // FIM SE GERENTE => A VENDA NÃO TEM AFILIADO
                        } // FIM SE GERENTE

                        echo "<br><br>*** Comissão coprodutor: {$comissaoCoProdutor[$j]} <br><br>";
                        $comissaoCoProdutor[$j] = number_format($comissaoCoProdutor[$j], 2);

                        /*$taxa_octapay_saque = number_format($comissaoCoProdutor[$j] * ($coprodutor->dataCoProdutor()->taxa_saque / 100), 2);
                        $comissaoCop = $comissaoCoProdutor[$j] - $taxa_octapay_saque;
                        echo "<br>*** Taxa octapay saque: <b>R$ $taxa_octapay_saque </b> - 
                        <b>Comissao coprodutor:</b> total <b>R$ {$comissaoCoProdutor[$j]}</b> - liquido <b>R$ $comissaoCop</b> ***<br>";*/

                        $somaComissao += $comissaoCoProdutor[$j];
                        $data["usuario"] = $coprodutor->co_produtor;
                        $data["valor"] = $comissaoCoProdutor[$j];
                        $data["descricao"] = "Comissão coprodução";
                        $data["taxa_saque"] = 0; //$coprodutor->dataCoProdutor()->taxa_saque;
                        $data["tempo_saque"] = date("Y-m-d", strtotime("+" . $coprodutor->dataCoProdutor()->tempo_saque." days", strtotime($venda->data_finalizada)));
                        
                        echo "*** Tempo saque: ". $coprodutor->dataCoProdutor()->tempo_saque . " dias <br>";
                        echo "*** data finalizada: $venda->data_finalizada<br>" . 
                             "*** tempo saque: ". $data["tempo_saque"] . "<br>";
                        echo "*** Comissão coprodutor: <b>R$ $comissaoCoProdutor[$j]</b> <br>";

                        $this->cadastroComissao($data);
                        
                        $j++;
                    }

                    echo "***<br>";
                    echo "*************************************************************************************************** <br>";
                    echo "</pre>";
                
                } // FIM FOREACH

            } // FIM TEM COPRODUTORES

            /** 
             * FIM COMISSÃO AFILIADO
             */

            echo "<br><pre>";
            echo "*************************************************************************************************** <br>";
            echo "***                                      COMISSÃO PRODUTOR                                      *** <br>";
            echo "*************************************************************************************************** <br>";

            echo "***<br>";

            echo "*** count: $i<br>";
            echo "*** SOMA COMISSÃO COPRODUTORES: <b>R$ " . @$somaComissao . "</b> <br>";
            
            //echo "Comissão dos coprodutores R$ " . @$com . "<br>";
            $resto = $venda->valor_liquido - @$venda->comissao_afiliado - @$somaComissao;
            echo "*** Valor liquido: $venda->valor_liquido<br>" . 
                 "*** Comissão afiliado: " . @$venda->comissao_afiliado . "<br>" . 
                 "*** Soma comissão: " . @$somaComissao . " ***<br>";

            echo "***<br>";
            echo "*** Resto: $venda->valor_liquido - " . @$venda->comissao_afiliado . " - " . @$somaComissao . " = <b>R$ $resto </b><br><br>";

            /*$taxa_octapay_saque = number_format($resto * ($venda->dataProdutor()->taxa_saque / 100), 2);
            $comissaoProd = $resto - $taxa_octapay_saque;
            echo "<br>*** Taxa octapay saque: <b>R$ $taxa_octapay_saque </b> - 
            <b>Comissao produtor:</b> total <b>R$ $resto</b> - liquido <b>R$ $comissaoProd</b> ***<br>";*/

            echo "***<br>";
            echo "*** <b>COMISSÃO PRODUTOR </b><br>";
            $data["usuario"] = $venda->dataProduto()->usuario;
            $data["valor"] = $resto;
            $data["descricao"] = "Comissão Produtor";
            $data["taxa_saque"] = 0; //$venda->dataProdutor()->taxa_saque;
            $data["tempo_saque"] = date("Y-m-d", strtotime("+" . $venda->dataProdutor()->tempo_saque." days", strtotime($venda->data_finalizada)));
            
            echo "<br>*** tempo saque: ". $venda->dataProdutor()->tempo_saque . " dias <br>";
            echo "*** data finalizada $venda->data_finalizada<br>" . 
                 "*** tempo saque: ". $data["tempo_saque"] . "<br>";
            
            $this->cadastroComissao($data);
            echo "<br>";

            echo "*** <b>resto: R$ $resto</b>";
            $somaComissao = 0;
            $comissaoAfiliado = 0;
            //$comissaoCoProdutor[$j] = 0;
            
            echo "***<br>";
            echo "*************************************************************************************************** <br>";
            echo "</pre>";

            $i++;

            echo "<br>" . 
                 "############################################# FIM #################################################" . 
                 "<br><br>";
        } // FIM FOREACH VENDAS
    }

    public function cadastroComissao($data)
    {
        $data = filter_var_array($data, FILTER_SANITIZE_STRIPPED);
        $comissao = new Comissao();

        $comissao->usuario      = $data["usuario"];
        $comissao->venda        = $data["venda"];
        $comissao->produto      = $data["produto"];
        $comissao->descricao    = @$data["descricao"];
        $comissao->valor        = $data["valor"];

        if(@$data["saldo"])
        $comissao->saldo        = $data["saldo"];

        $comissao->tempo_saque  = @$data["tempo_saque"]; // DATA PARA FICAR DISPONÍVEL
        $comissao->taxa  = @$data["taxa_saque"];
        $comissao->disponivel   = 0; // 0 (NÃO) - 1 (SIM) - 2 (SACADO - INSERIDO NA TABELA SALDO)
        $comissao->tipo         = @$data["tipo"]; // 1 (ENTRADA) - 2 (SAIDA)
        $comissao->data_pedido  = $data["data_pedido"];

        echo "***<br>";
        echo "*** <b>CADASTRO COMISSÃO</b><br>" . 
             "*** usuario $comissao->usuario - id venda $comissao->venda" . 
             "- produto $comissao->produto - comissao <b>R$ $comissao->valor</b> - descrição: $comissao->descricao<br>";
        
        if($comissao->save()){
            echo "<br>*** Salvo com sucesso <br>";
        }
        else{
            echo "<br>*** " . $comissao->fail()->getMessage() . "<br>";
        }
    }

    public function verificarSaldo($data)
    {
        $comissoes = (new Comissao())->find("tempo_saque <= '" . date("Y-m-d") . "' AND disponivel = 0")->fetch(true);

        foreach($comissoes as $comissao){
            $total = $comissao->valor - $comissao->antecipado;
            $total = number_format($total, 2, ".", ",");
            echo "USUÁRIO: " . $comissao->dataUsuario()->nome . " - " . $comissao->dataUsuario()->taxa_saque . "<br>";
            echo "VALOR: " . $comissao->valor . "<br>";
            echo "TOTAL: " . $total . "<br><br>";

            $comm = (new Comissao())->findById($comissao->id);
            $comm->disponivel = 2;
            $comm->save();

            $dados["usuario"] = $comissao->usuario;
            $dados["valor"] = $total;
            $this->cadastroSaldo($dados);
        }
    }

    public function cadastroSaldo($data)
    {
        $usuario = (new Saldo())->find("usuario = " . $data["usuario"])->fetch();
        //echo @$usuario->valor."<br>";
        if($usuario) {
            $saldo = (new Saldo())->findById($usuario->id);
            $saldo->valor = $usuario->valor + $data["valor"];
            //echo $saldo->valor . "<br>";
            if($saldo->save()){
                echo "Saldo atualizado";
            } else {
                echo $saldo->fail()->getMessage();
            }
        } else {
            $saldo = new Saldo();
            $saldo->usuario = $data["usuario"];
            $saldo->valor = $data["valor"];
            //echo $saldo->usuario . " - " . $saldo->valor . "<br>";
            if($saldo->save()){
                echo "Saldo inserido";
            } else {
                echo $saldo->fail()->getMessage();
            }
        }
    }

    public function verificaSaldo($data)
    {
        $usuario = (new Saldo())->find("usuario = " . $data["usuario"])->fetch();
        echo $usuario->valor . " " . $data["valor"];
        if($usuario != "" && $data["valor"] <= $usuario->valor) {
            return true;
        } else {
            return false;
        }
    }

    public function antecipacao($data)
    {
        $_SESSION["comissoes"] = array(0);
        $id = $_SESSION["id"];
        $tipo = $_SESSION["tipo"];
        $usuario = (new Usuario())->findById($id);
        $vendas = new Venda();

        $antecipacao = (new Antecipacao())->findById(1);
        $saldo = (new Saldo())->find("usuario = $id")->fetch();
        $dias_antecipar = $antecipacao->dias_antecipar;
        $periodo = $antecipacao->periodo_antecipacao;

        //echo "$dias_antecipar dias - $periodo dias<br>";
        $desde = date("Y-m-d", strtotime("+" . $dias_antecipar . " days"));
        $ate = date("Y-m-d", strtotime("+" . ($dias_antecipar + $periodo) . " days"));

        $pendente = (new Comissao())->find("(antecipado = 1 OR antecipado = 0) and disponivel = 0 and tipo = 1 and usuario = $id", null, "SUM(valor) as soma")->fetch();
        //$comissao = (new Comissao())->find("tipo = 1 AND disponivel = 0 and usuario = $id AND tempo_saque BETWEEN '$desde' AND '$ate'")->fetch(true);

        /** 
         * VERIFICAR PERFIL DE USUÁRIO 
         */

        $volume = $vendas->find("produtor = $id OR afiliado = $id")->fetch(true);
        $ved = array();
        $vendas = array();
        $cont = 1;
        $liberado = 0;

        // VERIFICA SE EXISTE VENDA
        if($volume){
            $diferença = strtotime(date("Y-m-d")) - strtotime($usuario->created_at);
            @$dados["tempoPlataforma"] = floor($diferença /(60 * 60 * 24 * 30));

            // VERIFICA O TEMPO DE PLATAFORMA
            if(@$dados["tempoPlataforma"] >= 2){
                foreach($volume as $volume){
                    $ved[$cont] = $volume->created_at;
                    $diff = strtotime($volume->created_at) - strtotime($cont == 1 ? $volume->created_at : @$ved[$cont - 1]);
                    $dado[$cont]["diff"] = floor($diff /(60 * 60 * 24));
                    @$dados["soma"] += $dado[$cont]["diff"];
                    $cont++;

                    $vendas[$cont]["status_transacao"] = $volume->status_transacao;
                }

                // CALCULA O TOTAL DE VENDAS PAGAS + DEVOLVIDAS + CHARGEBACKS + CONCLUÍDAS
                foreach ($vendas as $vend) {
                    if ($vend["status_transacao"] == 4 || $vend["status_transacao"] == 6 || $vend["status_transacao"] == 7 || $vend["status_transacao"] == 8) {
                        @$dados["totalPDCC"] += 1;
                    }
                }

                // CALCULA O TOTAL DE VENDAS DEVOLVIDAS + CHARGEBACKS
                foreach ($vendas as $vend1) {
                    if ($vend1["status_transacao"] == 6 || $vend1["status_transacao"] == 7) {
                        @$dados["totalDC"] += 1;
                    }
                }

                $dados["volumeVendas"] = count($ved);
                @$dados["taxaReembolso"] = $dados["totalDC"] / $dados["totalPDCC"];
                if(@$dados["taxaReembolso"] > 40){
                    $liberado = 0;
                } else {

                    $comissao = (new Comissao())->find("antecipado = 0 and disponivel = 0 and tipo = 1 and usuario = $id AND tempo_saque BETWEEN '$desde' AND '$ate'")->fetch(true);
                    $comissaoLib = (new Comissao())->find("antecipado = 0 and disponivel = 0 and tipo = 1 and usuario = $id AND tempo_saque BETWEEN '$desde' AND '$ate'", null, "SUM(valor) as valor")->fetch();
                    $valor = array();
                    $valor[0] = 0;
                    $i = 1;
                    if($comissao){
                        $lib = $comissaoLib->valor * 0.5;
                        //echo "liberado $comissaoLib->valor - $lib | ";
                        foreach ($comissao as $comissao) {
                            $valor[$i] = $comissao->valor;
                            //echo "\n\nsoma anterior " .@$soma . " \n\n<br>";
                            @$soma += $valor[$i];
                            //echo "COMISSÃO R$ " . $valor[$i] . " (soma $soma) \n<br>";
                            
                            if($soma > $lib){
                                $soma -= $valor[$i];
                                $_SESSION["comissoes"][$i - 1] = array($comissao->id, $comissao->valor, 0);
                            } else {
                                $_SESSION["comissoes"][$i - 1] = array($comissao->id, $comissao->valor, 1);
                                //echo "comissão id " . $comissao->id . " \n\n<br>";
                            }
                            $i++;
                        }
                        $liberado = $soma;
                        //echo "SOMA $soma <br>";
                    }
                }
                
                @$dados["frequenciaVendas"] = $dados["soma"] / $dados["volumeVendas"];
                
            }
            /** FIM TEMPO DE PLATAFORMA */
        } else {
            $liberado = 0;
        }
        /** FIM VENDA */

        /** 
         * FIM VERIFICAR PERFIL DE USUÁRIO 
         */
        $taxa = number_format($liberado * ($antecipacao->taxa_antecipacao / 100), 2);
        $_SESSION["liberado"] = $liberado;
        $_SESSION["pendente"] = $pendente->soma;
        $_SESSION["taxa"]     = $taxa;

        echo $this->view->render("comissao/antecipacao", [
            "title" => "Saques Solicitados",
            "pendente" => $pendente,
            "liberado" => $liberado,
            "comissao" => @$comissao,
            "antecipacao" => $antecipacao,
            "saldo" => $saldo,
            "dados" => @$dados,
        ]);
    }

    public function antecipar($data)
    {
        $id = $_SESSION["id"];
        $usuario = (new Usuario())->findById($id);
        $antecipacao = (new Antecipacao())->findById(1);
        $saldo = (new Saldo())->find("usuario = $id")->fetch();
        
        $i = 1;
        foreach ($_SESSION["comissoes"] as $comissoes) {
            //var_dump($comissoes[0]);
            $com = (new Comissao())->findById($comissoes[0]);

            /**
             * 0 = não antecipado
             * 1 = participou de algum processo de antecipação
             * 2 = antecipado
             */
            if(@$comissoes[2] == 1)
                $com->antecipado = 2;
            else 
                $com->antecipado = 1;
            if($com->save()){
                @$count += 1;
                //echo "Salvo com sucesso $count<br>";
            } else {
                $dados["email"] = "dev.ti@octapay.com.br";
                $dados["nome"] = "OctaPay";
                $dados["assunto"] = "Erro antecipação etapa 1";
                $dados["mensagem"]  = "Comissão " . $comissoes[0] . "<br>";
                $dados["mensagem"] .= "Usuário $id<br>";
                $dados["mensagem"]  = "Erro " . $com->fail()->getMessage() . "<br>";
                $enviaEmail = (new Emails())->enviaPHPMAILER($dados);
                echo "Erro " . $com->fail()->getMessage() . "<br>";
                @$count += 0;
            }
            //echo $count . " $i<br>";

            $i++;
        }
        //echo $count . " $i<br>";

        if(@$count != ($i - 1)){
            echo "Ocorreu um erro na solicitação. Entre em contato com o suporte e informe o usuário $id <br>";
        } else {
            echo "Processando solicitação...";

            $taxa = $_SESSION["taxa"];
            $liquido = $_SESSION["liberado"] - $taxa;

            $comissao1 = new Comissao();
            $comissao1->usuario = $id;
            $comissao1->descricao = "Antecipação";
            $comissao1->valor = $liquido;
            $comissao1->tempo_saque = date("Y-m-d");
            $comissao1->data_pedido = date("Y-m-d");
            $comissao1->disponivel = 2;
            $comissao1->tipo = 3;
            $comissao1->save();

            $saldo->valor += $liquido;
            $saldo->save();

            $comissaoOctapay = new Comissao();
            $comissaoOctapay->usuario = 1;
            $comissaoOctapay->descricao = "Taxa antecipação U$id";
            $comissaoOctapay->valor = $taxa;
            $comissaoOctapay->tempo_saque = date("Y-m-d");
            $comissaoOctapay->data_pedido = date("Y-m-d");
            $comissaoOctapay->disponivel = 0;
            $comissaoOctapay->tipo = 1;
            $comissaoOctapay->save();
        }
    }

    public function saque($data)
    {
        $paginador = new Paginador();
        $pagina = @$data["page"] ? $data["page"] : 1;
        $offset = 30;

        if($_SESSION["tipo"] == 1 || $_SESSION["tipo"] == 2){
            $bancosCount = (new Comissao())->find("tipo = 2")->count();
            $paginas = ceil($bancosCount / $offset);
            $comissao = (new Comissao())->find("tipo = 2")->limit($offset)->offset($paginador->paginador($pagina, $offset))->order("id DESC")->fetch(true);
        } else {
            $bancosCount = (new Comissao())->find("tipo = 2 and usuario = " . $_SESSION["id"])->count();
            $paginas = ceil($bancosCount / $offset);
            $comissao = (new Comissao())->find("tipo = 2 and usuario = " . $_SESSION["id"])->limit($offset)->offset($paginador->paginador($pagina, $offset))->order("id DESC")->fetch(true);
        }

        echo $this->view->render("comissao/saques", [
            "title" => "Saques Solicitados",
            "comissao" => $comissao,
            "paginador" => $paginador,
            "paginas" => $paginas,
            "pagina" => @$data["page"] ? $data["page"] : 1,
        ]);
    }

    public function solicitarSaque($data)
    {
        if($data["saldo"] >= $data["saqueMin"]): 
            $limiteSaque = $data["saqueMax"] - (-$data["saqueMes"]);
            if($data["tipo_doc"] == 1 && $limiteSaque < $$data["saqueMin"] && $limiteSaque > $$data["saqueMax"]): 
                echo "Você atingiu o limite mensal de saque";
                exit;
            endif; 
        endif; 

        $saque = new Comissao();

        if($data["valor"] > $data["saldo"]){
            $data["valor"] = $data["saldo"];
        }

        $saque->usuario = $data["usuario"];
        $saque->usuario_ultima_alteracao = $_SESSION["id"];
        $saque->valor = -$data["valor"];
        $data["descricao"] = "Solicitação de saque";
        $saque->saldo = $data["saldo"];
        $saque->tipo = 2;
        $saque->conta = $data["conta"];
        $saque->status = 1;
        $data_saque = strtotime(date("H:i")) >= '17:00' ? date("Y-m-d", strtotime("+3 days")) :  date("Y-m-d", strtotime("+2 days"));
        $saque->tempo_saque = $data_saque;
        $saque->taxa  = 0;
        $saque->data_pedido = date("Y-m-d");

        $dados["usuario"] = $saque->usuario;
        $dados["valor"] = $saque->valor;
        $this->cadastroSaldo($dados);
        
        if($saque->save()) {
            echo "Salvo com sucesso";
        } else {
            echo $saque->fail()->getMessage();
        }
    }

    public function statusSaque($data)
    {
        $saque = (new Comissao())->findById($data["id"]);

        $saque->status = $data["status"];
        $saque->codigo = $data["codigo"];
        $saque->observacao = $data["observacao"];

        if($saque->status == 3){
            $comissao = new Comissao();
            $comissao->usuario = $saque->usuario;
            $comissao->descricao = "Devolução solicitação de saque";
            $comissao->valor = $saque->valor * -1;
            $comissao->tempo_saque = date("Y-m-d");
            $comissao->data_pedido = date("Y-m-d");
            $comissao->tipo = 1;
            $comissao->disponivel = 2;
            $comissao->save();

            $saldo = (new Saldo())->find("usuario = $saque->usuario")->fetch();
            $saldo->valor += $saque->valor * -1;
            $saldo->save();
        }
        
        if($saque->save()) {
            echo "Atualizado com sucesso";
        } else {
            echo $saque->fail()->getMessage();
        }
    }

    public function banco($data)
    {
        $this->sessao = (new AppSessao())->verificaSeLogado();

        $paginador = new Paginador();
        $pagina = @$data["page"] ? $data["page"] : 1;
        $offset = 30;

        if($_SESSION["tipo"] == 1 || $_SESSION["tipo"] == 2){
            $bancosCount = (new Banco())->find()->count();
            $paginas = ceil($bancosCount / $offset);
            $bancos = (new Banco())->find()->limit($offset)->offset($paginador->paginador($pagina, $offset))->order("id DESC")->fetch(true);
        } else {
            $bancosCount = (new Banco())->find("usuario = " . $_SESSION["id"])->count();
            $paginas = ceil($bancosCount / $offset);
            $bancos = (new Banco())->find("usuario = " . $_SESSION["id"])->limit($offset)->offset($paginador->paginador($pagina, $offset))->fetch(true);
        }
        $usuario = new UsuarioDados();

        //var_dump($bancos);
        echo $this->view->render("comissao/banco", [
            "title" => "Contas Bancárias",
            "bancos" => $bancos,
            "paginador" => @$paginador,
            "paginas" => @$paginas,
            "pagina" => @$data["page"] ? $data["page"] : 1,
            "usuarioDados" => @$usuario,
        ]);
    }

    public function cadastroBanco($data)
    {
        $banco = new Banco();
        
        $banco->usuario = $_SESSION["id"];
        $banco->titular = @$data["titular"];
        $banco->cpf = @$data["cpf"];
        $banco->banco = @$data["banco"];
        $banco->agencia = @$data["agencia"];
        $banco->conta = @$data["conta"];
        $banco->tipo = @$data["tipo"];
        
        if($banco->cpf != @$data["cpf_usuario"])
            $banco->status = 1;
        else
            $banco->status = 3;

        //var_dump($data);
        if($banco->save()){
            echo "Salvo com sucesso";
        } else {
            echo $banco->fail()->getMessage();
        }
    }

    public function editarBanco($data)
    {
        $banco = (new Banco())->findById($data["id"]);
        
        $banco->titular = @$data["titular"];
        $banco->cpf = @$data["cpf"];
        $banco->banco = @$data["banco"];
        $banco->agencia = @$data["agencia"];
        $banco->conta = @$data["conta"];
        $banco->tipo = @$data["tipo"];

        if($banco->save()){
            echo "Atualizado com sucesso";
        } else {
            echo $banco->fail()->getMessage();
        }
    }

    public function editarStatusBanco($data)
    {
        $banco = (new Banco())->findById($data["idStatus"]);
        
        $banco->status = @$data["status"];

        if($banco->save()){
            echo "Atualizado com sucesso";
        } else {
            echo $banco->fail()->getMessage();
        }
    }

    public function excluirBanco($data)
    {
        $banco = (new Banco())->findById($data["id"]);

        if($banco->destroy()){
            echo "Excluido com sucesso";
        } else {
            echo $banco->fail()->getMessage();
        }
    }
}