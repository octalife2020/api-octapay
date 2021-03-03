<?php

namespace Source\App\Checkout1;

class Emails
{
    public function boleto($data)
    {
        $data["assunto"]   = "Imprima seu boleto do ". $data["nomekit"];
        $data["mensagem"]  = "<h2>Obrigado pela compra!</h2>";
        $data["mensagem"] .= "<p>Ol&aacute; " . $data["nome"] . ", tudo bem?</p>";
        $data["mensagem"] .= "Seu pedido n&uacute;mero " . $data["transacao"] . " foi realizado com sucesso";
        $data["mensagem"] .= "<br>Produto: " . $data["nomekit"];
        $data["mensagem"] .= "<br>Voc&ecirc; pode imprimir o boleto clicando no link abaixo e pagar em qualquer banco ou casa lot&eacute;rica da sua regi&atilde;o
                                OU efetuar o pagamento no site do seu banco utilizando o c&oacute;digo de barras.<br><br>";
        $data["mensagem"] .= "<p><a href='".$data["link_boleto"]."' class='btn'>Visualizar Boleto</a></p>";
        return $data;
    }

    public function cartaoAprovado($data)
    {
        $data["assunto"]   = "Pagamento " . $data["nomekit"] . " Aprovado! ";
        $data["mensagem"]  = "<h2>Obrigado pela compra!</h2>";
        $data["mensagem"] .= "<p>Ol&aacute; " . $data["nome"] . ", tudo bem?</p>";
        $data["mensagem"] .= "Seu pedido n&uacute;mero " . $data["transacao"] . " foi realizado com sucesso";
        $data["mensagem"] .= "<br>Verifique os dados do cart&atilde;o e tente novamente.<br><br>";
        $data["mensagem"] .= "<br>Produto: " . $data["nomekit"];
        return $data;
    }

    public function cartaoRecusado($data)
    {
        $data["assunto"]   = "Pagamento " . $data["nomekit"] . " Reprovado! ";
        $data["mensagem"]  = "<h2>Obrigado pela compra!</h2>";
        $data["mensagem"] .= "<p>Ol&aacute; " . $data["nome"] . ", tudo bem?</p>";
        $data["mensagem"] .= "Seu pedido n&uacute;mero " . $data["transacao"] . " foi recusado";
        $data["mensagem"] .= "<br>Produto: " . $data["nomekit"];
        return $data;
    }

    public function cartaoProcessando($data)
    {
        $data["assunto"]   = "Pagamento " . $data["nomekit"] . " Em Processo de Analise! ";
        $data["mensagem"]  = "<h2>Obrigado pela compra!</h2>";
        $data["mensagem"] .= "<p>Ol&aacute; " . $data["nome"] . ", tudo bem?</p>";
        $data["mensagem"] .= "Seu pedido n&uacute;mero " . $data["transacao"] . " est&aacute; em processo de an&aacute;lise";
        $data["mensagem"] .= "<br>Produto: " . $data["nomekit"];
        return $data;
    }

    public function enviaEmail($data)
    {
        //$to  = $data["email_cliente"]. ', '; // note the comma
        $to = @$data["email"];

        // subject
        $subject = $data["assunto"];

        $ano = date("Y");
        // message
        $message = '
        <style type="text/css">
            *{
                font-family: "Segoe UI", Roboto, sans-serif;
                margin: 0;
            }
            .center{
                text-align: center;
            }
            .topo, footer{
                padding: 3em 5em;
                background: #0061A7;
                color: #fff;
            }
            .content{
                padding: 2em 5em;
            }
            p{
                font-size: 18px;
            }
            main{
                padding: 1em 0;
            }
            .btn {
                background: #86B600;
                padding: 1em;
                color: #fff;
            }
            a {
                text-decoration: none;
            }
        </style>
            
            <header class="topo center">
                <h1><img src="https://octapay.com.br/octapay/themes/tema2/assets/imgs/OCTAPAY_H-14.png" alt="OctaPay" height="100px"></h1>
            </header>

            <main class="center">
                <p>'. $data["mensagem"] .'</p>
            </main>
            <footer>
                <br><br> &copy; Copyright 2020 - ' . $ano . 'OctaPay.
            </footer>';

        // To send HTML mail, the Content-type header must be set
        $headers  = "MIME-Version: 1.0 \r\n";
        $headers .= "Content-Type: text/html; charset=ISO-8859-1 \r\n";

        // Additional headers
        $headers .= 'To: Octa Life <'.$to.'>' . "\r\n";
        $headers .= 'From: OctaPay <sac@octa.life>' . "\r\n";
        $headers .= 'Reply: OctaPay <sac@octa.life>' . "\r\n";

        // Mail it
        mail($to, $subject, $message, $headers);
    }
}