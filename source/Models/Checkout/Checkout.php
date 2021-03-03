<?php

namespace Source\Models\Checkout;

use CoffeeCode\DataLayer\DataLayer;
use Source\Models\Usuarios\Usuario;
use Source\Models\Produtos\Produto;
use Source\Models\Produtos\Plano;

class Checkout extends DataLayer
{
    public function __construct(){
        
        date_default_timezone_set('America/Sao_Paulo');
        parent::__construct( "checkout", [] );
    }

    /** RETORNA OS DADOS DO PRODUTOR */
    public function dataProdutor(){
        return (new Usuario())->find("id = :uid", "uid={$this->usuario}")->fetch(true);
    }

    /** RETORNA OS DADOS DO PRODUTO */
    public function dataProduto(){
        return (new Produto())->find("id = :uid", "uid={$this->produto}")->fetch(true);
    }

    /** RETORNA OS DADOS DO PLANO */
    public function dataPlano(){
        return (new Plano())->find("id = :uid", "uid={$this->plano}")->fetch(true);
    }
}

/** PROPRIEDADES
 * 
 *  id int(11)
 *  codigo varchar(20)
 *  descricao varchar(200)
 *  produto int(11)
 *  plano int(11)
 *  cupom varchar(10)
 *  valor_cupom decimal(10,2)
 *  so_cartao tinyint(4)
 *  usuario int(11)
 *  banner varchar(200)
 *  aviso varchar(200)
 *  created_at timestamp
 *  updated_at timestamp
 */