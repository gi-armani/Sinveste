<?php
$HOST = "localhost";
$USUARIO = "root";
$SENHA = "";
$DB = "smoney";

$dominio = 'http://localhost/smoney/';
$PORTA = "3306";

$conexao=mysqli_connect($HOST, $USUARIO, $SENHA, $DB,  $PORTA) or die ('Nao foi possivel conectar');
$conexao->set_charset('utf8');
//mysqli_select_db($conexao, $DB) or die (mysqli_error($conexao));
