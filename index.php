<?php

//CHAMA O AUTOLOAD
require __DIR__ . "/vendor/autoload.php";

use CoffeeCode\Router\Router;

//CONSTANTES FICAM NO ARQUIVO \SOURCE\CONFIG.PHP
$router = new Router(URL_BASE);

/*
* NAMESPACE Source\App\Login
*/
$router->namespace("Source\App\Login");


    /** LOGIN */
    /** ROTAS PARA LOGIN E PARA QUEM JÁ ESTÁ CADASTRADO */
    $router->group("login");
    $router->get("/", "AppLogin:login", "login.login");
    $router->get("/{id}", "AppLogin:ativarUsuario", "login.ativar");
    $router->post("/", "AppLogin:logar", "login.logar");
    $router->post("/enc", "AppLogin:loginEnc", "login.encomendas");

    $router->group(null);
    $router->get("/cadastro", "AppLogin:cadastro", "appusuarios.cadastro");
    $router->post("/cadastrar", "AppLogin:cadastroUsuarios", "appusuarios.cadastrar");


/*
* NAMESPACE App\Geral
*/
$router->namespace("Source\App\Geral");

    /*
    * Web
    * /home, usuarios, relatorios /
    */
    $router->group(null);
    $router->get("/", "AppWeb:painel", "appweb.painel");
    $router->get("/marketplace", "AppWeb:marketplace", "appweb.marketplace");
    $router->get("/links-uteis", "AppWeb:linksUteis", "appweb.links");
    $router->get("/cursos", "AppWeb:cursos", "appweb.cursos");

    $router->get("/termos-uso", "AppTermos:termosUso", "apptermos.termosUso");
    $router->get("/termos-compra", "AppTermos:termosCompra", "apptermos.termosCompra");
    $router->get("/politica-privacidade", "AppTermos:politicaPrivacidade", "apptermos.politicaPrivacidade");
    $router->get("/politica-disputa", "AppTermos:politicaDisputa", "apptermos.politicaDisputa");
    $router->get("/ajuda-usuarios", "AppTermos:ajudaUsuarios", "apptermos.ajudaUsuarios");

    /*
    * EERROS
    */
    $router->group("ops");
    $router->get("/{errcode}", "AppWeb:error");

    $router->get("/testeResult", "Teste:teste");
    $router->post("/teste", "Teste:teste2");


/*
* NAMESPACE Source\App\Permissao
*/
$router->namespace("Source\App\Permissao");
/** USUÁRIOS */
$router->group("permissoes");
$router->get("/", "AppPermissao:permissao", "appusuarios.permissao");


/*
* NAMESPACE Source\App\Usuarios
*/
$router->namespace("Source\App\Usuarios");
    /** USUÁRIOS */
    
    $router->group("funcionarios");
    $router->get("/", "AppUsuarios:usuarios", "appusuarios.home");
    $router->get("/p/{page}", "AppUsuarios:usuarios", "appusuarios.home");

    $router->post("/", "AppUsuarios:cadastroFuncionarios", "appusuarios.funcionarios");
    $router->post("/editar", "AppUsuarios:editar", "appusuarios.editar");
    $router->post("/verifica-email", "AppUsuarios:verificaEmail", "appusuarios.email");
    $router->post("/verifica-login", "AppUsuarios:verificaLogin", "appusuarios.login");
    $router->post("/verifica-cpf", "AppUsuarios:verificaCpf", "appusuarios.cpf");
    $router->post("/busca-comprador", "AppUsuarios:buscaComprador", "appusuarios.buscaComprador");

    $router->group("usuarios");
    
    $router->post("/esqueceu-senha", "AppUsuarios:esqueceuSenha", "appusuarios.esqueceuSenha");
    $router->get("/redefinir-senha/{id}/{codigo}", "AppUsuarios:redefinirSenha", "appusuarios.redefinirSenha");
    $router->post("/atualiza-senha", "AppUsuarios:atualizaSenha", "appusuarios.atualizaSenha");

    $router->get("/perfild/{id}", "AppUsuarios:perfilUsuarioD", "appusuarios.perfil2");
    $router->get("/perfil/{id}", "AppUsuarios:perfilUsuario", "appusuarios.perfil");
    $router->post("/perfil", "AppUsuarios:editarUsuarioPerfil", "appusuarios.perfilEditar");
    $router->post("/perfil/foto", "AppUsuarios:fotoPerfil", "appusuarios.fotoPerfil");
    $router->post("/perfil/tipo", "AppUsuarios:tipoUsuario", "appusuarios.tipoUsuario");


/*
* NAMESPACE Source\App\Produtor
*/
$router->namespace("Source\App\Comissao");

    /*
    * Produtores
    * produtor/
    */
    $router->group("comissao");
    $router->get("/", "AppComissao:comissao", "appcomissao.produtor");
    $router->get("/{page}", "AppComissao:comissao", "appcomissao.produtor");
    $router->get("/octapay", "AppComissao:comissaoOctapay", "appcomissao.octapay");
    $router->get("/octapay/{page}", "AppComissao:comissaoOctapay", "appcomissao.octapay");
    $router->get("/cadastro", "AppComissao:verificaComissao", "appcomissao.cadastro");
    $router->get("/saldo", "AppComissao:verificarSaldo", "appcomissao.saldo");

    $router->group("banco");
    $router->get("/", "AppComissao:banco", "appcomissao.banco");
    $router->post("/cadastro", "AppComissao:cadastroBanco", "appcomissao.bancoCadastro");
    $router->post("/editar", "AppComissao:editarBanco", "appcomissao.bancoEditar");
    $router->post("/editar-status", "AppComissao:editarStatusBanco", "appcomissao.bancoStatus");
    $router->post("/excluir", "AppComissao:excluirBanco", "appcomissao.bancoExcluir");

    $router->group("saques");
    $router->get("/", "AppComissao:saque", "appcomissao.saque");
    $router->post("/", "AppComissao:solicitarSaque", "appcomissao.sacar");
    $router->post("/status", "AppComissao:statusSaque", "appcomissao.statusSaque");

    $router->group("antecipacao");
    $router->get("/", "AppComissao:antecipacao", "appcomissao.antecipacao");
    $router->post("/antecipar", "AppComissao:antecipar", "appcomissao.antecipar");
/*
* NAMESPACE Source\App\Produtor
*/
$router->namespace("Source\App\Produtor");

    /*
    * Produtores
    * produtor/
    */
    $router->group("usuarios");
    $router->get("/", "AppProdutor:produtor", "app_produtor.produtor");
    $router->get("/{page}", "AppProdutor:produtor", "app_produtor.produtor");
    $router->post("/editar", "AppProdutor:editarProdutor", "produtor.editar");
    $router->post("/inativar", "AppProdutor:inativarProdutor", "produtor.inativar");

/*
* NAMESPACE Source\App\Produtor
*/
$router->namespace("Source\App\Afiliados");

    $router->group("afiliados");
    $router->get("/", "AppAfiliados:afiliados", "appafiliados.afiliados");
    $router->get("/{page}", "AppAfiliados:afiliados", "appafiliados.afiliados");

    $router->post("/afiliacao", "AppAfiliados:afiliacao", "appafiliados.afiliacao");
    $router->post("/editar", "AppAfiliados:editarAfiliacao", "appafiliados.editar");
    $router->post("/excluir", "AppAfiliados:afiliacaoExcluir", "afiliacao.excluir");

    $router->post("/editar-afiliado", "AppAfiliados:editarAfiliado", "afiliado.editar");
    $router->post("/inativar", "AppAfiliados:inativarAfiliado", "afiliado.inativar");

/*
* NAMESPACE App\Produtos
*/
$router->namespace("Source\App\Produtos");

/*
* Produtos
* /produtos, estoque, kit, entradaProduto, saidaProduto/
*/
$router->group("produtos");
$router->get("/", "AppProdutos:produtos","produtos.home");
$router->get("/p/{page}", "AppProdutos:produtos","produtos.home");

$router->get("/promovidos", "AppProdutos:produtosPromovidos","produtos.promovidos");
$router->get("/coproducoes", "AppProdutos:minhasCoproducoes","produtos.coproducoes");
$router->post("/aceitar-coproducao", "AppProdutos:aceitarCoproducao","produtos.aceitarCoproducao");

$router->get("/novo", "AppProdutos:novo","produtos.novo");
$router->get("/detalhe/{codigo}", "AppProdutos:detalhes","produtos.detalhes");
$router->get("/editar/{codigo}", "AppProdutos:editarP","produtos.editar");

$router->get("/afiliados/{codigo}", "AppProdutos:afiliados","produtos.afiliados");

$router->get("/coproducao/{codigo}", "AppProdutos:coproducao","produtos.coproducao");
$router->get("/checkout/{codigo}", "AppProdutos:checkout","produtos.checkout");
$router->get("/planos/{codigo}", "AppProdutos:planos","produtos.planos");

$router->get("/campanhas/{codigo}", "AppProdutos:campanhas","produtos.campanhas");
$router->get("/campanhas/{codigo}/{page}", "AppProdutos:campanhas","produtos.campanhas");


$router->post("/novo", "AppProdutos:cadastro", "produtos.cadastro");
$router->post("/editar", "AppProdutos:editar", "produtos.editarPost");
$router->post("/editar-status", "AppProdutos:editarStatus", "produtos.editarStatus");
$router->post("/afiliados/{codigo}", "AppProdutos:afiliadosProduto", "produtos.afiliados");

$router->post("/coproducao", "AppProdutos:coproducaoCadastro","produtos.coproducaoCadastro");
$router->post("/coproducao-editar", "AppProdutos:coproducaoEditar","produtos.coproducaoEditar");
$router->post("/coproducao-excluir", "AppProdutos:coproducaoExcluir","produtos.coproducaoExcluir");

$router->post("/checkout", "AppProdutos:checkoutCadastro","produtos.checkoutCadastro");
$router->post("/checkout-editar", "AppProdutos:checkoutEditar","produtos.checkoutEditar");
$router->post("/checkout-excluir", "AppProdutos:checkoutExcluir","produtos.checkoutExcluir");

$router->get("/urls/{codigo}", "AppProdutos:urls","produtos.url");
$router->post("/urls", "AppProdutos:urlCadastro","produtos.urlCadastro");
$router->post("/url-editar", "AppProdutos:urlEditar","produtos.urlEditar");
$router->post("/url-excluir", "AppProdutos:urlExcluir","produtos.urlExcluir");

$router->post("/planos", "AppProdutos:planoCadastro","produtos.planosCadastro");
$router->post("/planos-editar", "AppProdutos:planoEditar","produtos.planosEditar");
$router->post("/planos-excluir", "AppProdutos:planoExcluir","produtos.planosExcluir");

$router->post("/campanha", "AppProdutos:campanhaCadastro","produtos.campanha");
$router->post("/campanha-editar", "AppProdutos:campanhaEditar","produtos.campanhaEditar");
$router->post("/campanha-excluir", "AppProdutos:campanhaExcluir","produtos.campanhaExcluir");


$router->group("rockets");
$router->get("/", "AppRockets:produtos","rockets.home");

/*
* NAMESPACE App\Pixel
*/
$router->namespace("Source\App\Pixel");

/*
* Pixel
*/
$router->group("pixel");
$router->get("/", "AppPixel:pixel", "pixel.pixel");
$router->get("/{page}", "AppPixel:pixel", "pixel.pixel");
$router->post("/", "AppPixel:cadastroPixel", "pixel.cadastro");
$router->post("/editar", "AppPixel:editarPixel", "pixel.editar");
$router->post("/excluir", "AppPixel:excluirPixel", "pixel.excluir");


/*
* NAMESPACE Source\App\Vendas
*/
$router->namespace("Source\App\Vendas");

$router->group("vendas");
$router->get("/", "AppVendas:vendas", "vendas.vendas");
$router->get("/{page}", "AppVendas:vendas", "vendas.vendas");
$router->get("/coprodutor", "AppVendas:vendasCoprodutor", "vendas.coprodutor");
$router->get("/coprodutor/{page}", "AppVendas:vendasCoprodutor", "vendas.coprodutor");
$router->post("/motivo", "AppVendas:motivoCancelamento", "vendas.motivo");
$router->post("/editar", "AppVendas:respostaEditar", "vendas.editar");
$router->post("/editarP", "AppVendas:editarP", "vendas.editarP");


/*
* NAMESPACE Source\App\Checkout1
*/
$router->namespace("Source\App\Checkout1");

$router->group("checkout");
$router->get("/", "AppCheckout:home", "checkout.home");
//$router->get("/p/{plano}", "AppCheckout:produto", "checkout.produto");
$router->get("/{plano}", "AppCheckout:produto", "checkout.produto");
$router->get("/pixel", "AppCheckout:pixel", "checkout.pixel");
$router->get("/analytics", "AppCheckout:analytics", "checkout.analytics");
$router->post("/transacao", "AppCheckout:transacao2", "checkout.transacao");
$router->get("/processando", "AppCheckout:obrigadoProcessando", "checkout.processando");
$router->get("/pedido-reservado", "AppCheckout:obrigadoBoleto", "checkout.reserva");
$router->get("/obrigado", "AppCheckout:obrigadoCartao", "checkout.obrigado");
$router->get("/recusado", "AppCheckout:recusado", "checkout.recusado");
$router->get("/redirect", "AppCheckout:redirect", "checkout.redirect");

$router->post("/novo-boleto", "AppCheckout:gerarNovoBoleto", "checkout.novoBoleto");
$router->post("/processos", "AppProcessos:processos", "checkout.processos");

$router->get("/termos", "Termos:termos", "termos.termos");
$router->get("/privacidade", "Termos:privacidade", "termos.privacidade");

$router->group("abandono");
$router->get("/", "AppCarrinhoAbandonado:abandonos", "abandono.abandonos");
$router->post("/", "AppCarrinhoAbandonado:cadastroCarrinho", "abandono.cadastro");
$router->get("/excluir", "AppCarrinhoAbandonado:excluirCarrinho", "abandono.excluir");

/*
* NAMESPACE Source\App\WebHooks
*/
$router->namespace("Source\App\WebHooks");

$router->group("webhook");
$router->get("/notificacao", "AppWebHook:criarNotificacaoWebhook", "webhook.notificacao");
$router->post("/", "AppWebHook:webhook", "webhook.webhook");
$router->get("/vendas", "AppWebHook:webhookVendas", "webhook.vendas"); // ENVIA VENDAS PARA ST4RT

/*
* NAMESPACE Source\App\WebHooks
*/
$router->namespace("Source\App\Postback");

$router->group("postbacks");
$router->get("/", "AppPostback:postback", "postback.postbacks");
$router->get("/{page}", "AppPostback:postback", "postback.postbacks");
$router->post("/enviar", "AppPostback:enviarPostback", "postback.enviar");
$router->post("/retorno", "AppPostback:enviarPostbackRetorno", "postback.retorno");
$router->post("/testar", "AppPostback:testarPostback", "postback.testar");
$router->post("/cadastrar", "AppPostback:cadastrarPostback", "postback.cadastrar");
$router->post("/editar", "AppPostback:editarPostback", "postback.editar");

/*
* NAMESPACE Source\App\WebHooks
*/
$router->namespace("Source\App\Notificacao");

$router->group("notificacoes");
$router->get("/", "AppNotificacao:notificacoes", "notificacao.notificacao");
$router->get("/p/{page}", "AppNotificacao:notificacoes", "notificacao.notificacao");
$router->post("/", "AppNotificacao:postbackNotificacao", "notificacao.postback");

/*
* NAMESPACE Source\App\Cookies
*/
$router->namespace("Source\App\Cookies");

    $router->group(null);
    $router->get("/a/{afiliacao}", "AppCookies:cookies", "cookies.cookies");
    $router->get("/c/{campanha}", "AppCookies:campanha", "cookies.campanha");
    $router->get("/up/{id}", "AppCookies:usuarioPremium", "cookies.usuarioPremium");

/*
* NAMESPACE Source\App\Configuracoes
*/
$router->namespace("Source\App\Configuracoes");

    $router->group("taxas");
    $router->get("/", "AppTaxas:taxas", "taxa.taxas");
    $router->get("/antecipar", "AppTaxas:antecipar", "taxa.antecipacao");
    $router->post("/editar", "AppTaxas:editarTaxa", "taxa.editar");
    $router->post("/antecipar", "AppTaxas:editarAntecipacao", "taxa.antecipar");
    //$router->get("/p/{plano}", "AppCheckout:produto", "checkout.produto");


/*
 * NAMESPACE Source\App\Denuncias"
 */
$router->namespace("Source\App\Denuncias");

    $router->group("denuncias");
    $router->get("/", "AppDenuncia:denuncias", "denuncias.denuncias");
    $router->post("/enviar", "AppDenuncia:cadastroDenuncia", "denuncias.cadastrar");
    $router->post("/antecipar", "AppTaxas:editarAntecipacao", "taxa.antecipar");

/*
 * NAMESPACE Source\App\Relatorios"
 */
$router->namespace("Source\App\Relatorios");

    $router->group("relatorios");
    $router->get("/", "AppRelatorios:relatorios");
    $router->get("/exportar", "AppRelatorios:exportar");
    $router->post("/", "AppRelatorios:relatorios");
    $router->post("/busca", "AppRelatorios:buscaRelatorios", "relatorios.busca");

    $router->get("/painel", "AppRelatorios:painelOctapay");
    $router->post("/painel", "AppRelatorios:painelOctapay");

/*
 * NAMESPACE Source\App\Notazz"
 */
$router->namespace("Source\App\Notazz");

    $router->group("notas");
    $router->get("/", "AppNotazz:notas", "notazz.notas");
    $router->get("/{page}", "AppNotazz:notas", "notazz.notas");
    $router->get("/integracao", "AppNotazz:integracao", "notazz.integracao");
    $router->get("/integracao/{page}", "AppNotazz:integracao", "notazz.integracao");
    $router->post("/cadastrar", "AppNotazz:cadastrarIntegracao", "notazz.cadastrar");
    $router->post("/editar", "AppNotazz:editarIntegracao", "notazz.editar");
    $router->post("/excluir", "AppNotazz:excluirIntegracao", "notazz.excluir");
    
    $router->post("/gerar", "AppNotazz:gerarNota", "notazz.gerar");
    $router->post("/consultar-cancelar", "AppNotazz:consultar", "notazz.consultarCancelar");
    
    $router->post("/postback", "AppNotazz:postbackNotazz", "notazz.postback");


/*
* NAMESPACE Source\App\Whatsapp"
*/
$router->namespace("Source\App\Whatsapp");

    $router->group("whatsapp");
    $router->get("/notificacoes-inteligentes", "AppNotificacoesInteligentes:notificacoes", "whatsapp.notificacoes");
    $router->get("/notificacoes-inteligentes/{page}", "AppNotificacoesInteligentes:notificacoes", "whatsapp.notificacoes");
    $router->post("/cadastrar-notificacoes", "AppNotificacoesInteligentes:cadastrarNotificacoesInteligentes", "whatsapp.cadastrarNI");
    $router->post("/editar-notificacoes", "AppNotificacoesInteligentes:editarNotificacoesInteligentes", "whatsapp.editarNI");
    $router->post("/excluir-notificacoes", "AppNotificacoesInteligentes:excluirNotificacao", "whatsapp.excluirNI");
    $router->post("/editar", "AppNotazz:editarIntegracao", "notazz.editar");
    $router->post("/excluir", "AppNotazz:excluirIntegracao", "notazz.excluir");

    $router->post("/gerar", "AppNotazz:gerarNota", "notazz.gerar");
    $router->post("/consultar-cancelar", "AppNotazz:consultar", "notazz.consultarCancelar");

    $router->post("/postback", "AppNotazz:postbackNotazz", "notazz.postback");


/*
* Processos
*/
$router->dispatch();

if($router->error()){
    $router->redirect("/ops/{$router->error()}");
}
