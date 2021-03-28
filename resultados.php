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
                <h1>primeiro</h1>
            </div>

            <div id='segundo' style='display: none;'>
                <h1>segundo</h1>
            </div>

            <div id='terceiro' style='display: none;'>
                <h1>terceiro</h1>
            </div>

            <div id='quarto' style='display: none;'>
                <h1>quarto</h1>
            </div>
        </div>

        <?php include 'footer.php';?>

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