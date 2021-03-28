<?php
    require_once('conexao.php');
    session_start();

    if(!$conexao) {
        die("Erro: " .mysqli_error($conexao));
    }

    $destino = mysqli_real_escape_string($conexao, $_POST['destino']);
    $data = mysqli_real_escape_string($conexao, $_POST['data']);
    $orcamento = mysqli_real_escape_string($conexao, $_POST['orcamento']);

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
        $voos = $resultado;
    }
    $voos2 = $voos;
    var_dump($voos2);
    
    $hoteis;
    $query = "select * from hoteis where localId=${destinoId}"; 
    $resultado = mysqli_query($conexao, $query);
    if(mysqli_num_rows($resultado)){
        $hoteis = $resultado;
    }

    $porcentagemCompleta = ($orcamento * 100)/$milhasTotais;

    $novaData;
    function trataData($data) {
        $dataExplodida = explode('-', $data);
        $ano = $dataExplodida[0];
        $mes = $dataExplodida[1];
        $dia = $dataExplodida[2];

        $novaData = "${dia}/${mes}/${ano}";
        return $novaData;
    }

    ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="resultados.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Roboto', sans-serif;
            }
        </style>
    </head>
    <body>
        <?php include 'header.php';?>
        <div class='container'>
            <div class='calculoDeMilhas'>
                <h1>Vamos fazer um planejamento financeiro para sua viagem para o <?php echo $destino?>!</h1>
                <div class='relacao-de-milhas'>
                    <div style="width: 50%; align-itens: flex-start;">
                        <h5>Total acumulado</h5>
                        <h5><?php echo $orcamento?> milhas</h5>
                    </div>
                    <div style="width: 50%; display: flex; flex-direction: column; justify-content: flex-end; align-items: flex-end">
                        <h5 style='margin-bottom: 1rem;'>Total necessário</h5>
                        <h5 style='margin-top: 1rem;'><?php echo $milhasTotais?> milhas</h5>
                    </div>
                </div>
                <div class='contorno-quadro-milhas'>
                    <div class='preenche-quadro-milhas' style='width: <?php echo $porcentagemCompleta ?>%'></div>
                </div>
            </div>
            <!-- <img src='fotos/quadroDeMilhas.svg' class='quadroDeMilhas'/> -->

            <div>
                <button type='button' class='tabs-button' onclick="mostrarPrimeiro()" autofocus>Etapas</button>
                <button type='button' class='tabs-button' onclick="mostrarSegundo()">Gestão Financeira</button>
                <button type='button' class='tabs-button' onclick="mostrarTerceiro()">Gerenciar viagem</button>
                <button type='button' class='tabs-button' onclick="mostrarQuarto()">Adquirir milhas</button>
                <button type='button' class='tabs-button' onclick="mostrarQuinto()">Painel de despesas pessoais</button>
            </div>

            <div id='primeiro' >
                <h1>É hora de aprender! Invista em você!</h1>
                <div class="despesas-wrapper">
                    <div class='mesma-linha'>
                        <h5>Aprenda a economizar seu dinheiro com </h5><h5 style='color: #FF5A00'> quem entende do assunto </h5> <h5>.</h5>
                    </div>
                    <div class='mesma-linha'>
                        <h5>Sempre que terminar de assistir um vídeo, você ganhará milhas bônus porque </h5><h5 style='color: #FF5A00'> investir nos seus sonhos, é investir em você </h5> <h5>!</h5>
                    </div>
                    <img src="fotos/resultados/financeiro1certo.svg" class='etapas'>
                    <img src="fotos/resultados/financeiro2certo.svg" class='etapas' style='width: 70rem'>
                    <button type='button' class='tabs-button'>Carregar mais</button>
                    <h5>Preparamos alguns arquivos que você pode usar no seu planejamento diário:</h5>
                    <div class='botoes-arquivos'>
                        <button type='button' class='tabs-button'>Arquivo 1</button>
                        <button type='button' class='tabs-button'>Arquivo 2</button>
                        <button type='button' class='tabs-button'>Arquivo 3</button>
    
                    </div>

                </div>
            </div>

            <div id='segundo' style='display: none;'>
                <h1>Invista no seu sonho, ainda não está tarde!</h1>
                <div class='etapas-container'>
                    <img src="fotos/resultados/etapas1.svg" class="etapas"><br>
                    <div class='mesma-linha'>
                        <h4>Reserve com </h4><h4 style='color: #FF5A00'> antecedência </h4> <h4>seu hotel</h4>

                    </div>
                    <!-- <h4>Aqui estão algumas sugestões para você:</h4> -->
                    <!-- <img src="fotos/resultados/etapas2.svg" class="etapas"> -->
                    <img src="fotos/resultados/etapas3.svg" class="etapas">

                </div>
            </div>

            <div id='terceiro' style='display: none;'>
                <div class="wrapper-boxes">
                    <div class='botoes-gerencia-container'>
                        <button class='botao-gerencia' id='gerencia1' onclick="mostrarGerencia1()" autofocus><p>Opções de voo</p></button>
                        <button class='botao-gerencia' id='gerencia2' onclick="mostrarGerencia2()" ><p>Opções de hotel</p></button>
                        <button class='botao-gerencia' id='gerencia3' onclick="mostrarGerencia3()" ><p>Suas reservas</p></button>
                    </div>

                    <div id='opcoes-voos'>
                        <?php
                            while($row = mysqli_fetch_array($voos, MYSQLI_ASSOC)){
                                $partida; 
                                $destino;
                                $partidaId = $row['partidaId'];
                                $query = "select nome from destinos where id=${partidaId}";
                                $resultado = mysqli_query($conexao, $query);
                                if(mysqli_num_rows($resultado)){
                                    $dados = mysqli_fetch_assoc($resultado);
                                    $partida = $dados['nome'];
                                }
                                $destinoId = $row['destinoId'];
                                $query = "select nome from destinos where id=${destinoId}";
                                $resultado = mysqli_query($conexao, $query);
                                if(mysqli_num_rows($resultado)){
                                    $dados = mysqli_fetch_assoc($resultado);
                                    $destino = $dados['nome'];
                                }
                        ?>
                        <div class="box">
                        <!-- <p class="title">Voo</p>  -->
                            <div class="wrapper">
                                <div class="esquerda">
                                    <div>
                                        <p class="text"> <?php echo $partida?> </p>
                                        <p class="text"> <?php echo $destino?> </p>
                                    </div>
                                    <div>
                                        <p class="text"> <?php echo $row['duracao']?> </p>
                                        <p class="text"> <?php echo trataData($row['data']) ?> </p>
                                    </div>
                                </div>
                                <div class="direita">
                                    <div>
                                        <p style='text-align:center;' class="bigger-text">Total necessário </p>
                                        <p style='text-align:center;' class="bigger-text"><b><?php echo $row['valor']?></b> milhas</p>
                                    </div>
                                    <div>
                                        <p class="special-text"> Reserve agora e ganhe +500 bônus </p>
                                    </div>
                                    <div class="button-wrapper">
                                        <button type='button' class='tabs-button' onClick="">Reservar</button>
                                        <!-- <button type='button' class='tabs-button' onClick="">Diminuir</button> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                
                    <?php  } ?>

                    <div id='opcoes-hoteis' style='display: none;'>
                        <?php     
                            while($row = mysqli_fetch_array($hoteis, MYSQLI_ASSOC)){
                            
                        ?>
                        <div class="box">
                        <!-- <p class="title">Hoteis</p> -->
                            <div class="wrapper">
                                <div class="esquerda">
                                    <div>
                                        <p class="text"> <?php echo $row['nome']; ?> </p>
                                        <p class="text"> <?php echo $destino; ?> </p>
                                        
                                    </div>
                                    <div>
                                        <p class="text"> <?php echo $novaData; ?> </p>
                                    </div>
                                </div>
                                <div class="direita">
                                    <div>
                                        <p style='text-align:center;' class="bigger-text">Total necessário</p>
                                        <p style='text-align:center;' class="bigger-text"><b> <?php echo $row['valor']; ?></b> milhas</p>
                                    </div>
                                    <div>
                                        <p class="special-text"> Continue juntando </p>
                                    </div>
                                    <div class="button-wrapper">
                                        <button type='button' class='tabs-button'>Reservar</button>
                                        <!-- <button type='button' class='tabs-button' onClick="">Diminuir</button> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <?php } ?>
                
                    <div id='minhas-reservas' style='display: none;'>
                        <?php
                            while($row = mysqli_fetch_array($voos2, MYSQLI_ASSOC)){
                                $partida; 
                                $destino;
                                $partidaId = $row['partidaId'];
                                $query = "select nome from destinos where id=${partidaId}";
                                $resultado = mysqli_query($conexao, $query);
                                if(mysqli_num_rows($resultado)){
                                    $dados = mysqli_fetch_assoc($resultado);
                                    $partida = $dados['nome'];
                                }
                                $destinoId = $row['destinoId'];
                                $query = "select nome from destinos where id=${destinoId}";
                                $resultado = mysqli_query($conexao, $query);
                                if(mysqli_num_rows($resultado)){
                                    $dados = mysqli_fetch_assoc($resultado);
                                    $destino = $dados['nome'];
                                }
                        ?>
                        <div class="box">
                        <!-- <p class="title">Voo</p>  -->
                            <div class="wrapper">
                                <div class="esquerda">
                                    <div>
                                        <p class="text"> <?php echo $partida?> </p>
                                        <p class="text"> <?php echo $destino?> </p>
                                    </div>
                                    <div>
                                        <p class="text"> <?php echo $row['duracao']?> </p>
                                        <p class="text"> <?php echo trataData($row['data']) ?> </p>
                                    </div>
                                </div>
                                <div class="direita">
                                    <div>
                                        <p style='text-align:center;' class="bigger-text">Total necessário </p>
                                        <p style='text-align:center;' class="bigger-text"><b><?php echo $row['valor']?></b> milhas</p>
                                    </div>
                                    <div>
                                        <p class="special-text"> Reserve agora e ganhe +500 bônus </p>
                                    </div>
                                    <div class="button-wrapper">
                                        <button type='button' class='tabs-button' onClick="">Reservar</button>
                                        <!-- <button type='button' class='tabs-button' onClick="">Diminuir</button> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <?php  } ?>
                
                    
                </div> 
            </div>

            <div id='quarto' style='display: none;'>
                <img src="fotos/resultados/adquirirMilhas.svg" class="adquirirMilhas">
            </div>

            <div id='quinto' style='display: none;'>
                <div class="despesas-wrapper">
                    <img src="fotos/resultados/despesas1.svg" class="despesas">
                    <img src="fotos/resultados/despesas2.svg" class="despesas">
                </div>
            </div>
            
        </div>
        <div class="footer">
            <?php include 'footer.php';?>
        </div>

        <script type='text/javascript'>
            function mostrarPrimeiro() {
                document.getElementById('primeiro').style.display = "block";
                document.getElementById('segundo').style.display = "none";
                document.getElementById('terceiro').style.display = "none";
                document.getElementById('quarto').style.display = "none";
                document.getElementById('quinto').style.display = "none";
            }
            function mostrarSegundo() {
                document.getElementById('primeiro').style.display = "none";
                document.getElementById('segundo').style.display = "block";
                document.getElementById('terceiro').style.display = "none";
                document.getElementById('quarto').style.display = "none";
                document.getElementById('quinto').style.display = "none";
            }
            function mostrarTerceiro() {
                document.getElementById('primeiro').style.display = "none";
                document.getElementById('segundo').style.display = "none";
                document.getElementById('terceiro').style.display = "block";
                document.getElementById('quarto').style.display = "none";
                document.getElementById('quinto').style.display = "none";
            }
            function mostrarQuarto() {
                document.getElementById('primeiro').style.display = "none";
                document.getElementById('segundo').style.display = "none";
                document.getElementById('terceiro').style.display = "none";
                document.getElementById('quarto').style.display = "block";
                document.getElementById('quinto').style.display = "none";
            }
            function mostrarQuinto() {
                document.getElementById('primeiro').style.display = "none";
                document.getElementById('segundo').style.display = "none";
                document.getElementById('terceiro').style.display = "none";
                document.getElementById('quarto').style.display = "none";
                document.getElementById('quinto').style.display = "block";
            }
        </script>

        <script type='text/javascript'>
            function mostrarGerencia1() {
                document.getElementById('opcoes-voos').style.display = "block";
                document.getElementById('opcoes-hoteis').style.display = "none";
                document.getElementById('minhas-reservas').style.display = "none";
            }
            function mostrarGerencia2() {
                document.getElementById('opcoes-voos').style.display = "none";
                document.getElementById('opcoes-hoteis').style.display = "block";
                document.getElementById('minhas-reservas').style.display = "none";
            }
            function mostrarGerencia3() {
                document.getElementById('opcoes-voos').style.display = "none";
                document.getElementById('opcoes-hoteis').style.display = "none";
                document.getElementById('minhas-reservas').style.display = "block";
            }
        </script>

    </body>
</html>