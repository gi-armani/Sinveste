-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Mar-2021 às 18:08
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `smoney`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `destinos`
--

CREATE TABLE `destinos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `praia` tinyint(1) NOT NULL,
  `frio` tinyint(1) NOT NULL,
  `familia` tinyint(1) NOT NULL,
  `historia` tinyint(1) NOT NULL,
  `natureza` tinyint(1) NOT NULL,
  `urbano` tinyint(1) NOT NULL,
  `compras` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `destinos`
--

INSERT INTO `destinos` (`id`, `nome`, `praia`, `frio`, `familia`, `historia`, `natureza`, `urbano`, `compras`) VALUES
(1, 'Paris', 0, 1, 1, 1, 0, 1, 1),
(3, 'Cairo', 0, 0, 0, 1, 1, 1, 0),
(4, 'Bangkok', 1, 0, 0, 1, 1, 0, 0),
(5, 'Salvador', 1, 0, 1, 1, 1, 0, 0),
(6, 'Rio de Janeiro', 1, 0, 1, 1, 1, 0, 0),
(7, 'Moscou', 0, 1, 0, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `hoteis`
--

CREATE TABLE `hoteis` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `localId` int(11) NOT NULL, 
  `valor`int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `hoteis`
--

INSERT INTO `hoteis` (`id`, `nome`, `localId`) VALUES
(1, 'Hôtel Paris Lafayette', 1),
(3, 'Ramses Hilton', 3),
(5, 'iSanook Bangkok', 4),
(7, 'Praia Sol Hotel', 5),
(9, 'Hotel Rio Lancaster', 6),
(11, 'Hotel Leningrado', 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `hoteisviagens`
--

CREATE TABLE `hoteisviagens` (
  `id` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `viagemId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `hoteisviagens`
--

INSERT INTO `hoteisviagens` (`id`, `hotelId`, `viagemId`) VALUES
(1, 9, 1),
(2, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `planejamentos`
--

CREATE TABLE `planejamentos` (
  `id` int(11) NOT NULL,
  `vooId` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `num_parcelas` int(11) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `viagemId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `planejamentos`
--

INSERT INTO `planejamentos` (`id`, `vooId`, `hotelId`, `num_parcelas`, `usuarioId`, `viagemId`) VALUES
(1, 1, 9, 0, 1, 1),
(2, 3, 3, 0, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `senha`) VALUES
(1, 'Giovana', 'giovana'),
(3, 'Duda', 'duda');

-- --------------------------------------------------------

--
-- Estrutura da tabela `viagens`
--

CREATE TABLE `viagens` (
  `id` int(11) NOT NULL,
  `preco` int(11) NOT NULL,
  `data` date NOT NULL,
  `orcamento_atual` int(11) NOT NULL,
  `partidaId` int(11) NOT NULL,
  `destinoId` int(11) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `valor_parcelas` int(11) NOT NULL,
  `num_parcelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `viagens`
--

INSERT INTO `viagens` (`id`, `preco`, `data`, `orcamento_atual`, `partidaId`, `destinoId`, `usuarioId`, `valor_parcelas`, `num_parcelas`) VALUES
(1, 15000, '2022-01-10', 5000, 5, 6, 1, 1000, 10),
(3, 500000, '2021-11-15', 100000, 6, 3, 3, 50000, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `voos`
--

CREATE TABLE `voos` (
  `id` int(11) NOT NULL,
  `duracao` time DEFAULT NULL,
  `data` date NOT NULL,
  `partidaId` int(11) NOT NULL,
  `destinoId` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `voos`
--

INSERT INTO `voos` (`id`, `duracao`, `data`, `partidaId`, `destinoId`) VALUES
(1, '02:10:00', '2022-01-10', 5, 6),
(3, '17:00:00', '2021-11-15', 6, 3),
(5, '29:00:00', '2022-03-08', 5, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `voosviagens`
--

CREATE TABLE `voosviagens` (
  `id` int(11) NOT NULL,
  `vooId` int(11) NOT NULL,
  `viagemId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `voosviagens`
--

INSERT INTO `voosviagens` (`id`, `vooId`, `viagemId`) VALUES
(1, 1, 1),
(2, 3, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `hoteis`
--
ALTER TABLE `hoteis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `localId` (`localId`);

--
-- Índices para tabela `hoteisviagens`
--
ALTER TABLE `hoteisviagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotelId` (`hotelId`),
  ADD KEY `viagemId` (`viagemId`);

--
-- Índices para tabela `planejamentos`
--
ALTER TABLE `planejamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vooId` (`vooId`),
  ADD KEY `hotelId` (`hotelId`),
  ADD KEY `usuarioId` (`usuarioId`),
  ADD KEY `viagemId` (`viagemId`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `viagens`
--
ALTER TABLE `viagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destinoId` (`destinoId`),
  ADD KEY `partidaId` (`partidaId`),
  ADD KEY `usuarioId` (`usuarioId`);

--
-- Índices para tabela `voos`
--
ALTER TABLE `voos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destinoId` (`destinoId`),
  ADD KEY `partidaId` (`partidaId`);

--
-- Índices para tabela `voosviagens`
--
ALTER TABLE `voosviagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vooId` (`vooId`),
  ADD KEY `viagemId` (`viagemId`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `hoteis`
--
ALTER TABLE `hoteis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `hoteisviagens`
--
ALTER TABLE `hoteisviagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `planejamentos`
--
ALTER TABLE `planejamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `viagens`
--
ALTER TABLE `viagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `voos`
--
ALTER TABLE `voos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `voosviagens`
--
ALTER TABLE `voosviagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `hoteis`
--
ALTER TABLE `hoteis`
  ADD CONSTRAINT `hoteis_ibfk_1` FOREIGN KEY (`localId`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `hoteisviagens`
--
ALTER TABLE `hoteisviagens`
  ADD CONSTRAINT `fk_hoteis_id` FOREIGN KEY (`hotelId`) REFERENCES `hoteis` (`id`),
  ADD CONSTRAINT `fk_viagens_id` FOREIGN KEY (`viagemId`) REFERENCES `viagens` (`id`);

--
-- Limitadores para a tabela `planejamentos`
--
ALTER TABLE `planejamentos`
  ADD CONSTRAINT `planejamento_ibfk_3` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `planejamento_ibfk_4` FOREIGN KEY (`viagemId`) REFERENCES `viagens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `planejamentos_ibfk_1` FOREIGN KEY (`vooId`) REFERENCES `voos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `planejamentos_ibfk_2` FOREIGN KEY (`hotelId`) REFERENCES `hoteis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `viagens`
--
ALTER TABLE `viagens`
  ADD CONSTRAINT `viagens_ibfk_1` FOREIGN KEY (`destinoId`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `viagens_ibfk_2` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `viagens_ibfk_3` FOREIGN KEY (`partidaId`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `voos`
--
ALTER TABLE `voos`
  ADD CONSTRAINT `voos_ibfk_1` FOREIGN KEY (`destinoId`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voos_ibfk_2` FOREIGN KEY (`partidaId`) REFERENCES `destinos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `voosviagens`
--
ALTER TABLE `voosviagens`
  ADD CONSTRAINT `fk_viagens_id2` FOREIGN KEY (`viagemId`) REFERENCES `viagens` (`id`),
  ADD CONSTRAINT `fk_voos_id` FOREIGN KEY (`vooId`) REFERENCES `voos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
