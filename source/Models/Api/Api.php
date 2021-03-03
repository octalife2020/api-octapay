<?php

namespace Source\Models\Api;

use CoffeeCode\DataLayer\DataLayer;
use Source\Models\Usuarios\Usuario;
use Source\Models\Produtos\Produto;
use Source\Models\Produtos\Plano;

class Api extends DataLayer
{
    public function __construct(){
        
        parent::__construct( "api", [] );
    }

    public function dataUsuario(){
        return (new Usuario())->findById($this->usuario);
    }
}

/** PROPRIEDADES
 * 
 *	id int(11)
 *  usuario int(11)
 *  afiliado int(11)
 *  token varchar(100)
 *  chave varchar(100)
 *  created_at timestamp
 *  updated_at timestamp
 */