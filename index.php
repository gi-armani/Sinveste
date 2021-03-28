<!DOCTYPE html>
<html>
    <head>
       
        <meta charset="utf-8">
        <link rel="stylesheet" href="index.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Roboto', sans-serif;
            }
        </style>
    </head>

    <body class="body">
        <div>
            <?php include 'header.php'?>
        </div>
        <div class="container">
            <img class="img-main" src="fotos/fotoTuristas.svg">
            <div class="div-title">
                <p class="title"> Sinveste </p>
                <div class="line"></div>
            </div>
            <div class="line"></div>
            <div class="box">
                <p class="title2">O planejador de viagens que faltava para você<b> conquistar o mundo!</b> </p>
                <p class="text"> O Sinveste é<b> uma ferramenta de investimento e planejamento</b> 
                    que visa realizar sua viagem de mais econômico.</p>
                <p class="text"> Para isso, defina suas<b> metas e prazos</b> e ele te ajudará a cumpri-los por meio de
                    um painel de <b>gerenciamento personalizado.</b></p>
                <p class="text"> Investindo mensalmente, você pode desfrutar da <b>melhor viagem</b> da vida 
                    <b>sem endividamento</b>. E o melhor de tudo: ainda receberá milhas bônus por isso!</p>
                <p class="text">Você não vai querer deixar para planejar sua viagem no último momento, né?</p>
                <a href="inicio.php"> <button class="button">Saiba mais</button> </a>
            </div>
            <div class="wrapper">
                <img class="estatico" src="fotos/estático.svg">
                <a href="inicio.php"> <button class="planejar">Quero planejar a minha viagem</button> </a>
            </div>
        </div>
        <div class="footer">
            <?php include 'footer.php'?>
        </div>
    </body>
</html>