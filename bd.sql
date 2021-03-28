
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
    `partidaId` int(11) NOT NULL,
    `destinoId` int(11) NOT NULL, 
    `usuarioId` int(11) NOT NULL, 
    `valor_parcelas`int(11) NOT NULL, 
    `num_parcelas` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `destinoId` (`destinoId`),
    KEY `partidaId` (`partidaId`),
    KEY `usuarioId` (`usuarioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `planejamentos`;
CREATE TABLE IF NOT EXISTS `planejamentos`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `vooId` int(11) NOT NULL, 
    `hotelId`int(11) NOT NULL,
    `num_parcelas` int(11) NOT NULL,
    `usuarioId` int(11) NOT NULL,
    `viagemId` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `vooId` (`vooId`),
    KEY `hotelId` (`hotelId`),
    KEY `usuarioId` (`usuarioId`),
    KEY `viagemId` (`viagemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `voos`;
CREATE TABLE IF NOT EXISTS `voos`(
    `id` int(11) NOT NULL AUTO_INCREMENT,    
    `duracao` time, 
    `data` date NOT NULL, 
    `partidaId` int(11) NOT NULL,
    `destinoId` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `destinoId` (`destinoId`),
    KEY `partidaId` (`partidaId`)
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
  ADD CONSTRAINT `viagens_ibfk_1` FOREIGN KEY (`destinoId`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `viagens`  
  ADD CONSTRAINT `viagens_ibfk_3` FOREIGN KEY (`partidaId`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `viagens`  
  ADD CONSTRAINT `viagens_ibfk_2` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE `planejamentos`  
  ADD CONSTRAINT `planejamentos_ibfk_1` FOREIGN KEY (`vooId`) REFERENCES `voos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `planejamentos`  
  ADD CONSTRAINT `planejamentos_ibfk_2` FOREIGN KEY (`hotelId`) REFERENCES `hoteis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `planejamentos`
  ADD CONSTRAINT `planejamento_ibfk_3` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `planejamentos`
  ADD CONSTRAINT `planejamento_ibfk_4` FOREIGN KEY (`viagemId`) REFERENCES `viagens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;




ALTER TABLE `voos`
  ADD CONSTRAINT `voos_ibfk_1` FOREIGN KEY (`destinoId`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `voos`
  ADD CONSTRAINT `voos_ibfk_2` FOREIGN KEY (`partidaId`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
    ADD CONSTRAINT fk_viagens_id2
    FOREIGN KEY (viagemId)
    REFERENCES viagens(id);

INSERT INTO `destinos` (`id`, `nome`, `praia`, `frio`, `familia`, `historia`, `natureza`, `urbano`, `compras`) VALUES
(1, 'Paris', 0, 1, 1, 1, 0, 1, 1),
(3, 'Cairo', 0, 0, 0, 1, 1, 1, 0),
(4, 'Bangkok', 1, 0, 0, 1, 1, 0, 0),
(5, 'Salvador', 1, 0, 1, 1, 1, 0, 0),
(6, 'Rio de Janeiro', 1, 0, 1, 1, 1, 0, 0),
(7, 'Moscou', 0, 1, 0, 1, 0, 1, 0);

INSERT INTO `hoteis` (`id`, `nome`, `localId`) VALUES
(1, 'Hôtel Paris Lafayette', 1),
(3, 'Ramses Hilton', 3),
(5, 'iSanook Bangkok', 4),
(7, 'Praia Sol Hotel', 5),
(9, 'Hotel Rio Lancaster', 6),
(11, 'Hotel Leningrado', 7);

INSERT INTO `hoteisviagens` (`id`, `hotelId`, `viagemId`) VALUES
(1, 9, 1),
(2, 3, 3);

INSERT INTO `usuarios` (`id`, `email`, `senha`) VALUES
(1, 'Giovana', 'giovana'),
(3, 'Duda', 'duda');

INSERT INTO `viagens` (`id`, `preco`, `data`, `orcamento_atual`, `partidaId`, `destinoId`, `usuarioId`, `valor_parcelas`, `num_parcelas`) VALUES
(1, 15000, '2022-01-10', 5000, 5, 6, 1, 1000, 10),
(3, 500000, '2021-11-15', 100000, 6, 3, 3, 50000, 8);

INSERT INTO `voos` (`id`, `duracao`, `data`, `partidaId`, `destinoId`) VALUES
(1, '02:10:00', '2022-01-10', 5, 6),
(3, '17:00:00', '2021-11-15', 6, 3),
(5, '29:00:00', '2022-03-08', 5, 4);

INSERT INTO `voosviagens` (`id`, `vooId`, `viagemId`) VALUES
(1, 1, 1);
