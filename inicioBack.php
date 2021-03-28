<?php
session_start();
require_once('conexao.php');

if(!$conexao) {
    die("Erro: " .mysqli_error($conexao));
}

$destino = mysqli_real_escape_string($conexao, $_POST['destino']);
$data = mysqli_real_escape_string($conexao, $_POST['data']);
$orcamento = mysqli_real_escape_string($conexao, $_POST['orcamento']);

//queries aqui
$query;
$resultado = mysqli_query($conexao, $query);
$milhasTotais = mysql_fetch_assoc($resultado);
echo $milhasTotais;

$query;
$resultado = mysqli_query($conexao, $query);
$voos = mysql_fetch_assoc($resultado);
echo $voos;

$query;
$resultado = mysqli_query($conexao, $query);
$hoteis = mysql_fetch_assoc($resultado);
echo $hoteis;


$_SESSION['destino'] = $destino;
$_SESSION['milhasAcumuladas'] = $orcamento;
$_SESSION['milhasTotais'] = $milhasTotais; //query
$_SESSION['voos'] = $voos; //query
$_SESSION['hoteis'] = $hoteis; //query

header('Location: resultados.php');
exit();