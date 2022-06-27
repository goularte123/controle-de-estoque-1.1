-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Jun-2022 às 16:33
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `controlestoque`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `NomeCliente` varchar(100) NOT NULL,
  `EmailCliente` varchar(100) NOT NULL,
  `cpfCliente` text NOT NULL,
  `statusCliente` int(1) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `dataRegCliente` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `NomeCliente`, `EmailCliente`, `cpfCliente`, `statusCliente`, `Usuario_idUsuario`, `dataRegCliente`) VALUES
(3, 'Antonio', 'teste2@teste.com', '12345678910', 1, 2, '2019-02-28 20:23:18'),
(5, 'Carlos', 'fabricio@gmail.com', '99999999999', 1, 1, '2019-03-01 19:42:30'),
(8, 'Wesley Silva', 'teste4@teste.com', '33344455567', 1, 2, '2019-03-25 21:00:06'),
(9, 'vini', 'iiiiii', '2132131', 1, 1, '2021-12-08 00:16:50'),
(13, 'mar', 'mareloaahgga', '0', 1, 2, '2021-12-11 16:48:34'),
(14, 'clovers', 'marcelo', '123', 1, 2, '2022-06-25 14:04:32'),
(15, 'derbi', '123', '1325448968', 1, 2, '2022-06-25 14:04:51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fabricante`
--

CREATE TABLE `fabricante` (
  `idFabricante` int(11) NOT NULL,
  `NomeFabricante` varchar(75) NOT NULL,
  `CNPJFabricante` varchar(75) NOT NULL,
  `EmailFabricante` varchar(75) NOT NULL,
  `EnderecoFabricante` varchar(75) NOT NULL,
  `TelefoneFabricante` varchar(75) NOT NULL,
  `Public` int(1) NOT NULL,
  `Ativo` int(1) NOT NULL,
  `Usuario_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fabricante`
--

INSERT INTO `fabricante` (`idFabricante`, `NomeFabricante`, `CNPJFabricante`, `EmailFabricante`, `EnderecoFabricante`, `TelefoneFabricante`, `Public`, `Ativo`, `Usuario_idUser`) VALUES
(1, 'Compaq', '212221211212211', 'ibm@ibm.com', 'Rua Central do Brasil - nÂº 200', '11 34343-4334', 1, 1, 1),
(2, 'Intel', '11111111111111', 'intel@intel.com', 'Rua 3', '121212212', 1, 1, 1),
(3, 'DELL', '2222222222222', 'dell@dell.com', 'Rua Central do Brasil - nÂº 203', '+5531988848700', 0, 0, 1),
(4, 'CaderbrÃ¡s Bico Internacional Ltda', '05.117571/002-05', 'nadir@distribuidoradistrioeste.com.br', 'Av Germano Dix - 4800 Pirassununga - SP', '(19)3561-3092', 1, 1, 1),
(6, 'Lenovo', '11111111111112', 'lenovo@lenovo.com', 'Rua 4', '333333333333', 1, 1, 1),
(7, 'Microsoft', '000099998989898', 'microsoft@microsoft.com', 'Rua 1', '44444444', 1, 1, 1),
(8, 'Microsoft 2', '000099998989898', 'microsoft@microsoft.com', 'Rua 1', '44444444', 1, 1, 1),
(9, 'Chevrolet', '009999999900000', 'teste@teste.com', 'Rua 1', '334544343', 1, 1, 1),
(10, 'Spal Industria Brasileira de Bebidas', '61186888000193', 'N/S', 'Avenida Francisco Ferreira Lopes - 4303', '08000212121', 1, 1, 1),
(11, 'Riot', '12323', 'dfasfdsdf', '1232321', '213124', 1, 1, 1),
(12, 'GABRIEL', '12323', 'dfasfdsdf', '1232321', '213124', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

CREATE TABLE `itens` (
  `idItens` int(11) NOT NULL,
  `Image` varchar(250) NOT NULL,
  `QuantItens` decimal(10,0) NOT NULL,
  `QuantItensVend` decimal(10,0) NOT NULL,
  `ValCompItens` decimal(10,2) NOT NULL,
  `ValVendItens` decimal(10,2) NOT NULL,
  `DataCompraItens` date NOT NULL,
  `DataVenci_Itens` date DEFAULT NULL,
  `ItensAtivo` tinyint(4) NOT NULL,
  `ItensPublic` int(1) NOT NULL,
  `Produto_CodRefProduto` int(11) NOT NULL,
  `Fabricante_idFabricante` int(11) NOT NULL,
  `Usuario_idUser` int(11) NOT NULL,
  `DataRegistro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `itens`
--

INSERT INTO `itens` (`idItens`, `Image`, `QuantItens`, `QuantItensVend`, `ValCompItens`, `ValVendItens`, `DataCompraItens`, `DataVenci_Itens`, `ItensAtivo`, `ItensPublic`, `Produto_CodRefProduto`, `Fabricante_idFabricante`, `Usuario_idUser`, `DataRegistro`) VALUES
(11, 'dist/img/kayn.jpg', '500', '380', '1700.00', '2100.00', '2018-10-27', '2018-10-31', 1, 1, 8, 1, 1, '2018-10-27 20:38:39'),
(12, '', '200', '173', '3.00', '9.00', '2018-10-27', '2018-10-31', 1, 1, 3, 1, 2, '2018-10-27 20:43:12'),
(13, '', '100', '37', '4.00', '9.50', '2019-09-17', '2019-09-17', 1, 1, 13, 2, 2, '2019-09-17 21:07:25'),
(16, '#', '123', '0', '1231.00', '12313123.00', '0000-00-00', '0000-00-00', 1, 1, 5, 6, 1, '2021-12-08 00:28:14'),
(17, '#', '10', '2', '213.00', '2132.00', '0000-00-00', '0000-00-00', 1, 1, 9, 1, 1, '2021-12-08 00:28:58'),
(18, '#', '11', '5', '5000.00', '1500.00', '0000-00-00', '0000-00-00', 1, 1, 5, 9, 1, '2021-12-10 02:18:11'),
(19, '#', '500', '0', '0.00', '12.00', '0000-00-00', '0000-00-00', 1, 1, 8, 1, 1, '2022-06-25 12:46:21'),
(20, '#', '500', '6', '200.00', '350.00', '2022-05-07', '2022-05-07', 1, 1, 12, 1, 1, '2022-06-25 12:55:36'),
(21, '#', '50', '0', '50.00', '100.00', '2022-05-07', '2022-05-07', 1, 1, 13, 2, 2, '2022-06-25 13:02:46'),
(22, '#', '41', '7', '31.00', '50.00', '0000-00-00', '0000-00-00', 1, 1, 14, 12, 2, '2022-06-25 13:27:57');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `CodRefProduto` int(11) NOT NULL,
  `NomeProduto` varchar(75) NOT NULL,
  `Ativo` int(1) NOT NULL,
  `PublicProduto` int(1) NOT NULL,
  `Usuario_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`CodRefProduto`, `NomeProduto`, `Ativo`, `PublicProduto`, `Usuario_idUser`) VALUES
(3, 'Caderno 500 folhas', 1, 1, 1),
(4, 'Notebook 2', 1, 0, 1),
(5, 'Computador Lenovo', 1, 1, 1),
(8, 'eee', 1, 1, 1),
(9, 'teste', 1, 1, 1),
(10, 'teclado razer ', 1, 1, 1),
(11, 'folha 12', 1, 1, 1),
(12, 'SEXO', 1, 1, 1),
(13, 'RED', 1, 1, 2),
(14, 'DANIEL', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `representante`
--

CREATE TABLE `representante` (
  `idRepresentante` int(11) NOT NULL,
  `NomeRepresentante` varchar(75) NOT NULL,
  `TelefoneRepresentante` varchar(20) NOT NULL,
  `EmailRepresentante` varchar(45) NOT NULL,
  `repAtivo` int(1) NOT NULL,
  `repPublic` int(1) NOT NULL,
  `Fabricante_idFabricante` int(11) NOT NULL,
  `Usuario_idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `representante`
--

INSERT INTO `representante` (`idRepresentante`, `NomeRepresentante`, `TelefoneRepresentante`, `EmailRepresentante`, `repAtivo`, `repPublic`, `Fabricante_idFabricante`, `Usuario_idUser`) VALUES
(1, 'Francisco Algusto', '11 9999-9999', 'franciscoalgusto@ibm.com', 1, 1, 1, 1),
(2, 'zedao ', '31 98888-8888', 'fabriciotp@ibm.com', 1, 1, 1, 1),
(3, 'Marcos Rafael', '43434343', 'marcosrafael@intel.com', 1, 1, 2, 1),
(4, 'Antonio Carlos ', '31988848780', 'antoniocarlos@dell.com', 1, 1, 3, 1),
(5, 'Distrioeste - Distribuidora e atacadista', '49 3331-3122', 'nadir@distribuidoradistrioeste.com.br', 1, 1, 4, 1),
(6, 'Thiago Rui', '55555555555', 'thiagorui@lenovo.com', 1, 1, 6, 1),
(7, 'Thiago', '33333444', 'thiago@microsoft.com', 1, 1, 7, 1),
(8, 'Thiago 2', '33333444', 'thiago2@microsoft.com', 1, 1, 8, 1),
(9, 'Thiago 22', '1000000', 'thiago@chevrolet.com', 1, 1, 9, 1),
(10, 'Spal Industria Brasileira de Bebidas', '08000212121', 'N/S', 1, 1, 10, 1),
(11, '', '', '', 1, 1, 11, 1),
(12, '', '', '', 1, 1, 12, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUser` int(11) NOT NULL,
  `Username` varchar(75) NOT NULL,
  `Email` varchar(75) NOT NULL,
  `Password` varchar(75) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `Dataregistro` date NOT NULL,
  `Permissao` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUser`, `Username`, `Email`, `Password`, `imagem`, `Dataregistro`, `Permissao`) VALUES
(1, 'marcelo', 'admin@estoque.com', '$2y$10$lUoYHFFIZuN2G8EO6LDtieR9Sc.Zqk6GN41AK2dblUvy5cJkDRJOm', 'dist/img/WhatsApp Image 2021-12-10 at 00.12.49.jpeg', '2017-04-03', 5),
(2, 'vendedor', 'vendedor@estoque.com', '$2y$10$lUoYHFFIZuN2G8EO6LDtieR9Sc.Zqk6GN41AK2dblUvy5cJkDRJOm', 'dist/img/WlfBnkM.jpg', '2017-04-03', 2),
(4, 'marcelogabriel', 'marcelo@estoque.com', '$2y$10$lUoYHFFIZuN2G8EO6LDtieR9Sc.Zqk6GN41AK2dblUvy5cJkDRJOm', 'dist/img/kayn-160x160.jpg', '2020-07-07', 4),
(5, 'teste', 'teste@example.com', '$2y$10$zv0xrnFfSv3K8uyH/rY41.HkNeAb4Vo2aVVGEVN63PmBp8CvFS8/.', 'dist/img/avatar.png', '2021-12-03', 2),
(6, 'dqwd', 'dwqd', '$2y$10$Y7140yn1pWemS1UYdQZqS.U69VRXHASJv9bXzwBFrcsbBewNChY3m', 'dist/img/avatar.png', '2022-06-25', 2),
(7, 'rola', 'dasd', '$2y$10$xOZ1uwK2Qsq.6JSYplFYNuSdRnEhjaJF6OUGrNNF2g4ywq.UeVxtS', './././dist/img/avatar.png', '2022-06-25', 2),
(8, 'daniel', 'marcelo133', '$2y$10$sT3fXKEyA.gBOTbDFpjie.84nZF3HIUqYPd4s5PwVORxTuTHbdKUG', 'dist/img/avatar.png', '2022-06-25', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `idvendas` int(11) NOT NULL,
  `quantitens` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `iditem` int(11) NOT NULL,
  `cart` varchar(255) NOT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `datareg` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`idvendas`, `quantitens`, `valor`, `iditem`, `cart`, `cliente_idCliente`, `idusuario`, `datareg`) VALUES
(1, 10, '11000.00', 12, '', 1, 2, '2019-02-21 21:27:12'),
(2, 15, '16500.00', 12, '', 1, 2, '2019-02-21 21:28:09'),
(3, 20, '220.00', 11, '', 2, 2, '2019-02-21 21:28:57'),
(4, 5, '5500.00', 12, '', 3, 2, '2019-02-28 20:23:18'),
(5, 2, '2200.00', 12, '', 3, 2, '2019-02-28 20:29:20'),
(6, 5, '5500.00', 12, '', 3, 2, '2019-02-28 20:32:09'),
(7, 2, '2200.00', 12, '', 3, 2, '2019-02-28 20:35:40'),
(8, 2, '2200.00', 12, '', 4, 2, '2019-03-01 19:33:37'),
(9, 2, '2200.00', 12, '', 5, 1, '2019-03-01 19:42:30'),
(10, 2, '2200.00', 12, '', 6, 1, '2019-03-01 19:46:54'),
(11, 2, '2200.00', 12, '', 5, 1, '2019-03-01 19:48:02'),
(12, 1, '1100.00', 12, '', 1, 2, '2019-03-13 21:50:14'),
(13, 1, '11.00', 11, '', 1, 2, '2019-03-13 21:50:15'),
(14, 50, '550.00', 11, '', 1, 2, '2019-03-13 21:51:44'),
(15, 5, '55.00', 11, '', 1, 2, '2019-03-13 21:54:41'),
(16, 50, '550.00', 11, '', 1, 2, '2019-03-20 20:40:05'),
(17, 20, '220.00', 11, '', 1, 2, '2019-03-20 21:00:24'),
(18, 20, '22000.00', 12, '', 1, 2, '2019-03-20 21:00:24'),
(19, 10, '11000.00', 12, '', 7, 2, '2019-03-20 21:45:01'),
(20, 11, '121.00', 11, '', 7, 2, '2019-03-20 21:45:01'),
(21, 80, '880.00', 11, '', 1, 2, '2019-03-20 22:09:38'),
(22, 2, '22.00', 11, '', 1, 2, '2019-03-20 22:10:51'),
(23, 2, '22.00', 11, '', 1, 2, '2019-03-20 22:13:00'),
(24, 2, '22.00', 11, '', 1, 2, '2019-03-20 22:13:34'),
(25, 11, '12100.00', 12, '', 1, 2, '2019-03-25 20:52:37'),
(26, 11, '12100.00', 12, '', 1, 2, '2019-03-25 20:59:45'),
(27, 20, '220.00', 11, '', 8, 2, '2019-03-25 21:00:06'),
(28, 11, '121.00', 11, '', 8, 2, '2019-03-25 21:00:50'),
(29, 3, '33.00', 11, '', 8, 2, '2019-03-25 21:03:28'),
(30, 23, '253.00', 11, '', 8, 2, '2019-03-25 21:05:26'),
(31, 11, '121.00', 11, '', 8, 2, '2019-03-25 21:08:45'),
(32, 1, '1100.00', 12, '', 1, 2, '2019-04-10 22:08:50'),
(33, 12, '132.00', 11, '', 1, 2, '2019-04-10 22:08:50'),
(34, 10, '1980.00', 12, '', 5, 2, '2019-04-10 22:14:18'),
(35, 15, '165.00', 11, '', 5, 2, '2019-04-10 22:14:18'),
(36, 2, '22.00', 11, '', 7, 2, '2019-09-14 00:16:09'),
(37, 3, '33.00', 11, '', 2, 2, '2019-09-14 00:18:05'),
(38, 3, '594.00', 12, '', 2, 2, '2019-09-14 00:18:06'),
(39, 2, '396.00', 12, '', 3, 2, '2019-09-14 00:23:23'),
(40, 3, '33.00', 11, '', 3, 2, '2019-09-14 00:23:23'),
(41, 3, '594.00', 12, '', 3, 2, '2019-09-14 00:51:06'),
(42, 2, '396.00', 12, '', 3, 2, '2019-09-16 21:46:25'),
(43, 2, '22.00', 11, '', 3, 2, '2019-09-16 21:46:25'),
(44, 5, '990.00', 12, '', 1, 2, '2019-09-16 21:47:21'),
(45, 10, '110.00', 11, '', 1, 2, '2019-09-16 21:47:21'),
(46, 2, '22.00', 11, '', 2, 2, '2019-09-16 21:48:01'),
(47, 2, '396.00', 12, '', 2, 2, '2019-09-17 20:47:52'),
(48, 2, '396.00', 12, '', 3, 2, '2019-09-17 21:31:36'),
(49, 10, '10.00', 15, '', 3, 2, '2019-09-17 21:31:36'),
(50, 1, '3900.00', 14, '', 3, 2, '2019-09-17 21:31:36'),
(51, 2, '396.00', 12, '', 2, 2, '2019-09-20 20:39:09'),
(52, 2, '5780.00', 13, '', 2, 2, '2019-09-20 20:39:11'),
(53, 3, '594.00', 12, '', 3, 2, '2019-09-20 20:48:09'),
(54, 1, '1.00', 15, '', 2, 2, '2019-09-20 21:00:32'),
(55, 1, '3900.00', 14, '', 7, 2, '2019-09-20 21:19:35'),
(56, 1, '198.00', 12, '', 1, 2, '2019-09-20 21:32:03'),
(57, 1, '2890.00', 13, '', 3, 2, '2019-09-20 21:33:47'),
(58, 1, '3900.00', 14, '', 3, 2, '2019-09-20 21:33:47'),
(59, 1, '11.00', 11, '', 1, 2, '2019-10-08 00:10:02'),
(60, 1, '2890.00', 13, '', 1, 2, '2019-10-08 00:10:02'),
(61, 1, '3900.00', 14, '', 1, 2, '2019-10-08 00:10:02'),
(62, 1, '11.00', 11, '', 1, 2, '2019-10-09 20:58:06'),
(63, 2, '396.00', 12, '', 1, 2, '2019-10-09 20:58:06'),
(64, 1, '2890.00', 13, '', 1, 2, '2019-10-10 20:15:38'),
(65, 1, '3900.00', 14, '', 1, 2, '2019-10-10 20:15:38'),
(66, 1, '198.00', 12, '', 1, 2, '2019-10-10 20:15:38'),
(67, 5, '45.00', 12, '', 2, 2, '2019-10-10 20:50:45'),
(68, 1, '9.50', 13, '', 2, 2, '2019-10-10 20:50:45'),
(69, 1, '3900.00', 14, '', 2, 2, '2019-10-10 20:50:45'),
(70, 1, '2100.00', 11, '', 8, 2, '2019-10-10 21:07:31'),
(71, 10, '95.00', 13, '', 8, 2, '2019-10-10 21:07:32'),
(72, 1, '9.50', 13, '', 2, 2, '2019-10-11 13:08:36'),
(73, 5, '45.00', 12, '', 2, 2, '2019-10-11 13:08:36'),
(74, 1, '3900.00', 14, '', 2, 2, '2019-10-11 13:08:36'),
(75, 1, '9.00', 12, '', 3, 2, '2019-10-11 21:07:49'),
(76, 1, '2100.00', 11, '', 5, 1, '2019-10-12 00:14:20'),
(77, 5, '45.00', 12, '', 4, 2, '2019-10-12 03:06:03'),
(78, 1, '2100.00', 11, '', 7, 1, '2019-10-12 03:20:28'),
(79, 15, '142.50', 13, '', 7, 1, '2019-10-12 03:20:28'),
(80, 2, '4200.00', 11, '', 2, 2, '2019-10-12 22:42:58'),
(81, 2, '18.00', 12, '', 2, 2, '2019-10-12 22:42:58'),
(82, 1, '9.00', 12, '', 6, 2, '2019-10-19 19:59:39'),
(83, 1, '2100.00', 11, '', 6, 2, '2019-10-19 19:59:39'),
(84, 2, '18.00', 12, '', 6, 2, '2019-10-19 20:05:03'),
(85, 1, '2100.00', 11, '', 6, 2, '2019-10-19 20:05:03'),
(86, 2, '18.00', 12, '', 2, 2, '2019-10-19 20:06:17'),
(87, 1, '2100.00', 11, '', 2, 2, '2019-10-19 20:06:18'),
(88, 1, '2100.00', 11, '7fd0446034d7d2364710337f8ae77176', 5, 1, '2019-10-22 21:11:58'),
(89, 4, '36.00', 12, '7fd0446034d7d2364710337f8ae77176', 5, 1, '2019-10-22 21:11:59'),
(90, 1, '3900.00', 14, '7fd0446034d7d2364710337f8ae77176', 5, 1, '2019-10-22 21:11:59'),
(91, 1, '2100.00', 11, '055e6b42f4acd384dc304d6b87eaec6e', 1, 1, '2019-11-14 20:38:25'),
(92, 1, '2100.00', 11, '3192a0746b3ae03c7a5e78acdb47f197', 5, 1, '2020-01-15 17:01:27'),
(93, 1, '2100.00', 11, '', 10, 2, '2021-12-10 02:20:34'),
(94, 1, '1500.00', 18, '', 11, 2, '2021-12-10 02:26:07'),
(95, 3, '4500.00', 18, '', 12, 2, '2021-12-10 03:09:36'),
(96, 1, '1500.00', 18, '', 13, 2, '2021-12-11 16:48:34'),
(97, 2, '4200.00', 11, '27f054ac8515a69383ba595ca0f53369', 3, 2, '2022-06-25 12:44:47'),
(98, 2, '4200.00', 11, '7291ab2d784092cf524562629c971784', 3, 1, '2022-06-25 12:45:19'),
(99, 2, '18.00', 12, 'e1b8aa5f84f365c5d22963c78ed37278', 3, 1, '2022-06-25 12:46:49'),
(100, 2, '18.00', 12, '85cd236bc9379044a05831408034f413', 3, 1, '2022-06-25 12:48:20'),
(101, 2, '4200.00', 11, 'a68611b3823bc57ee733d88847ea8f6f', 3, 1, '2022-06-25 13:00:16'),
(102, 2, '19.00', 13, '5ee2993c329f0f32d9e23c28d7ca7b63', 3, 2, '2022-06-25 13:03:04'),
(103, 3, '28.50', 13, '89c89aef7d4b4646e22f239db807f846', 3, 2, '2022-06-25 13:23:38'),
(104, 1, '50.00', 22, 'c9f2b279236d7e3c087d05b6bb4b34cb', 5, 2, '2022-06-25 13:29:31'),
(105, 2, '100.00', 22, '2f416368beb3fc026cae7b79d0b3bcf3', 3, 2, '2022-06-25 13:34:17'),
(106, 2, '100.00', 22, '2f416368beb3fc026cae7b79d0b3bcf3', 3, 2, '2022-06-25 13:34:43'),
(107, 2, '700.00', 20, '2f416368beb3fc026cae7b79d0b3bcf3', 13, 2, '2022-06-25 13:55:46'),
(108, 2, '4264.00', 17, '2f416368beb3fc026cae7b79d0b3bcf3', 13, 2, '2022-06-25 13:56:26'),
(109, 2, '700.00', 20, '2472187d0449b454d2d8384a8869a069', 9, 2, '2022-06-25 14:03:58'),
(110, 2, '100.00', 22, '2472187d0449b454d2d8384a8869a069', 9, 2, '2022-06-25 14:03:58'),
(111, 1, '9.00', 12, '4646a777e9b7896ff1e23f2e2f6d989f', 15, 2, '2022-06-25 14:05:09'),
(112, 2, '700.00', 20, 'ba8ef15f7f8813ca844a825d453fb82a', 14, 2, '2022-06-25 14:05:26'),
(113, 2, '18.00', 12, '4180576391cef377764b910d4d3400e2', 15, 8, '2022-06-25 14:10:03');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices para tabela `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`idFabricante`),
  ADD KEY `fk_Fabricante_Usuario1_idx` (`Usuario_idUser`);

--
-- Índices para tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`idItens`),
  ADD KEY `fk_Itens_Produto1_idx` (`Produto_CodRefProduto`),
  ADD KEY `fk_Itens_Fabricante1_idx` (`Fabricante_idFabricante`),
  ADD KEY `fk_Itens_Usuario1_idx` (`Usuario_idUser`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`CodRefProduto`),
  ADD KEY `fk_Produto_Usuario_idx` (`Usuario_idUser`);

--
-- Índices para tabela `representante`
--
ALTER TABLE `representante`
  ADD PRIMARY KEY (`idRepresentante`),
  ADD KEY `fk_Representante_Fabricante1_idx` (`Fabricante_idFabricante`),
  ADD KEY `fk_Representante_Usuario1_idx` (`Usuario_idUser`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUser`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`idvendas`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `fabricante`
--
ALTER TABLE `fabricante`
  MODIFY `idFabricante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `idItens` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `CodRefProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `representante`
--
ALTER TABLE `representante`
  MODIFY `idRepresentante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `idvendas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `fabricante`
--
ALTER TABLE `fabricante`
  ADD CONSTRAINT `fk_Fabricante_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `fk_Itens_Fabricante1` FOREIGN KEY (`Fabricante_idFabricante`) REFERENCES `fabricante` (`idFabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Itens_Produto1` FOREIGN KEY (`Produto_CodRefProduto`) REFERENCES `produtos` (`CodRefProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Itens_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_Produto_Usuario` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `representante`
--
ALTER TABLE `representante`
  ADD CONSTRAINT `fk_Representante_Fabricante1` FOREIGN KEY (`Fabricante_idFabricante`) REFERENCES `fabricante` (`idFabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Representante_Usuario1` FOREIGN KEY (`Usuario_idUser`) REFERENCES `usuario` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
