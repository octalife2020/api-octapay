<?php

    //CHAMA O AUTOLOAD
    require __DIR__ . "/vendor/autoload.php";

    use CoffeeCode\Router\Router;

    //CONSTANTES FICAM NO ARQUIVO \SOURCE\CONFIG.PHP
    $router = new Router(URL_BASE);

    /*
    * NAMESPACE Source\App\Vendas
    */
    $router->namespace("Source\App\Vendas");

    $router->group("vendas");
    $router->get("/", "AppVendas:vendas", "vendas.vendas");
    $router->get("/{page}", "AppVendas:vendas", "vendas.vendas");

    /*
    * EERROS
    */
    $router->group("ops");
    $router->get("/{errcode}", "AppVendas:error");

    /*
    * Processos
    */
    $router->dispatch();

    if($router->error()){
        $router->redirect("/ops/{$router->error()}");
    }
