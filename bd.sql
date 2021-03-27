
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `email` varchar(255) NOT NULL,
    `senha` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `viagens`;
CREATE TABLE IF NOT EXISTS `viagens` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `preco` int(11) NOT NULL, 
    `data` date NOT NULL, 
    `orcamento_atual` int(11) NOT NULL, 
    `destino` varchar(255) NOT NULL, 
    `usuario` int(11) NOT NULL, 
    `valor_parcelas`int(11) NOT NULL, 
    `num_parcelas` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `destino` (`destino`),
    KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `planejamentos`;
CREATE TABLE IF NOT EXISTS `planejamento`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `viagem` int(11) NOT NULL,
    `voo` boolean NOT NULL, 
    `hotel`boolean NOT NULL,
    `num_parcelas` int(11) NOT NULL,
    `usuario` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `usuario` (`usuario`),
    KEY `viagem` (`viagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `destinos`;
CREATE TABLE IF NOT EXISTS `destinos` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `nome` varchar(255) NOT NULL, 
    `praia` boolean NOT NULL, 
    `frio` boolean NOT NULL, 
    `familia` boolean NOT NULL, 
    `historia` boolean NOT NULL, 
    `natureza` boolean NOT NULL, 
    `urbano` boolean NOT NULL, 
    `compras` boolean NOT NULL, 
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `voos`;
CREATE TABLE IF NOT EXISTS `voos`(
    `id` int(11) NOT NULL AUTO_INCREMENT,    
    `duracao` time, 
    `data` date NOT NULL, 
    `destino` int(11) NOT NULL,
    `viagem` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `destino` (`destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hoteis`;
CREATE TABLE IF NOT EXISTS `hoteis`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `nome` varchar(255) NOT NULL, 
    `local` int(11) NOT NULL, 

    PRIMARY KEY (`id`),
    KEY `local` (`local`)
)
