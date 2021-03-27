
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `email` varchar(255) NOT NULL,
    `senha` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
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

DROP TABLE IF EXISTS `viagens`;
CREATE TABLE IF NOT EXISTS `viagens` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `preco` int(11) NOT NULL, 
    `data` date NOT NULL, 
    `orcamento_atual` int(11) NOT NULL, 
    `destinoId` int(11) NOT NULL, 
    `usuarioId` int(11) NOT NULL, 
    `valor_parcelas`int(11) NOT NULL, 
    `num_parcelas` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `destinoId` (`destinoId`),
    KEY `usuarioId` (`usuarioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `planejamentos`;
CREATE TABLE IF NOT EXISTS `planejamentos`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `voo` boolean NOT NULL, 
    `hotel`boolean NOT NULL,
    `num_parcelas` int(11) NOT NULL,
    `usuarioId` int(11) NOT NULL,
    `viagemId` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `usuarioId` (`usuarioId`),
    KEY `viagemId` (`viagemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `voos`;
CREATE TABLE IF NOT EXISTS `voos`(
    `id` int(11) NOT NULL AUTO_INCREMENT,    
    `duracao` time, 
    `data` date NOT NULL, 
    `destinoId` int(11) NOT NULL,
    `viagem` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `destinoId` (`destinoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hoteis`;
CREATE TABLE IF NOT EXISTS `hoteis`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `nome` varchar(255) NOT NULL, 
    `localId` int(11) NOT NULL, 

    PRIMARY KEY (`id`),
    KEY `localId` (`localId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `voosViagens`;
CREATE TABLE IF NOT EXISTS `voosViagens`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `vooId` int(11) NOT NULL,    
    `viagemId` int(11) NOT NULL,
    PRIMARY KEY (`id`), 
    KEY `vooId` (`vooId`),
    KEY `viagemId` (`viagemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hoteisViagens`;
CREATE TABLE IF NOT EXISTS `hoteisViagens`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `hotelId` int(11) NOT NULL,    
    `viagemId` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `hotelId`(`hotelId`),
    KEY `viagemId` (`viagemId`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `viagens`
  ADD CONSTRAINT `viagens_ibfk_1` FOREIGN KEY (`destinoId`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `viagens_ibfk_2` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `planejamentos`
  ADD CONSTRAINT `planejamento_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `planejamento_ibfk_2` FOREIGN KEY (`viagemId`) REFERENCES `viagens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE `voos`
  ADD CONSTRAINT `voos_ibfk_1` FOREIGN KEY (`destinoId`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `hoteis`
  ADD CONSTRAINT `hoteis_ibfk_1` FOREIGN KEY (`localId`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE hoteisviagens
    ADD CONSTRAINT fk_hoteis_id
    FOREIGN KEY (hotelId)
    REFERENCES hoteis(id);
    
ALTER TABLE hoteisviagens
    ADD CONSTRAINT fk_viagens_id
    FOREIGN KEY (viagemId)
    REFERENCES viagens(id);

ALTER TABLE voosviagens
    ADD CONSTRAINT fk_voos_id
    FOREIGN KEY (vooId)
    REFERENCES voos(id);
    
ALTER TABLE voosviagens
    ADD CONSTRAINT fk_viagens_id
    FOREIGN KEY (viagemId)
    REFERENCES viagens(id);
