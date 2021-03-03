<?php

namespace Source\Helpers;

class Paginador
{
    public function paginador($page, $offset)
    {
        if($page == null || $page == 1) {
            $page = 0;
        }
        else {
            $page *= $offset;
            $page -= $offset;
        }

        return $page;
    }
}