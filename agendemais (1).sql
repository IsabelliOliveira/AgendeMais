-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 07/06/2025 às 03:07
-- Versão do servidor: 8.3.0
-- Versão do PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `agendemais`
--
CREATE DATABASE IF NOT EXISTS `agendemais` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `agendemais`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_sala` int DEFAULT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `statusReserva` tinyint NOT NULL,
  PRIMARY KEY (`id_reserva`),
  UNIQUE KEY `data_inicio` (`data_inicio`),
  UNIQUE KEY `data_fim` (`data_fim`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_sala` (`id_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `id_usuario`, `id_sala`, `data_inicio`, `data_fim`, `statusReserva`) VALUES
(2, 3, 1, '2025-06-02 03:37:00', '2025-06-02 04:37:00', 0),
(43, 1, 2, '2025-06-05 09:00:00', '2025-06-05 14:00:00', 1),
(44, 3, 4, '2025-06-10 14:00:00', '2025-06-10 16:00:00', 3),
(45, 5, 5, '2025-06-15 18:00:00', '2025-06-15 20:00:00', 2),
(46, 7, 3, '2025-06-20 10:00:00', '2025-06-20 12:00:00', 1),
(47, 4, 6, '2025-06-25 15:00:00', '2025-06-25 17:00:00', 0),
(48, 6, 8, '2025-06-27 13:00:00', '2025-06-27 15:00:00', 2),
(49, 9, 9, '2025-06-30 16:00:00', '2025-06-30 18:00:00', 2);

--
-- Acionadores `reserva`
--
DROP TRIGGER IF EXISTS `trg_reserva_no_overlap`;
DELIMITER $$
CREATE TRIGGER `trg_reserva_no_overlap` BEFORE INSERT ON `reserva` FOR EACH ROW BEGIN
    IF EXISTS (
        SELECT 1 FROM reserva
        WHERE id_sala = NEW.id_sala
          AND (
               (NEW.data_inicio < data_fim AND NEW.data_fim > data_inicio)
          )
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: conflito de horário para essa sala.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sala`
--

DROP TABLE IF EXISTS `sala`;
CREATE TABLE IF NOT EXISTS `sala` (
  `id_sala` int NOT NULL AUTO_INCREMENT,
  `nome_sala` varchar(100) NOT NULL,
  `capacidade` int NOT NULL,
  `tipo_sala_id` int DEFAULT NULL,
  PRIMARY KEY (`id_sala`),
  KEY `tipo_sala_id` (`tipo_sala_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `sala`
--

INSERT INTO `sala` (`id_sala`, `nome_sala`, `capacidade`, `tipo_sala_id`) VALUES
(1, 'Sala de Jogos de tabuleiro', 15, 3),
(2, 'Sala Reunião Azul', 10, 1),
(3, 'Sala Reunião Verde', 8, 1),
(4, 'Sala de Leitura Infantil', 6, 2),
(5, 'Espaço de Leitura Coletiva', 12, 2),
(6, 'Sala de Jogos Retrô', 5, 3),
(7, 'Sala Gamer', 4, 3),
(8, 'Auditório Executivo', 30, 1),
(9, 'Biblioteca Clássica', 20, 2),
(10, 'Sala Arcade', 6, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tiposala`
--

DROP TABLE IF EXISTS `tiposala`;
CREATE TABLE IF NOT EXISTS `tiposala` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tiposala`
--

INSERT INTO `tiposala` (`id_tipo`, `descricao`) VALUES
(1, 'Sala corporativa'),
(2, 'Sala de Leitura'),
(3, 'Sala de Jogos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `senha`) VALUES
(1, 'Isabelli C', 'isabelli@agendemais.com', '1234'),
(3, 'Rian', 'rian@agendemais.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(4, 'Ana Clara', 'ana.clara@email.com', 'e7d80ffeefa212b7c5c55700e4f7193e'),
(5, 'Bruno Silva', 'bruno.silva@email.com', 'e10adc3949ba59abbe56e057f20f883e'),
(6, 'Carlos Eduardo', 'carlos.edu@email.com', '7c67e713a4b4139702de1a4fac672344'),
(7, 'Daniela Rocha', 'daniela.rocha@email.com', '8e2f600edbc7de8d273d6999390476fe'),
(8, 'Eduarda Lima', 'eduarda.lima@email.com', '78466116cae1a756d1a8c1b70d134ac5'),
(9, 'Felipe Torres', 'felipe.torres@email.com', 'c69091b7a370305ea0a53f5027ec5269'),
(10, 'Gabriela Souza', 'gabriela.souza@email.com', 'f16c21609a40039175679d04a97d24b6'),
(11, 'Henrique Melo', 'henrique.melo@email.com', '9227af4bcc6ad82fc0bac06026eacb61'),
(12, 'Isabela Martins', 'isabela.martins@email.com', '02372099ae48993462ca80ce628494c4'),
(13, 'João Pedro', 'joao.pedro@email.com', '868306c2bd955b8b0920f84f2d93cddb'),
(14, 'User Git', 'admin@git.com', '21232f297a57a5a743894a0e4a801fc3');

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`tipo_sala_id`) REFERENCES `tiposala` (`id_tipo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
