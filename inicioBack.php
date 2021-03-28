<?php
session_start();
require_once('conexao.php');

if(!$conexao) {
    die("Erro: " .mysqli_error($conexao));
}

$destino = mysqli_real_escape_string($conexao, $_POST['destino']);
$data = mysqli_real_escape_string($conexao, $_POST['data']);
$orcamento = mysqli_real_escape_string($conexao, $_POST['orcamento']);
//$id = mysqli_real_escape_string($conexao, $_POST['id']);

$destinoId;
$query = "select id from destinos where nome='${destino}';";
$resultado = mysqli_query($conexao, $query);
if(mysqli_num_rows($resultado)){
    $dados = mysqli_fetch_assoc($resultado);
    $destinoId =  $dados["id"];
}

$milhasTotais;
$query = "select preco from viagens where destinoId=${destinoId};"; 
$resultado = mysqli_query($conexao, $query);
if(mysqli_num_rows($resultado)){
    $dados = mysqli_fetch_assoc($resultado);
    $milhasTotais =  $dados["preco"];
}

$orcamento_atual;
$query = "select orcamento_atual from viagens where destinoId={$destinoId};";
$resultado = mysqli_query($conexao, $query);
if(mysqli_num_rows($resultado)){
    $dados = mysqli_fetch_assoc($resultado);    
    $orcamento_atual = $dados["orcamento_atual"];
}

$voos;
$query = "select * from voos where destinoId=${destinoId};"; 
$resultado = mysqli_query($conexao, $query);
if(mysqli_num_rows($resultado)){
    $voos = mysqli_fetch_assoc($resultado);
}

$hoteis;
$query = "select * from hoteis where localId=${destinoId}"; 
$resultado = mysqli_query($conexao, $query);
if(mysqli_num_rows($resultado)){
    $hoteis = mysqli_fetch_assoc($resultado);
}

/*
$query = "select vooId from viagens where destinoId=${destinoId}"; 
$resultado = mysqli_query($conexao, $query);
$hotelViagem = mysql_fetch_assoc($resultado);
echo $hotelViagem;*/

$_SESSION['destino'] = $destino;
$_SESSION['milhasAcumuladas'] = $orcamento;
$_SESSION['milhasTotais'] = $milhasTotais; 
$_SESSION['voos'] = $voos;
$_SESSION['hoteis'] = $hoteis; 


header('Location: resultados.php');
exit();