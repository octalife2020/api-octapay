<?php

namespace Source\Models\Permissao;

use CoffeeCode\DataLayer\DataLayer;

class Permissao extends DataLayer
{
    public function __construct(){
        parent::__construct( "permissao", [] );
    }
}