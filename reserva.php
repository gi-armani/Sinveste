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