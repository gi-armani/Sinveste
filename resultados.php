<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="resultados.css">
    </head>
    <body>
        <?php include 'header.php';?>
        <div class='container'>
            <img src='fotos/quadroDeMilhas.svg' class='quadroDeMilhas'/>
            <div>
                <button type='button' class='tabs-button' onclick="mostrarPrimeiro()" autofocus>Etapas</button>
                <button type='button' class='tabs-button' onclick="mostrarSegundo()">Gerenciar viagem</button>
                <button type='button' class='tabs-button' onclick="mostrarTerceiro()">Adquirir milhas</button>
                <button type='button' class='tabs-button' onclick="mostrarQuarto()">Painel de despesas pessoais</button>
            </div>

            <div id='primeiro' >
                <h1>segundo</h1>
            </div>

            <div id='segundo' style='display: none;'>
                <div class="wrapper-boxes">
                    <div class="box">
                    <p class="title">Voo</p> 
                        <div class="wrapper">
                               
                            <div class="esquerda">
                                <div>
                                    <p class="text"> GRU (São Paulo) > CDG (Paris) </p>
                                    <p class="text"> CDG (Paris) > GRU (São Paulo) </p>
                                </div>
                                <div>
                                    <p class="text"> 15 dias </p>
                                    <p class="text"> Janeiro/2022 </p>
                                </div>
                            </div>
                            <div class="direita">
                                <div>
                                    <p style='text-align:center;' class="bigger-text">TOTAL NECESSÁRIO </p>
                                    <p style='text-align:center;' class="bigger-text"><b>170.000</b> milhas</p>
                                </div>
                                <div>
                                    <p class="special-text"> Reserve agora e ganhe +500 bônus </p>
                                </div>
                                <div class="button-wrapper">
                                    <button type='button' class='tabs-button' onClick="">Reservar</button>
                                    <button type='button' class='tabs-button' onClick="">Diminuir</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                    <p class="title">Hoteis</p>
                        <div class="wrapper">
                        
                            <div class="esquerda">
                                <div>
                                    <p class="text"> Paris </p>
                                </div>
                                <div>
                                    <p class="text"> 15 dias </p>
                                    <p class="text"> Janeiro/2022 </p>
                                </div>
                            </div>
                            <div class="direita">
                                <div>
                                    <p style='text-align:center;' class="bigger-text">TOTAL NECESSÁRIO</p>
                                    <p style='text-align:center;' class="bigger-text"><b>1.000.000</b> MILHAS</p>
                                </div>
                                <div>
                                    <p class="special-text"> Continue juntando </p>
                                </div>
                                <div class="button-wrapper">
                                    <button type='button' class='tabs-button' onClick="">Reservar</button>
                                    <button type='button' class='tabs-button' onClick="">Diminuir</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>

            <div id='terceiro' style='display: none;'>
                <h1>terceiro</h1>
            </div>

            <div id='quarto' style='display: none;'>
                <h1>quarto</h1>
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
            }
            function mostrarSegundo() {
                document.getElementById('primeiro').style.display = "none";
                document.getElementById('segundo').style.display = "block";
                document.getElementById('terceiro').style.display = "none";
                document.getElementById('quarto').style.display = "none";
            }
            function mostrarTerceiro() {
                document.getElementById('primeiro').style.display = "none";
                document.getElementById('segundo').style.display = "none";
                document.getElementById('terceiro').style.display = "block";
                document.getElementById('quarto').style.display = "none";
            }
            function mostrarQuarto() {
                document.getElementById('primeiro').style.display = "none";
                document.getElementById('segundo').style.display = "none";
                document.getElementById('terceiro').style.display = "none";
                document.getElementById('quarto').style.display = "block";
            }
        </script>

    </body>
</html>