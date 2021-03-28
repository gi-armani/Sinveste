<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href='inicio.css'/>
        <link rel="preconnect" href="https://fonts.gstatic.com">
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
            <h1>Quero planejar minha viagem:</h1>
            <div>
                <button type='button' class='tabs-button' onclick="mostrarPrimeiro()">Já sei para onde quero ir</button>
                <a href='https://www.smiles.com.br/descubra-seu-novo-destino'><button type='button' class='tabs-button' onclick="mostrarSegundo()" >Ainda não sei o meu destino</button></a>
            </div>

            <div class='country-form' id='pesquisarDestino' style='display: none;'>
                <!-- <input type='text' placeholder="Pesquisar destino" name="destino"/> -->
                <select placeholder="Pesquisar destino" name="destino">
                    <option value="volvo">Cairo</option>
                    <option value="saab">Bankok</option>
                    <option value="mercedes">Salvador</option>
                    <option value="audi">Rio de Janeiro</option>
                    <option value="audi">Moscou</option>
                    <option value="audi">Paris</option>
                </select>
                <input type='date' placeholder="Quando gostaria de fazer sua viagem?" name="data"/>
                <input type='text' placeholder="Quantas milhas deseja utilizar?" name="orcamento"/>
                <br>
                <button type='button' class='search-button'>Continuar</button>
            </div>

            <div id='verCategorias' style='display: none;'>
                <a href="https://www.smiles.com.br/descubra-seu-novo-destino">
                    <img src='fotos/categoriasDeViagem.svg'/>
                </a>
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
                /* document.getElementById('verCategorias').style.display = "block"; */
            }
        </script>
    </body>

    
</html>