<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href='inicio.css'/>
    </head>
    <body>
        <?php include 'header.php';?>
        <div class='container'>
            <h1>Quero planejar minha viagem:</h1>
            <div>
                <button type='button' class='tabs-button' onclick="mostrarPrimeiro()">Já sei para onde quero ir</button>
                <button type='button' class='tabs-button' onclick="mostrarSegundo()">Ainda não sei o meu destino</button>
            </div>

            <div class='country-form' id='pesquisarDestino' style='display: none;'>
                <input type='text' placeholder="Pesquisar destino"/>
                <input type='date' placeholder="Quando gostaria de fazer sua viagem?"/>
                <input type='text' placeholder="Quantas milhas deseja utilizar?"/>
                <br>
                <button type='button' class='search-button'>Continuar</button>
            </div>

            <div id='verCategorias' style='display: none;'>
                <img src='fotos/categoriasDeViagem.svg'/>
            </div>
            <div class='footer'>
                <?php include 'footer.php';?>
            </div>
        </div>
        

        <script type='text/javascript'>
            function mostrarPrimeiro() {
                document.getElementById('pesquisarDestino').style.display = "block";
                document.getElementById('verCategorias').style.display = "none";
            }
            function mostrarSegundo() {
                document.getElementById('pesquisarDestino').style.display = "none";
                document.getElementById('verCategorias').style.display = "block";
            }
        </script>
    </body>

    
</html>