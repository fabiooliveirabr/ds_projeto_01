-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 22-Abr-2025 às 20:59
-- Versão do servidor: 5.7.11
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_colaboradores`
--
CREATE DATABASE IF NOT EXISTS `bd_colaboradores` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bd_colaboradores`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_colaboradores`
--

CREATE TABLE `tb_colaboradores` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `fk_funcao` int(11) NOT NULL,
  `situacao` enum('Ativo','Inativo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_colaboradores`
--

INSERT INTO `tb_colaboradores` (`matricula`, `nome`, `fk_funcao`, `situacao`) VALUES
(3000, 'José Francisco', 200, 'Ativo'),
(3001, 'Ana Paula', 201, 'Inativo'),
(3002, 'Carlos Eduardo', 202, 'Ativo'),
(3003, 'Mariana Oliveira', 200, 'Inativo'),
(3004, 'João Pedro', 201, 'Ativo'),
(3005, 'Fernanda Lima', 202, 'Inativo'),
(3006, 'Ricardo Andrade', 200, 'Ativo'),
(3007, 'Beatriz Souza', 201, 'Inativo'),
(3008, 'Paulo César', 202, 'Ativo'),
(3009, 'Julia Martins', 200, 'Inativo'),
(3010, 'Roberto Silva', 201, 'Ativo'),
(3011, 'Clara Almeida', 202, 'Inativo'),
(3012, 'Gustavo Pereira', 200, 'Ativo'),
(3013, 'Isabela Rocha', 201, 'Inativo'),
(3014, 'Lucas Fernandes', 202, 'Ativo'),
(3015, 'Amanda Ribeiro', 200, 'Inativo'),
(3016, 'Thiago Costa', 201, 'Ativo'),
(3017, 'Larissa Monteiro', 202, 'Inativo'),
(3018, 'Felipe Gomes', 200, 'Ativo'),
(3019, 'Patrícia Vieira', 201, 'Inativo'),
(3020, 'Daniel Alves', 202, 'Ativo'),
(3021, 'Camila Santos', 200, 'Inativo'),
(3022, 'Renato Dias', 201, 'Ativo'),
(3023, 'Gabriela Nunes', 202, 'Inativo'),
(3024, 'Marcelo Teixeira', 200, 'Ativo'),
(3025, 'Rafaela Carvalho', 201, 'Inativo'),
(3026, 'Leonardo Batista', 202, 'Ativo'),
(3027, 'Vanessa Cunha', 200, 'Inativo'),
(3028, 'Rafael Lopes', 201, 'Ativo'),
(3029, 'Débora Farias', 202, 'Inativo'),
(3030, 'TEste mateus', 200, 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcoes`
--

CREATE TABLE `tb_funcoes` (
  `cod_funcao` int(11) NOT NULL,
  `cargo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_funcoes`
--

INSERT INTO `tb_funcoes` (`cod_funcao`, `cargo`) VALUES
(200, 'Gerente'),
(201, 'Aux. de Serv. Gerais'),
(202, 'Estoquista');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_tudo`
--
CREATE TABLE `vw_tudo` (
`matricula` int(11)
,`nome` varchar(200)
,`fk_funcao` int(11)
,`situacao` enum('Ativo','Inativo')
,`cod_funcao` int(11)
,`cargo` varchar(200)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_tudo`
--
DROP TABLE IF EXISTS `vw_tudo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tudo`  AS  select `tb_colaboradores`.`matricula` AS `matricula`,`tb_colaboradores`.`nome` AS `nome`,`tb_colaboradores`.`fk_funcao` AS `fk_funcao`,`tb_colaboradores`.`situacao` AS `situacao`,`tb_funcoes`.`cod_funcao` AS `cod_funcao`,`tb_funcoes`.`cargo` AS `cargo` from (`tb_colaboradores` left join `tb_funcoes` on((`tb_colaboradores`.`fk_funcao` = `tb_funcoes`.`cod_funcao`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_colaboradores`
--
ALTER TABLE `tb_colaboradores`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `rel_colab_cargo` (`fk_funcao`);

--
-- Indexes for table `tb_funcoes`
--
ALTER TABLE `tb_funcoes`
  ADD PRIMARY KEY (`cod_funcao`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_colaboradores`
--
ALTER TABLE `tb_colaboradores`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3031;
--
-- AUTO_INCREMENT for table `tb_funcoes`
--
ALTER TABLE `tb_funcoes`
  MODIFY `cod_funcao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_colaboradores`
--
ALTER TABLE `tb_colaboradores`
  ADD CONSTRAINT `rel_colab_cargo` FOREIGN KEY (`fk_funcao`) REFERENCES `tb_funcoes` (`cod_funcao`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
