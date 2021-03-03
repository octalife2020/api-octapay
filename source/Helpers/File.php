<?php

namespace Source\Helpers;

class File
{
    public function upload($files, $pasta, $tamanho = 2)
    {
        
        var_dump($files);
        $files["size"] = $files["size"] / 1024 / 1024;
        echo " - " . $files["size"];

        $nome = explode(".", $files["name"]);

        if($nome[1] != "png" && $nome[1] != "jpg" && $nome[1] != "pdf" && $nome[1] != "zip" && $nome[1] != "rar"){
            return false;
            exit;
        }

        if ($files["size"] > $tamanho) {
            return false;
            exit;
        } elseif(isset($files['name']) && $files["error"] == 0) {
            $arquivo_tmp = $files['tmp_name'];
            $nome = $files['name'];

            $extensao = strrchr($nome, '.');
            $extensao = strtolower($extensao);
    
            $novoNome = md5(microtime()) . $extensao;
            $destino = $pasta . $novoNome; 
            
            if( @move_uploaded_file( $arquivo_tmp, $destino  ))
            {
                return $novoNome;
            }
            else{
                return false;
            }
        } else {
            return false;
        }
    }
}
