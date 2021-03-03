-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Mar-2021 às 14:27
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `octapay`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `afiliacao`
--

CREATE TABLE `afiliacao` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `afiliado` int(11) NOT NULL,
  `status` int(11) DEFAULT 1,
  `ativo` int(11) DEFAULT 1,
  `liberar_comprador` tinyint(1) DEFAULT 0,
  `tempo_cookie` int(11) DEFAULT NULL,
  `tipo_comissao` int(11) DEFAULT NULL,
  `comissao_afiliado` decimal(10,2) DEFAULT NULL,
  `tipo_atribuicao` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `afiliacao`
--

INSERT INTO `afiliacao` (`id`, `codigo`, `produto`, `afiliado`, `status`, `ativo`, `liberar_comprador`, `tempo_cookie`, `tipo_comissao`, `comissao_afiliado`, `tipo_atribuicao`, `created_at`, `updated_at`) VALUES
(1, 'FHD738', 3, 2, 2, 0, 1, 30, 1, '34.00', 1, '2020-08-04 02:09:57', '2020-08-04 22:22:42'),
(2, 'FUEI90', 2, 2, 1, 0, 1, 30, 0, '21.00', 2, '2020-08-04 05:45:14', '2020-11-03 15:30:05'),
(6, 'FNC243', 3, 3, 2, 0, 1, 30, 0, '20.00', 1, '2020-08-04 22:20:49', '2021-01-07 20:42:35'),
(9, '7268B1BE', 2, 4, 2, 1, 1, 30, 0, '21.00', 2, '2020-08-19 17:04:50', '2020-10-30 13:48:28'),
(12, 'B2144408', 4, 4, 4, 1, 0, 30, 0, '34.00', 2, '2020-11-16 18:24:30', '2020-11-16 18:53:28'),
(13, '65845E4C', 2, 18, 4, 1, 0, 30, 0, '21.00', 2, '2020-11-23 12:49:54', '2020-11-23 12:53:59'),
(14, '52AC5E63', 2, 5, 2, 1, 0, 30, 0, '21.00', 2, '2020-12-09 16:09:47', '2020-12-09 16:09:47'),
(19, '2A359393', 1, 5, 2, 1, 1, 30, 0, '34.00', 2, '2020-12-10 15:01:43', '2021-01-29 13:35:03'),
(20, 'F7C4DB9A', 3, 25, 2, 1, 0, 30, 0, '20.00', 1, '2020-12-28 22:03:36', '2021-01-07 20:42:47'),
(21, 'C137B9BB', 1, 25, 2, 1, 1, 30, 0, '34.00', 2, '2020-12-28 22:03:48', '2021-01-29 13:34:51'),
(22, '1E111695', 3, 12, 1, 1, 0, 30, 0, '20.00', 1, '2021-01-18 14:36:36', '2021-01-18 14:36:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `antecipacao`
--

CREATE TABLE `antecipacao` (
  `id` int(11) NOT NULL,
  `dias_antecipar` int(11) DEFAULT NULL COMMENT 'dias para começar a antecipar',
  `periodo_antecipacao` int(11) DEFAULT NULL COMMENT 'quantidade de dias para antecipar',
  `porcentagem` decimal(5,2) DEFAULT NULL,
  `taxa_antecipacao` decimal(5,2) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `usuario_ultima_alteracao` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `antecipacao`
--

INSERT INTO `antecipacao` (`id`, `dias_antecipar`, `periodo_antecipacao`, `porcentagem`, `taxa_antecipacao`, `usuario`, `usuario_ultima_alteracao`, `created_at`, `updated_at`) VALUES
(1, 7, 20, '50.00', '5.49', 1, 12, '2020-11-18 12:24:58', '2021-01-19 15:56:30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `api`
--

CREATE TABLE `api` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `token` int(11) DEFAULT NULL,
  `chave` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `banco`
--

CREATE TABLE `banco` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `titular` varchar(200) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `banco` varchar(4) DEFAULT NULL,
  `agencia` varchar(5) DEFAULT NULL,
  `conta` varchar(15) DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `chave_pix` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `banco`
--

INSERT INTO `banco` (`id`, `usuario`, `titular`, `cpf`, `banco`, `agencia`, `conta`, `tipo`, `chave_pix`, `status`, `created_at`, `updated_at`) VALUES
(1, 12, 'Pedro H Silva', '12719252654', '077', '0001', '14023783', 'corrente', '', 2, '2020-10-19 12:56:14', '2020-11-13 21:09:22'),
(9, 5, 'Pedro H', '06929943606', '077', '0001', '15023782', 'corrente', NULL, 2, '2020-10-19 19:14:37', '2020-11-13 21:09:35'),
(10, 12, 'Pedro H Silva', '12719252654', '237', '2934', '162515', 'corrente', NULL, 1, '2020-10-20 11:34:24', '2020-10-20 11:34:24');

-- --------------------------------------------------------

--
-- Estrutura da tabela `campanhas`
--

CREATE TABLE `campanhas` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `url_destino` varchar(200) DEFAULT NULL,
  `pixel` int(11) DEFAULT NULL,
  `analytics` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `campanhas`
--

INSERT INTO `campanhas` (`id`, `codigo`, `usuario`, `produto`, `nome`, `url_destino`, `pixel`, `analytics`, `created_at`, `updated_at`) VALUES
(12, '261960', 4, 2, 'Teste 1', '7268B1BE', 6, NULL, '2020-08-24 12:17:50', '2020-08-24 12:17:50'),
(13, '494922', 4, 2, 'Teste 2', '7268B1BE/ch=562D4773&tp=5', 6, NULL, '2020-08-24 12:18:26', '2020-08-24 12:18:26'),
(18, '963111', 4, 4, 'pv', 'HSG534?ch=0&tp=5', 6, NULL, '2020-08-24 13:55:28', '2020-08-24 13:55:28'),
(19, '949693', 3, 4, 'PV', '0?tp=4&ch=0', 1, NULL, '2020-08-24 13:58:38', '2020-08-24 13:58:38'),
(20, '296973', 4, 4, 'pv2', 'HSG534?ch=DFAD7221&tp=5', 6, NULL, '2020-08-24 14:02:18', '2020-08-24 14:02:18'),
(22, '711523', 3, 4, 'ch1', 'DFAD7221?tp=4&ch=DFAD7221', 1, NULL, '2020-08-24 14:04:58', '2020-08-24 14:04:58'),
(23, '286164', 4, 4, 'pv3', 'HSG534?ch=4AC57520&tp=5', 6, NULL, '2020-08-24 14:08:39', '2020-08-24 14:08:39'),
(24, '344526', 3, 4, 'teste John', 'DFAD7221?tp=4&ch=DFAD7221', 7, NULL, '2020-08-24 15:04:36', '2020-08-24 15:04:36'),
(25, '786001', 3, 4, 'Pedro Henrique da Silva', '0?tp=4&ch=0', 4, NULL, '2020-08-25 19:25:53', '2020-08-25 19:25:53'),
(26, '999171', 12, 3, 'Pedro Henrique da Silva', 'B3105BE3?tp=4&ch=B3105BE3', 9, NULL, '2020-08-27 14:36:40', '2020-11-11 19:04:43'),
(28, '482674', 12, 5, 'teste', '283DD590?tp=4&ch=283DD590', 9, NULL, '2020-11-10 13:35:43', '2020-12-28 12:48:40'),
(32, '822138', 25, 1, 'Teste Teste', 'C137B9BB?ch=426A0EF5&tp=5', 10, NULL, '2020-12-28 22:06:41', '2020-12-28 22:06:41'),
(35, '863811', 12, 1, 'PV', '0?ch=0&tp=4&pg=14', 9, NULL, '2021-01-07 20:33:41', '2021-01-07 20:34:59'),
(36, '661057', 12, 1, 'Link2', '0?ch=0&tp=4&pg=11', 9, NULL, '2021-01-07 20:34:02', '2021-01-07 20:34:02'),
(37, '946583', 12, 1, 'Checkout', '426A0EF5?tp=4&ch=426A0EF5', 9, 'UA-154130073-4,UA-154130073-2,UA-154130073-3', '2021-01-07 20:34:25', '2021-01-19 21:05:02'),
(38, '247535', 25, 3, 'Teste 2', 'F7C4DB9A?ch=81B2A2FF&tp=5', 10, NULL, '2021-01-07 20:44:13', '2021-01-07 20:44:13'),
(40, '581681', 12, 1, 'Teste Teste', '426A0EF5?tp=4&ch=426A0EF5', NULL, 'G-2GDV878DZF', '2021-01-18 14:40:38', '2021-01-28 18:24:19'),
(41, '429809', 5, 1, 'Checkout', '2A359393?ch=426A0EF5&tp=5', NULL, '', '2021-01-29 14:36:29', '2021-01-29 14:36:29'),
(43, '472787', 5, 1, 'Adv', '2A359393?ch=0&tp=5&pg=2', NULL, '', '2021-01-29 15:12:06', '2021-01-29 15:12:06');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho_abandonado`
--

CREATE TABLE `carrinho_abandonado` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf_cnpj` varchar(20) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `complemento` varchar(200) DEFAULT NULL,
  `bairro` varchar(200) DEFAULT NULL,
  `cidade` varchar(200) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `plano` int(11) DEFAULT NULL,
  `produtor` int(11) DEFAULT NULL,
  `afiliado` int(11) DEFAULT NULL,
  `campanha` int(11) DEFAULT NULL,
  `url_checkout` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `carrinho_abandonado`
--

INSERT INTO `carrinho_abandonado` (`id`, `nome`, `email`, `telefone`, `cpf_cnpj`, `cep`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `produto`, `plano`, `produtor`, `afiliado`, `campanha`, `url_checkout`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '', '', '', '', '', '', 'AC', 1, NULL, 12, NULL, NULL, 'localhost/octapay/checkout/426A0EF5', '2021-03-02 11:57:09', '2021-03-02 11:57:09', 1),
(2, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '', '', '', '', '', '', 'AC', NULL, NULL, NULL, NULL, NULL, 'localhost/octapay/checkout/426A0EF5', '2021-03-02 12:13:21', '2021-03-02 12:13:21', 1),
(3, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '', '', '', '', '', '', 'AC', NULL, NULL, NULL, NULL, NULL, 'localhost/octapay/checkout/426A0EF5', '2021-03-02 12:13:40', '2021-03-02 12:13:40', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `checkout`
--

CREATE TABLE `checkout` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `plano` int(11) DEFAULT NULL,
  `cupom` varchar(10) DEFAULT NULL,
  `valor_cupom` decimal(10,2) DEFAULT NULL,
  `so_cartao` tinyint(4) DEFAULT NULL,
  `banner` varchar(200) DEFAULT NULL,
  `aviso` varchar(200) DEFAULT NULL,
  `privado` tinyint(4) DEFAULT 0,
  `usar_contador` tinyint(4) DEFAULT NULL,
  `texto_contador` varchar(50) DEFAULT NULL,
  `acao_contador` tinyint(4) DEFAULT NULL COMMENT '0=não fazer nada\r\n1=aumentar preço',
  `aumento` decimal(5,2) DEFAULT NULL,
  `vencimento_boletos` tinyint(4) DEFAULT NULL,
  `usar_frete` tinyint(4) DEFAULT NULL,
  `valor_frete` decimal(5,2) DEFAULT NULL,
  `prazo_entrega` tinyint(4) DEFAULT NULL,
  `frete_gratis` tinyint(4) DEFAULT NULL,
  `prazo_entrega_gratis` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `checkout`
--

INSERT INTO `checkout` (`id`, `usuario`, `codigo`, `descricao`, `produto`, `plano`, `cupom`, `valor_cupom`, `so_cartao`, `banner`, `aviso`, `privado`, `usar_contador`, `texto_contador`, `acao_contador`, `aumento`, `vencimento_boletos`, `usar_frete`, `valor_frete`, `prazo_entrega`, `frete_gratis`, `prazo_entrega_gratis`, `created_at`, `updated_at`) VALUES
(1, 12, '1B1EBE09', 'Checkout 1', NULL, 1, NULL, NULL, NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-05 17:04:54', '2020-08-05 17:04:54'),
(2, 12, '6558B5C2', 'Checkout 1', NULL, 1, NULL, NULL, NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-05 17:06:02', '2020-08-05 17:06:02'),
(3, 12, 'C0C55C7E', 'Checkout 1', NULL, 1, NULL, NULL, NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-05 17:06:53', '2020-08-05 17:06:53'),
(5, 12, 'B3105BE3', 'Checkout 1 teste', 3, NULL, NULL, NULL, NULL, 'fba47e338cc1723cb22f42dbd76d51b6.png', 'fba47e338cc1723cb22f42dbd76d51b6.png', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-05 18:14:32', '2020-08-05 21:08:20'),
(6, 12, '81B2A2FF', 'Checkout 2', 3, NULL, NULL, NULL, NULL, '6aa8e2decddc6f2ae918468be0db3fce.png', '32d2acb18622a98e93a264597c40bac2.png', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-05 20:17:50', '2020-08-05 20:17:50'),
(8, 12, 'DFAD7221', 'Checkout 1', 4, NULL, '123a', '20.00', 0, '', '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-07 11:40:44', '2020-11-24 21:31:43'),
(9, 3, '4AC57520', 'Checkout 2 teste', 4, 3, NULL, NULL, NULL, '8278cb508cd1d75772f13d0c0b3e9063.jpg', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-18 20:04:50', '2020-08-18 20:25:23'),
(10, 3, '562D4773', 'Plano 1', 2, NULL, NULL, NULL, NULL, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-19 14:01:02', '2020-08-19 14:01:02'),
(11, 12, '283DD590', 'Plano 1 Blend', 5, 8, '6t5r4', '19.70', 0, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-10 15:05:24', '2020-11-11 15:46:54'),
(12, 12, 'C755A006', 'Plano 1 Blend Cupom', 5, 8, 'se3', '19.70', 1, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-10 19:21:00', '2020-11-11 14:40:01'),
(13, 12, '560C918F', 'Plano 1 Blend', 7, NULL, '', '0.00', 0, '10865c673df7d83978555b53870aa60f.png', '6d221bcdeadda1acd5dffb8909bd6aec.jpeg', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-13 18:47:23', '2020-11-13 18:47:23'),
(14, 12, 'E4A71202', 'Plano 1 Blend Cupom', 7, NULL, '12w3e', '12.90', 0, '6bd77a643f579539c250c14238437890.png', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-13 18:50:02', '2020-11-13 18:50:02'),
(15, 12, 'B4AC8FD5', 'Octagen 2', 4, 3, '', '0.00', 0, '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-15 14:33:27', '2020-12-15 14:33:27'),
(16, 12, '426A0EF5', 'Octagen', 1, NULL, '', '0.00', 0, '', '', 0, 1, 'OFERTA POR TEMPO LIMITADO', 0, '0.00', 1, 1, '30.00', 15, 1, 30, '2020-12-23 20:45:22', '2021-02-02 13:19:46'),
(17, 12, 'C0CE93AD', 'Plano Blend 2', 5, 13, '', '0.00', 0, '', '', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-13 20:46:29', '2021-01-13 20:46:29'),
(18, 12, '4CEFE0AB', 'Checkout 2', 1, 10, '', '0.00', 0, '', '', 0, 0, NULL, NULL, NULL, 1, 1, '30.00', 15, 0, 0, '2021-02-02 19:08:34', '2021-02-02 19:08:34'),
(19, 12, 'D564E79B', 'Octagen 2', 1, 10, '', '0.00', 0, '', '', 0, 0, '', 0, '0.00', NULL, 1, '30.00', 15, 0, 0, '2021-02-03 15:51:55', '2021-02-03 16:09:54');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comissao`
--

CREATE TABLE `comissao` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `venda` int(11) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `antecipado` tinyint(4) DEFAULT 0,
  `saldo` decimal(10,2) DEFAULT NULL,
  `taxa` decimal(10,2) DEFAULT 0.00,
  `tempo_saque` date DEFAULT NULL,
  `disponivel` tinyint(4) DEFAULT NULL,
  `tipo` int(11) DEFAULT 1,
  `conta` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `codigo` varchar(30) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `data_pedido` date DEFAULT NULL,
  `usuario_ultima_alteracao` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `comissao`
--

INSERT INTO `comissao` (`id`, `usuario`, `venda`, `produto`, `descricao`, `valor`, `antecipado`, `saldo`, `taxa`, `tempo_saque`, `disponivel`, `tipo`, `conta`, `status`, `codigo`, `observacao`, `data_pedido`, `usuario_ultima_alteracao`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, 'Taxa OctaPay', '11.14', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-11-23', NULL, '2021-02-04 18:14:20', '2021-02-04 18:15:08'),
(2, 12, 1, 4, 'Comissão Produtor', '135.86', 0, NULL, '0.00', '2020-11-30', 2, 1, NULL, 1, NULL, NULL, '2020-11-23', NULL, '2021-02-04 18:14:20', '2021-02-04 18:15:08'),
(3, 1, 4, 4, 'Taxa OctaPay', '11.14', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:20', '2021-02-04 18:15:08'),
(4, 1, 4, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:20', '2021-02-04 18:15:08'),
(5, 12, 4, 4, 'Comissão Produtor', '135.86', 0, NULL, '0.00', '2020-08-17', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:20', '2021-02-04 18:15:08'),
(6, 1, 5, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:20', '2021-02-04 18:15:08'),
(7, 1, 5, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:20', '2021-02-04 18:15:08'),
(8, 12, 5, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-17', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:20', '2021-02-04 18:15:08'),
(9, 1, 6, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:20', '2021-02-04 18:15:08'),
(10, 1, 6, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(11, 12, 6, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-17', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(12, 1, 7, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(13, 1, 7, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(14, 12, 7, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-17', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(15, 1, 8, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(16, 1, 8, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(17, 12, 8, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-17', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(18, 1, 12, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(19, 1, 12, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(20, 12, 12, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-17', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(21, 1, 13, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(22, 1, 13, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(23, 12, 13, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-17', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(24, 1, 14, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(25, 1, 14, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(26, 12, 14, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-17', 2, 1, NULL, 1, NULL, NULL, '2020-08-07', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(27, 1, 28, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-12', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(28, 1, 28, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-12', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(29, 12, 28, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-22', 2, 1, NULL, 1, NULL, NULL, '2020-08-12', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(30, 1, 30, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(31, 1, 30, 4, 'Juros Cartão', '25.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(32, 12, 30, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-21', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(33, 1, 31, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(34, 1, 31, 4, 'Juros Cartão', '25.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(35, 12, 31, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-21', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(36, 1, 33, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(37, 1, 33, 4, 'Juros Cartão', '25.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(38, 12, 33, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-21', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(39, 1, 34, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(40, 1, 34, 4, 'Juros Cartão', '25.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(41, 12, 34, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-21', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(42, 1, 40, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(43, 1, 40, 4, 'Juros Cartão', '25.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(44, 12, 40, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-21', 2, 1, NULL, 1, NULL, NULL, '2020-08-14', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(45, 1, 45, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(46, 1, 45, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(47, 12, 45, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-24', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(48, 1, 47, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(49, 1, 47, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(50, 12, 47, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-24', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(51, 1, 49, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(52, 1, 49, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(53, 12, 49, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-24', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(54, 1, 51, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(55, 1, 51, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(56, 12, 51, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-24', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(57, 1, 52, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(58, 1, 52, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(59, 12, 52, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-24', 2, 1, NULL, 1, NULL, NULL, '2020-08-17', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(60, 1, 80, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(61, 1, 80, 4, 'Juros Cartão', '25.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(62, 12, 80, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-25', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(63, 1, 83, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(64, 1, 83, 4, 'Juros Cartão', '25.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(65, 12, 83, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-25', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(66, 1, 85, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(67, 1, 85, 4, 'Juros Cartão', '25.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(68, 12, 85, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-25', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(69, 1, 86, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(70, 1, 86, 4, 'Juros Cartão', '25.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(71, 12, 86, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-25', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(72, 1, 87, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(73, 1, 87, 4, 'Juros Cartão', '25.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(74, 12, 87, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-25', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(75, 1, 88, 4, 'Taxa OctaPay', '11.14', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-31', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(76, 12, 88, 4, 'Comissão Produtor', '135.86', 0, NULL, '0.00', '2020-09-07', 2, 1, NULL, 1, NULL, NULL, '2020-08-31', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(77, 1, 89, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(78, 1, 89, 4, 'Juros Cartão', '25.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(79, 12, 89, 4, 'Comissão Produtor', '147.00', 0, NULL, '0.00', '2020-08-25', 2, 1, NULL, 1, NULL, NULL, '2020-08-18', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(80, 1, 93, 2, 'Taxa OctaPay', '18.38', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(81, 4, 93, 2, 'Comissão afiliado', '51.45', 0, NULL, '0.00', '2020-09-03', 2, 1, NULL, 1, NULL, NULL, '2020-08-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(82, 3, 93, 2, 'Comissão Produtor', '193.55', 0, NULL, '0.00', '2020-08-26', 2, 1, NULL, 1, NULL, NULL, '2020-08-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(83, 1, 94, 2, 'Taxa OctaPay', '18.38', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(84, 4, 94, 2, 'Comissão afiliado', '51.45', 0, NULL, '0.00', '2020-09-03', 2, 1, NULL, 1, NULL, NULL, '2020-08-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(85, 3, 94, 2, 'Comissão Produtor', '193.55', 0, NULL, '0.00', '2020-08-26', 2, 1, NULL, 1, NULL, NULL, '2020-08-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(86, 1, 95, 2, 'Taxa OctaPay', '18.38', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(87, 4, 95, 2, 'Comissão afiliado', '51.45', 0, NULL, '0.00', '2020-09-03', 2, 1, NULL, 1, NULL, NULL, '2020-08-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(88, 3, 95, 2, 'Comissão Produtor', '193.55', 0, NULL, '0.00', '2020-08-26', 2, 1, NULL, 1, NULL, NULL, '2020-08-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(89, 1, 98, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-21', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(90, 1, 98, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-21', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(91, 4, 98, 4, 'Comissão afiliado', '34.00', 0, NULL, '0.00', '2020-09-05', 2, 1, NULL, 1, NULL, NULL, '2020-08-21', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(92, 12, 98, 4, 'Comissão Produtor', '113.00', 0, NULL, '0.00', '2020-08-28', 2, 1, NULL, 1, NULL, NULL, '2020-08-21', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(93, 1, 103, 4, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(94, 1, 103, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(95, 4, 103, 4, 'Comissão afiliado', '34.00', 0, NULL, '0.00', '2020-09-09', 2, 1, NULL, 1, NULL, NULL, '2020-08-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(96, 12, 103, 4, 'Comissão Produtor', '113.00', 0, NULL, '0.00', '2020-09-01', 2, 1, NULL, 1, NULL, NULL, '2020-08-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(97, 1, 109, 4, 'Taxa OctaPay', '11.14', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-26', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(98, 12, 109, 4, 'Comissão Produtor', '135.86', 0, NULL, '0.00', '2020-09-02', 2, 1, NULL, 1, NULL, NULL, '2020-08-26', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(99, 1, 110, 4, 'Taxa OctaPay', '11.14', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-26', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(100, 1, 110, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-26', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(101, 12, 110, 4, 'Comissão afiliado', '43.31', 0, NULL, '0.00', '2020-09-05', 2, 1, NULL, 1, NULL, NULL, '2020-08-26', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(102, 12, 110, 4, 'Comissão Produtor', '92.55', 0, NULL, '0.00', '2020-09-02', 2, 1, NULL, 1, NULL, NULL, '2020-08-26', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(103, 1, 111, 4, 'Taxa OctaPay', '11.14', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-08-26', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(104, 12, 111, 4, 'Comissão Produtor', '135.86', 0, NULL, '0.00', '2020-09-02', 2, 1, NULL, 1, NULL, NULL, '2020-08-26', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(105, 1, 112, 2, 'Taxa OctaPay', '0.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-10-15', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(106, 1, 112, 2, 'Juros Cartão', '50.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-10-15', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(107, 4, 112, 2, 'Comissão afiliado', '43.31', 0, NULL, '0.00', '2020-10-30', 2, 1, NULL, 1, NULL, NULL, '2020-10-15', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(108, 3, 112, 2, 'Comissão Produtor', '201.69', 0, NULL, '0.00', '2020-10-22', 2, 1, NULL, 1, NULL, NULL, '2020-10-15', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(109, 1, 113, 2, 'Taxa OctaPay', '17.91', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-10-15', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(110, 1, 113, 2, 'Juros Cartão', '50.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-10-15', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(111, 4, 113, 2, 'Comissão afiliado', '43.31', 0, NULL, '0.00', '2020-10-30', 2, 1, NULL, 1, NULL, NULL, '2020-10-15', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(112, 3, 113, 2, 'Comissão Produtor', '184.59', 0, NULL, '0.00', '2020-10-22', 2, 1, NULL, 1, NULL, NULL, '2020-10-15', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(113, 1, 114, 4, 'Taxa OctaPay', '11.14', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-10-16', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(114, 5, 114, 4, 'Comissão coprodução', '40.00', 0, NULL, '0.00', '2020-11-05', 2, 1, NULL, 1, NULL, NULL, '2020-10-16', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(115, 12, 114, 4, 'Comissão Produtor', '95.86', 0, NULL, '0.00', '2020-10-23', 2, 1, NULL, 1, NULL, NULL, '2020-10-16', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(116, 1, 125, 2, 'Taxa OctaPay', '17.91', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-10-16', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(117, 4, 125, 2, 'Comissão afiliado', '51.45', 0, NULL, '0.00', '2020-10-31', 2, 1, NULL, 1, NULL, NULL, '2020-10-16', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(118, 3, 125, 2, 'Comissão Produtor', '175.64', 0, NULL, '0.00', '2020-10-23', 2, 1, NULL, 1, NULL, NULL, '2020-10-16', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(119, 1, 131, 4, 'Taxa OctaPay', '11.28', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(120, 5, 131, 4, 'Comissão coprodução', '40.00', 0, NULL, '0.00', '2020-12-01', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(121, 12, 131, 4, 'Comissão Produtor', '75.72', 0, NULL, '0.00', '2020-11-21', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(122, 1, 132, 4, 'Taxa OctaPay', '11.28', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(123, 1, 132, 4, 'Juros Cartão', '30.12', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(124, 5, 132, 4, 'Comissão coprodução', '40.00', 0, NULL, '0.00', '2020-12-01', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(125, 12, 132, 4, 'Comissão Produtor', '75.72', 0, NULL, '0.00', '2020-11-21', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(126, 1, 133, 5, 'Taxa OctaPay', '14.77', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(127, 1, 133, 5, 'Juros Cartão', '40.36', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(128, 12, 133, 5, 'Comissão Produtor', '162.53', 0, NULL, '0.00', '2020-11-21', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(129, 1, 135, 5, 'Taxa OctaPay', '14.77', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(130, 1, 135, 5, 'Juros Cartão', '20.66', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(131, 12, 135, 5, 'Comissão Produtor', '162.53', 0, NULL, '0.00', '2020-11-21', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(132, 1, 140, 5, 'Taxa OctaPay', '14.77', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(133, 1, 140, 5, 'Juros Cartão', '14.10', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(134, 12, 140, 5, 'Comissão Produtor', '162.53', 0, NULL, '0.00', '2020-11-21', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(135, 1, 141, 5, 'Taxa OctaPay', '14.77', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(136, 1, 141, 5, 'Juros Cartão', '14.10', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(137, 12, 141, 5, 'Comissão Produtor', '162.53', 0, NULL, '0.00', '2020-11-21', 2, 1, NULL, 1, NULL, NULL, '2020-11-11', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(138, 1, 148, 4, 'Taxa OctaPay', '17.91', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(139, 5, 148, 4, 'Comissão coprodução', '40.00', 0, NULL, '0.00', '2020-12-22', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(140, 12, 148, 4, 'Comissão Produtor', '167.09', 0, NULL, '0.00', '2020-12-12', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(141, 1, 149, 4, 'Taxa OctaPay', '17.91', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(142, 5, 149, 4, 'Comissão coprodução', '40.00', 0, NULL, '0.00', '2020-12-22', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(143, 12, 149, 4, 'Comissão Produtor', '167.09', 0, NULL, '0.00', '2020-12-12', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(144, 1, 150, 4, 'Taxa OctaPay', '17.91', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(145, 5, 150, 4, 'Comissão coprodução', '40.00', 0, NULL, '0.00', '2020-12-22', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(146, 12, 150, 4, 'Comissão Produtor', '167.09', 0, NULL, '0.00', '2020-12-12', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(147, 1, 151, 4, 'Taxa OctaPay', '17.91', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(148, 5, 151, 4, 'Comissão coprodução', '40.00', 0, NULL, '0.00', '2020-12-22', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(149, 12, 151, 4, 'Comissão Produtor', '167.09', 0, NULL, '0.00', '2020-12-12', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(150, 1, 152, 4, 'Taxa OctaPay', '17.91', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(151, 5, 152, 4, 'Comissão coprodução', '40.00', 0, NULL, '0.00', '2020-12-22', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(152, 12, 152, 4, 'Comissão Produtor', '167.09', 0, NULL, '0.00', '2020-12-12', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(153, 1, 153, 4, 'Taxa OctaPay', '17.91', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(154, 5, 153, 4, 'Comissão coprodução', '40.00', 0, NULL, '0.00', '2020-12-22', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(155, 12, 153, 4, 'Comissão Produtor', '167.09', 0, NULL, '0.00', '2020-12-12', 2, 1, NULL, 1, NULL, NULL, '2020-12-02', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(156, 1, 209, 4, 'Taxa OctaPay', '17.91', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-12-03', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(157, 1, 209, 4, 'Juros Cartão', '30.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2020-12-03', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(158, 5, 209, 4, 'Comissão coprodução', '40.00', 0, NULL, '0.00', '2020-12-23', 2, 1, NULL, 1, NULL, NULL, '2020-12-03', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(159, 12, 209, 4, 'Comissão Produtor', '167.09', 0, NULL, '0.00', '2020-12-13', 2, 1, NULL, 1, NULL, NULL, '2020-12-03', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(160, 1, 236, 3, 'Taxa OctaPay', '17.15', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-04', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(161, 1, 236, 3, 'Juros Cartão', '47.88', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-04', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(162, 3, 236, 3, 'Comissão Produtor', '216.85', 0, NULL, '0.00', '2021-01-11', 2, 1, NULL, 1, NULL, NULL, '2021-01-04', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(163, 1, 237, 3, 'Taxa OctaPay', '17.15', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-04', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(164, 1, 237, 3, 'Juros Cartão', '47.88', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-04', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(165, 3, 237, 3, 'Comissão Produtor', '216.85', 0, NULL, '0.00', '2021-01-11', 2, 1, NULL, 1, NULL, NULL, '2021-01-04', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(166, 1, 238, 1, 'Taxa OctaPay', '24.81', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-05', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(167, 3, 238, 1, 'Comissão coprodução', '32.02', 0, NULL, '0.00', '2021-01-12', 2, 1, NULL, 1, NULL, NULL, '2021-01-05', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(168, 12, 238, 1, 'Comissão coprodução', '32.02', 0, NULL, '0.00', '2021-01-15', 2, 1, NULL, 1, NULL, NULL, '2021-01-05', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(169, 12, 238, 1, 'Comissão Produtor', '256.15', 0, NULL, '0.00', '2021-01-15', 2, 1, NULL, 1, NULL, NULL, '2021-01-05', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(170, 1, 255, 5, 'Taxa OctaPay', '21.49', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-13', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(171, 1, 255, 5, 'Juros Cartão', '60.84', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-13', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(172, 12, 255, 5, 'Comissão Produtor', '275.51', 0, NULL, '0.00', '2021-01-23', 2, 1, NULL, 1, NULL, NULL, '2021-01-13', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(173, 1, 256, 5, 'Taxa OctaPay', '21.49', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-13', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(174, 1, 256, 5, 'Juros Cartão', '60.84', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-13', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(175, 12, 256, 5, 'Comissão Produtor', '275.51', 0, NULL, '0.00', '2021-01-23', 2, 1, NULL, 1, NULL, NULL, '2021-01-13', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(176, 1, 264, 1, 'Taxa OctaPay', '25.67', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(177, 1, 264, 1, 'Juros Cartão', '59.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(178, 3, 264, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-26', 2, 1, NULL, 1, NULL, NULL, '2021-01-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(179, 12, 264, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-29', 2, 1, NULL, 1, NULL, NULL, '2021-01-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(180, 12, 264, 1, 'Comissão Produtor', '283.07', 0, NULL, '0.00', '2021-01-29', 2, 1, NULL, 1, NULL, NULL, '2021-01-19', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(181, 1, 282, 1, 'Taxa OctaPay', '25.67', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(182, 1, 282, 1, 'Juros Cartão', '48.04', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(183, 3, 282, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-27', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(184, 12, 282, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-30', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(185, 12, 282, 1, 'Comissão Produtor', '283.07', 0, NULL, '0.00', '2021-01-30', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(186, 1, 283, 1, 'Taxa OctaPay', '25.67', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(187, 1, 283, 1, 'Juros Cartão', '48.04', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(188, 3, 283, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-27', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(189, 12, 283, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-30', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:08'),
(190, 12, 283, 1, 'Comissão Produtor', '283.07', 0, NULL, '0.00', '2021-01-30', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(191, 1, 284, 1, 'Taxa OctaPay', '25.67', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(192, 1, 284, 1, 'Juros Cartão', '48.04', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(193, 3, 284, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-27', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(194, 12, 284, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-30', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(195, 12, 284, 1, 'Comissão Produtor', '283.07', 0, NULL, '0.00', '2021-01-30', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(196, 1, 285, 1, 'Taxa OctaPay', '25.67', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(197, 1, 285, 1, 'Juros Cartão', '48.04', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(198, 3, 285, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-27', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(199, 12, 285, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-30', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(200, 12, 285, 1, 'Comissão Produtor', '283.07', 0, NULL, '0.00', '2021-01-30', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(201, 1, 286, 1, 'Taxa OctaPay', '25.67', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(202, 1, 286, 1, 'Juros Cartão', '48.04', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(203, 3, 286, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-27', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(204, 12, 286, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-30', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(205, 12, 286, 1, 'Comissão Produtor', '283.07', 0, NULL, '0.00', '2021-01-30', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(206, 1, 287, 1, 'Taxa OctaPay', '25.67', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(207, 1, 287, 1, 'Juros Cartão', '48.04', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(208, 3, 287, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-27', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(209, 12, 287, 1, 'Comissão coprodução', '35.38', 0, NULL, '0.00', '2021-01-30', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(210, 12, 287, 1, 'Comissão Produtor', '283.07', 0, NULL, '0.00', '2021-01-30', 2, 1, NULL, 1, NULL, NULL, '2021-01-20', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(211, 1, 288, 5, 'Taxa OctaPay', '13.81', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-21', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(212, 1, 288, 5, 'Juros Cartão', '14.10', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-21', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(213, 12, 288, 5, 'Comissão Produtor', '163.49', 0, NULL, '0.00', '2021-01-31', 2, 1, NULL, 1, NULL, NULL, '2021-01-21', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(214, 1, 294, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(215, 3, 294, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(216, 12, 294, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(217, 12, 294, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(218, 1, 297, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(219, 3, 297, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(220, 12, 297, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(221, 12, 297, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(222, 1, 298, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(223, 1, 298, 1, 'Juros Cartão', '68.68', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(224, 3, 298, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(225, 12, 298, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(226, 12, 298, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(227, 1, 299, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(228, 3, 299, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(229, 12, 299, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(230, 12, 299, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(231, 1, 300, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(232, 3, 300, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(233, 12, 300, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(234, 12, 300, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(235, 1, 301, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(236, 3, 301, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(237, 12, 301, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(238, 12, 301, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(239, 1, 302, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(240, 3, 302, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(241, 12, 302, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(242, 12, 302, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(243, 1, 303, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(244, 3, 303, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(245, 12, 303, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(246, 12, 303, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(247, 1, 304, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(248, 3, 304, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(249, 12, 304, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(250, 12, 304, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(251, 1, 305, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(252, 3, 305, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(253, 12, 305, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(254, 12, 305, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(255, 1, 309, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(256, 3, 309, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(257, 12, 309, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(258, 12, 309, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(259, 1, 310, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(260, 3, 310, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(261, 12, 310, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(262, 12, 310, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(263, 1, 311, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(264, 3, 311, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(265, 12, 311, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(266, 12, 311, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(267, 1, 312, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(268, 3, 312, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(269, 12, 312, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(270, 12, 312, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(271, 1, 313, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(272, 3, 313, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(273, 12, 313, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(274, 12, 313, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(275, 1, 314, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(276, 3, 314, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(277, 12, 314, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(278, 12, 314, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(279, 1, 315, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(280, 3, 315, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(281, 12, 315, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(282, 12, 315, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(283, 1, 316, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:21', '2021-02-04 18:15:09'),
(284, 3, 316, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-01', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(285, 12, 316, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(286, 12, 316, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-25', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(287, 1, 326, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(288, 1, 326, 1, 'Juros Cartão', '57.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(289, 3, 326, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-02', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(290, 12, 326, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(291, 12, 326, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(292, 1, 328, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(293, 1, 328, 1, 'Juros Cartão', '68.68', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(294, 3, 328, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-02', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(295, 12, 328, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(296, 12, 328, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29');
INSERT INTO `comissao` (`id`, `usuario`, `venda`, `produto`, `descricao`, `valor`, `antecipado`, `saldo`, `taxa`, `tempo_saque`, `disponivel`, `tipo`, `conta`, `status`, `codigo`, `observacao`, `data_pedido`, `usuario_ultima_alteracao`, `created_at`, `updated_at`) VALUES
(297, 1, 329, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(298, 1, 329, 1, 'Juros Cartão', '68.68', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(299, 3, 329, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-02', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(300, 12, 329, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(301, 12, 329, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(302, 1, 330, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(303, 1, 330, 1, 'Juros Cartão', '68.68', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(304, 3, 330, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-02', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(305, 12, 330, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(306, 12, 330, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(307, 1, 331, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(308, 1, 331, 1, 'Juros Cartão', '57.20', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(309, 3, 331, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-02', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(310, 12, 331, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(311, 12, 331, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(312, 1, 332, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(313, 1, 332, 1, 'Juros Cartão', '46.04', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(314, 3, 332, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-02', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(315, 12, 332, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(316, 12, 332, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(317, 1, 333, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(318, 1, 333, 1, 'Juros Cartão', '51.61', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(319, 3, 333, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-02', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(320, 12, 333, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(321, 12, 333, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(322, 1, 334, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(323, 1, 334, 1, 'Juros Cartão', '68.68', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(324, 3, 334, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-02', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(325, 12, 334, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(326, 12, 334, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(327, 1, 335, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(328, 1, 335, 1, 'Juros Cartão', '68.68', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(329, 3, 335, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-02', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(330, 12, 335, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(331, 12, 335, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(332, 1, 336, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(333, 1, 336, 1, 'Juros Cartão', '24.16', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(334, 3, 336, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-02', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(335, 12, 336, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(336, 12, 336, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(337, 1, 338, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(338, 1, 338, 1, 'Juros Cartão', '51.61', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(339, 3, 338, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-02', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(340, 12, 338, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(341, 12, 338, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(342, 1, 341, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(343, 1, 341, 1, 'Juros Cartão', '13.54', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(344, 3, 341, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-02', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(345, 12, 341, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(346, 12, 341, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-01-26', NULL, '2021-02-04 18:14:22', '2021-02-05 15:08:29'),
(347, 1, 350, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-27', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(348, 1, 350, 1, 'Juros Cartão', '68.68', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-01-27', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(349, 3, 350, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-03', 2, 1, NULL, 1, NULL, NULL, '2021-01-27', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(350, 12, 350, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-06', 2, 1, NULL, 1, NULL, NULL, '2021-01-27', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(351, 12, 350, 1, 'Comissão Produtor', '255.65', 0, NULL, '0.00', '2021-02-06', 2, 1, NULL, 1, NULL, NULL, '2021-01-27', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(352, 1, 374, 1, 'Taxa OctaPay', '23.43', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-01', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(353, 1, 374, 1, 'Juros Cartão', '68.68', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-01', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(354, 5, 374, 1, 'Comissão afiliado', '117.30', 0, NULL, '0.00', '2021-02-21', 2, 1, NULL, 1, NULL, NULL, '2021-02-01', NULL, '2021-02-04 18:14:22', '2021-02-22 16:49:14'),
(355, 3, 374, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-08', 2, 1, NULL, 1, NULL, NULL, '2021-02-01', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(356, 12, 374, 1, 'Comissão coprodução', '31.96', 0, NULL, '0.00', '2021-02-11', 2, 1, NULL, 1, NULL, NULL, '2021-02-01', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(357, 12, 374, 1, 'Comissão Produtor', '138.35', 0, NULL, '0.00', '2021-02-11', 2, 1, NULL, 1, NULL, NULL, '2021-02-01', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(358, 1, 375, 1, 'Taxa OctaPay', '18.19', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(359, 1, 375, 1, 'Juros Cartão', '90.30', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(360, 5, 375, 1, 'Comissão afiliado', '89.90', 0, NULL, '0.00', '2021-02-22', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-22 16:49:14'),
(361, 3, 375, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-09', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(362, 12, 375, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-12', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(363, 12, 375, 1, 'Comissão Produtor', '107.09', 0, NULL, '0.00', '2021-02-12', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(364, 1, 376, 1, 'Taxa OctaPay', '18.19', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(365, 1, 376, 1, 'Juros Cartão', '30.00', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:09'),
(366, 5, 376, 1, 'Comissão afiliado', '89.90', 0, NULL, '0.00', '2021-02-22', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-22 16:49:14'),
(367, 3, 376, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-09', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(368, 12, 376, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-12', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(369, 12, 376, 1, 'Comissão Produtor', '107.09', 0, NULL, '0.00', '2021-02-12', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(370, 1, 377, 1, 'Taxa OctaPay', '18.19', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:10'),
(371, 5, 377, 1, 'Comissão afiliado', '89.90', 0, NULL, '0.00', '2021-02-22', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-22 16:49:14'),
(372, 3, 377, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-09', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(373, 12, 377, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-12', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(374, 12, 377, 1, 'Comissão Produtor', '107.09', 0, NULL, '0.00', '2021-02-12', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(375, 1, 378, 1, 'Taxa OctaPay', '20.14', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:10'),
(376, 1, 378, 1, 'Juros Cartão', '60.30', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:10'),
(377, 5, 378, 1, 'Comissão afiliado', '89.90', 0, NULL, '0.00', '2021-02-22', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-22 16:49:14'),
(378, 3, 378, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-09', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(379, 12, 378, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-12', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(380, 12, 378, 1, 'Comissão Produtor', '107.09', 0, NULL, '0.00', '2021-02-12', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(381, 1, 382, 1, 'Taxa OctaPay', '20.14', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:10'),
(382, 5, 382, 1, 'Comissão afiliado', '89.90', 0, NULL, '0.00', '2021-02-22', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-22 16:49:14'),
(383, 3, 382, 1, 'Comissão coprodução', '27.43', 0, NULL, '0.00', '2021-02-09', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(384, 12, 382, 1, 'Comissão coprodução', '27.43', 0, NULL, '0.00', '2021-02-12', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(385, 12, 382, 1, 'Comissão Produtor', '129.52', 0, NULL, '0.00', '2021-02-12', 2, 1, NULL, 1, NULL, NULL, '2021-02-02', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(386, 1, 385, 1, 'Taxa OctaPay', '18.19', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:10'),
(387, 1, 385, 1, 'Juros Cartão', '54.18', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:10'),
(388, 5, 385, 1, 'Comissão afiliado', '89.90', 0, NULL, '0.00', '2021-02-23', 0, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-04 18:14:22'),
(389, 3, 385, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-10', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(390, 12, 385, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-13', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(391, 12, 385, 1, 'Comissão Produtor', '107.09', 0, NULL, '0.00', '2021-02-13', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(392, 1, 386, 1, 'Taxa OctaPay', '18.19', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:10'),
(393, 1, 386, 1, 'Juros Cartão', '54.18', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:10'),
(394, 5, 386, 1, 'Comissão afiliado', '89.90', 0, NULL, '0.00', '2021-02-23', 0, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-04 18:14:22'),
(395, 3, 386, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-10', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(396, 12, 386, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-13', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(397, 12, 386, 1, 'Comissão Produtor', '107.09', 0, NULL, '0.00', '2021-02-13', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(398, 1, 387, 1, 'Taxa OctaPay', '18.19', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:10'),
(399, 1, 387, 1, 'Juros Cartão', '54.18', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:10'),
(400, 5, 387, 1, 'Comissão afiliado', '89.90', 0, NULL, '0.00', '2021-02-23', 0, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-04 18:14:22'),
(401, 3, 387, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-10', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(402, 12, 387, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-13', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(403, 12, 387, 1, 'Comissão Produtor', '107.09', 0, NULL, '0.00', '2021-02-13', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(404, 1, 388, 1, 'Taxa OctaPay', '18.19', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:10'),
(405, 1, 388, 1, 'Juros Cartão', '54.18', 0, NULL, '0.00', '2021-02-04', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-04 18:15:10'),
(406, 5, 388, 1, 'Comissão afiliado', '89.90', 0, NULL, '0.00', '2021-02-23', 0, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-04 18:14:22'),
(407, 3, 388, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-10', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(408, 12, 388, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-13', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(409, 12, 388, 1, 'Comissão Produtor', '107.09', 0, NULL, '0.00', '2021-02-13', 2, 1, NULL, 1, NULL, NULL, '2021-02-03', NULL, '2021-02-04 18:14:22', '2021-02-19 19:03:12'),
(410, 1, 400, 1, 'Taxa OctaPay', '18.19', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-02-05', NULL, '2021-02-05 15:08:25', '2021-02-05 15:08:29'),
(411, 1, 400, 1, 'Juros Cartão', '54.18', 0, NULL, '0.00', '2021-02-05', 2, 1, NULL, 1, NULL, NULL, '2021-02-05', NULL, '2021-02-05 15:08:25', '2021-02-05 15:08:29'),
(412, 5, 400, 1, 'Comissão afiliado', '89.90', 0, NULL, '0.00', '2021-02-25', 0, 1, NULL, 1, NULL, NULL, '2021-02-05', NULL, '2021-02-05 15:08:25', '2021-02-05 15:08:25'),
(413, 3, 400, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-12', 2, 1, NULL, 1, NULL, NULL, '2021-02-05', NULL, '2021-02-05 15:08:25', '2021-02-19 19:03:12'),
(414, 12, 400, 1, 'Comissão coprodução', '24.62', 0, NULL, '0.00', '2021-02-15', 2, 1, NULL, 1, NULL, NULL, '2021-02-05', NULL, '2021-02-05 15:08:25', '2021-02-19 19:03:12'),
(415, 12, 400, 1, 'Comissão Produtor', '107.09', 0, NULL, '0.00', '2021-02-15', 2, 1, NULL, 1, NULL, NULL, '2021-02-05', NULL, '2021-02-05 15:08:25', '2021-02-19 19:03:12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `configuracao_checkout`
--

CREATE TABLE `configuracao_checkout` (
  `id` int(11) NOT NULL,
  `chave_producao` varchar(200) DEFAULT NULL,
  `token_producao` varchar(200) DEFAULT NULL,
  `chave_sandbox` varchar(200) DEFAULT NULL,
  `token_sandbox` varchar(200) DEFAULT NULL,
  `sandbox` tinyint(4) DEFAULT NULL,
  `usuario_ultima_alteracao` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `configuracao_checkout`
--

INSERT INTO `configuracao_checkout` (`id`, `chave_producao`, `token_producao`, `chave_sandbox`, `token_sandbox`, `sandbox`, `usuario_ultima_alteracao`, `created_at`, `updated_at`) VALUES
(1, 'KFKYGAK98QJ8W3PYFWB65PDHKH7LVJFWLXK8QEMX', 'AHCKHLXMMZTPWZ9SHOPH2RWPMT6W8CAU', 'LWSLY0OKFYUYJAV1LAQSSMNYOL6OVGK4KCED87FO', 'K5DRSX8C9CVGZMQGEFMMT03YVQOKJTYF', 1, 12, '2020-12-28 15:01:26', '2020-12-28 15:01:26');

-- --------------------------------------------------------

--
-- Estrutura da tabela `co_produtor`
--

CREATE TABLE `co_produtor` (
  `id` int(11) NOT NULL,
  `produto` int(11) DEFAULT NULL,
  `co_produtor` int(11) DEFAULT NULL,
  `tipo_comissao` int(11) DEFAULT NULL,
  `comissao` decimal(5,2) DEFAULT NULL,
  `tipo_comissao_afiliados` int(11) DEFAULT NULL,
  `comissao_afiliados` decimal(5,2) DEFAULT NULL,
  `gerente` int(11) DEFAULT NULL,
  `aceito` tinyint(4) DEFAULT NULL,
  `todos_afiliados` tinyint(4) DEFAULT NULL,
  `data_limite` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `co_produtor`
--

INSERT INTO `co_produtor` (`id`, `produto`, `co_produtor`, `tipo_comissao`, `comissao`, `tipo_comissao_afiliados`, `comissao_afiliados`, `gerente`, `aceito`, `todos_afiliados`, `data_limite`, `created_at`, `updated_at`) VALUES
(5, 4, 5, 1, '40.00', 0, '20.00', 1, 1, 1, '0000-00-00', '2020-09-01 14:38:17', '2020-12-16 14:03:16'),
(6, 1, 5, 0, '50.20', NULL, NULL, 0, 0, 1, '0000-00-00', '2020-09-23 14:30:13', '2021-01-11 11:36:21'),
(7, 2, 5, 0, '40.00', NULL, NULL, 0, 1, 1, '0000-00-00', '2020-11-12 21:32:27', '2020-12-16 14:04:58'),
(8, 2, 2, 0, '40.00', 0, '20.00', 1, 0, 1, '0000-00-00', '2020-11-12 21:32:42', '2020-11-12 21:32:42'),
(12, 1, 3, 0, '10.00', NULL, NULL, 0, 1, 1, '0000-00-00', '2020-12-29 19:51:50', '2020-12-29 19:56:17'),
(13, 1, 12, 0, '10.00', NULL, NULL, 0, 1, 1, '0000-00-00', '2020-12-29 20:00:25', '2021-01-11 14:39:29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `denuncias_produto`
--

CREATE TABLE `denuncias_produto` (
  `id` int(11) NOT NULL,
  `produto` int(11) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL COMMENT 'quem está fazendo a denúncia',
  `assunto` tinyint(4) DEFAULT NULL,
  `denuncia` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `usuario_ultima_alteracao` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `denuncias_produto`
--

INSERT INTO `denuncias_produto` (`id`, `produto`, `usuario`, `assunto`, `denuncia`, `status`, `usuario_ultima_alteracao`, `created_at`, `updated_at`) VALUES
(1, 4, 12, 1, 'O código de status de resposta HTTP 400 Bad Request indica que o servidor não pode ou não irá processar a requisição devido a alguma coisa que foi entendida como um erro do cliente (por exemplo, sintaxe de requisição mal formada, enquadramento de mensagem de requisição inválida ou requisição de roteamento enganosa).', 1, 12, '2020-11-25 17:29:35', '2020-11-25 17:29:35'),
(2, 2, 12, 0, '', NULL, NULL, '2020-11-25 20:27:48', '2020-11-25 20:27:48');

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `venda` int(11) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf_cnpj` varchar(20) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `pais` varchar(3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `enderecos`
--

INSERT INTO `enderecos` (`id`, `usuario`, `venda`, `nome`, `email`, `telefone`, `cpf_cnpj`, `cep`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `pais`, `created_at`, `updated_at`) VALUES
(1, 1, 272, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-20 18:04:02', '2021-01-20 18:04:02'),
(2, 1, 273, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-20 18:33:57', '2021-01-20 18:33:57'),
(3, 12, 274, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-20 18:43:26', '2021-01-20 18:43:26'),
(4, 12, 275, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-20 18:50:19', '2021-01-20 18:50:19'),
(5, 12, 276, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-20 18:52:11', '2021-01-20 18:52:11'),
(6, 12, 277, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-20 19:14:12', '2021-01-20 19:14:12'),
(7, 12, 278, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-20 19:26:00', '2021-01-20 19:26:00'),
(8, 12, 279, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-20 19:44:58', '2021-01-20 19:44:58'),
(9, 12, 280, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-20 19:48:53', '2021-01-20 19:48:53'),
(10, 12, 281, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '31988869997', '12719252654', '35012160', 'Rua São Felipe', '65', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-20 21:13:30', '2021-01-20 21:13:30'),
(14, 18, 285, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-20 21:57:16', '2021-01-20 21:57:16'),
(15, 18, 286, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '35054220', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-20 21:58:15', '2021-01-20 21:58:15'),
(16, 12, 287, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '31988869997', '12719252654', '35054220', 'Rua A', '330', '', 'Jardim do Trevo', 'Governador Valadares', 'MG', 'BR', '2021-01-20 22:02:32', '2021-01-20 22:02:32'),
(17, 12, 288, 'Pedro Teste', 'business.phs.2020@gmail.com', '33999102490', '12719252654', '35054450', 'Rua Omar Rodrigues Coelho', '12', '', 'Jardim do Trevo', 'Governador Valadares', 'MG', 'BR', '2021-01-21 12:21:31', '2021-01-21 12:21:31'),
(18, 27, 289, 'Pedro Teste 2', 'designmarketing.contato@gmail.com', '33988869997', '97941232006', '35012160', 'Rua São Felipe', '65', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-21 14:09:09', '2021-01-21 14:09:09'),
(19, 28, 290, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-21 14:21:54', '2021-01-21 14:21:54'),
(20, 29, 291, 'Pedro Teste 2', 'designmarketing.contato@gmail.com', '33988869997', '93678275044', '35012160', 'Rua São Felipe', '65', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-21 14:26:23', '2021-01-21 14:26:23'),
(21, 28, 292, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-21 15:04:07', '2021-01-21 15:04:07'),
(22, 28, 293, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 15:38:18', '2021-01-25 15:38:18'),
(23, 28, 294, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 15:48:22', '2021-01-25 15:48:22'),
(24, 28, 295, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 15:50:24', '2021-01-25 15:50:24'),
(25, 28, 296, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 15:50:53', '2021-01-25 15:50:53'),
(26, 28, 297, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 15:51:40', '2021-01-25 15:51:40'),
(27, 28, 298, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 15:57:25', '2021-01-25 15:57:25'),
(28, 28, 299, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 15:57:39', '2021-01-25 15:57:39'),
(29, 28, 300, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 17:53:17', '2021-01-25 17:53:17'),
(30, 28, 301, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 18:01:29', '2021-01-25 18:01:29'),
(31, 12, 302, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-25 18:05:33', '2021-01-25 18:05:33'),
(32, 12, 303, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-25 18:08:36', '2021-01-25 18:08:36'),
(33, 12, 304, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-25 18:46:40', '2021-01-25 18:46:40'),
(34, 12, 305, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-25 18:49:23', '2021-01-25 18:49:23'),
(35, 12, 306, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-25 18:50:01', '2021-01-25 18:50:01'),
(36, 12, 307, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-25 18:51:22', '2021-01-25 18:51:22'),
(37, 12, 308, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-25 18:52:04', '2021-01-25 18:52:04'),
(38, 18, 309, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 18:57:22', '2021-01-25 18:57:22'),
(39, 18, 310, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 18:59:32', '2021-01-25 18:59:32'),
(40, 18, 311, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 19:00:32', '2021-01-25 19:00:32'),
(42, 18, 313, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 19:04:48', '2021-01-25 19:04:48'),
(43, 18, 314, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 19:09:39', '2021-01-25 19:09:39'),
(44, 18, 315, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 19:10:25', '2021-01-25 19:10:25'),
(45, 18, 316, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-25 19:11:14', '2021-01-25 19:11:14'),
(46, 12, 317, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-25 20:20:17', '2021-01-25 20:20:17'),
(47, 12, 318, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-25 20:48:14', '2021-01-25 20:48:14'),
(48, 28, 319, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-26 13:52:26', '2021-01-26 13:52:26'),
(49, 28, 320, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-26 13:54:52', '2021-01-26 13:54:52'),
(50, 12, 321, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 13:59:34', '2021-01-26 13:59:34'),
(51, 12, 322, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 14:25:20', '2021-01-26 14:25:20'),
(54, 12, 325, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 14:33:30', '2021-01-26 14:33:30'),
(55, 12, 326, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 14:51:05', '2021-01-26 14:51:05'),
(56, 12, 327, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 14:56:35', '2021-01-26 14:56:35'),
(57, 12, 328, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 14:57:13', '2021-01-26 14:57:13'),
(58, 5, 329, 'Pedro Henrique da Silva', 'jilo_123@outlook.com', '123242523623', '06929943606', '35012140', 'Rua São Bartolomeu', '20', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 15:02:43', '2021-01-26 15:02:43'),
(59, 5, 330, 'Pedro Henrique da Silva', 'jilo_123@outlook.com', '123242523623', '06929943606', '35012140', 'Rua São Bartolomeu', '20', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 15:03:51', '2021-01-26 15:03:51'),
(60, 12, 331, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 15:09:33', '2021-01-26 15:09:33'),
(61, 12, 332, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 15:16:00', '2021-01-26 15:16:00'),
(62, 12, 333, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 15:17:28', '2021-01-26 15:17:28'),
(63, 12, 334, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 15:20:07', '2021-01-26 15:20:07'),
(64, 12, 335, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 15:25:57', '2021-01-26 15:25:57'),
(65, 18, 336, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-26 15:29:51', '2021-01-26 15:29:51'),
(66, 18, 337, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-26 15:30:26', '2021-01-26 15:30:26'),
(67, 18, 338, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-26 15:31:45', '2021-01-26 15:31:45'),
(68, 18, 339, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-26 15:32:22', '2021-01-26 15:32:22'),
(69, 12, 340, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 15:37:14', '2021-01-26 15:37:14'),
(70, 18, 341, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-26 15:44:22', '2021-01-26 15:44:22'),
(71, 18, 342, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-26 15:45:06', '2021-01-26 15:45:06'),
(72, 30, 343, 'OctaPay Master', 'master@octapay.com.br', '33999102490', '02039274006', '35012140', 'Rua São Bartolomeu', '0', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 19:20:07', '2021-01-26 19:20:07'),
(73, 12, 344, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 19:24:31', '2021-01-26 19:24:31'),
(74, 28, 345, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-26 20:50:06', '2021-01-26 20:50:06'),
(75, 28, 346, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-26 20:52:17', '2021-01-26 20:52:17'),
(76, 28, 347, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-26 20:53:40', '2021-01-26 20:53:40'),
(77, 28, 348, 'Pedro Teste', 'business.phs.2020@gmail.com', '33988869997', '85633573013', '63122128', 'Travessa Francisco Sousa Brasil', '330', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-26 21:00:47', '2021-01-26 21:00:47'),
(78, 12, 349, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', '', '330', '', '', '', 'AC', 'BR', '2021-01-27 14:20:05', '2021-01-27 14:20:05'),
(79, 12, 350, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-27 14:21:57', '2021-01-27 14:21:57'),
(80, 12, 351, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-27 18:40:21', '2021-01-27 18:40:21'),
(81, 12, 352, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-27 18:50:54', '2021-01-27 18:50:54'),
(82, 12, 353, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-27 18:55:44', '2021-01-27 18:55:44'),
(83, 12, 354, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-27 20:33:34', '2021-01-27 20:33:34'),
(84, 12, 355, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-27 20:34:31', '2021-01-27 20:34:31'),
(85, 12, 356, 'Thiago Felix da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-27 21:07:51', '2021-01-27 21:07:51'),
(86, 12, 357, 'Matheus candido parreira', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-27 21:10:14', '2021-01-27 21:10:14'),
(87, 12, 358, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-27 21:22:05', '2021-01-27 21:22:05'),
(88, 12, 359, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-28 13:07:25', '2021-01-28 13:07:25'),
(89, 12, 360, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-28 13:20:26', '2021-01-28 13:20:26'),
(90, 12, 361, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-28 13:21:29', '2021-01-28 13:21:29'),
(91, 12, 362, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-28 13:25:22', '2021-01-28 13:25:22'),
(92, 12, 363, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-28 13:30:06', '2021-01-28 13:30:06'),
(93, 12, 364, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-28 13:31:33', '2021-01-28 13:31:33'),
(94, 12, 365, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-28 13:57:13', '2021-01-28 13:57:13'),
(95, 12, 366, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-01 14:29:19', '2021-02-01 14:29:19'),
(96, 12, 367, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-01 17:52:19', '2021-02-01 17:52:19'),
(97, 12, 368, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-01 18:23:14', '2021-02-01 18:23:14'),
(98, 12, 369, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-01 18:27:50', '2021-02-01 18:27:50'),
(99, 12, 370, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-01 18:31:30', '2021-02-01 18:31:30'),
(100, 12, 371, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-01 18:40:13', '2021-02-01 18:40:13'),
(101, 12, 372, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-01 19:21:05', '2021-02-01 19:21:05'),
(102, 12, 373, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-01 19:52:24', '2021-02-01 19:52:24'),
(103, 12, 374, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-01 19:57:45', '2021-02-01 19:57:45'),
(104, 12, 375, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-02 14:36:06', '2021-02-02 14:36:06'),
(105, 12, 376, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-02 14:38:15', '2021-02-02 14:38:15'),
(106, 12, 377, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-02 14:43:56', '2021-02-02 14:43:56'),
(107, 12, 378, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-02 15:30:08', '2021-02-02 15:30:08'),
(108, 12, 379, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-02 17:54:50', '2021-02-02 17:54:50'),
(109, 12, 380, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-02 17:56:29', '2021-02-02 17:56:29'),
(110, 12, 381, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-02 18:13:34', '2021-02-02 18:13:34'),
(111, 12, 382, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-02 18:14:40', '2021-02-02 18:14:40'),
(112, 12, 383, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-02 20:06:01', '2021-02-02 20:06:01'),
(113, 12, 384, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-02 21:55:38', '2021-02-02 21:55:38'),
(114, 12, 385, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-03 14:19:18', '2021-02-03 14:19:18'),
(115, 12, 386, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-03 14:32:31', '2021-02-03 14:32:31'),
(116, 12, 387, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-03 14:33:38', '2021-02-03 14:33:38'),
(117, 12, 388, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-03 14:36:34', '2021-02-03 14:36:34'),
(118, 12, 389, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-03 14:38:27', '2021-02-03 14:38:27'),
(119, 12, 390, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-03 15:23:42', '2021-02-03 15:23:42'),
(120, 12, 391, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-03 15:25:22', '2021-02-03 15:25:22'),
(121, 12, 392, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', '', '330', '', '', '', 'AC', 'BR', '2021-02-03 15:27:56', '2021-02-03 15:27:56'),
(122, 18, 393, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', '123242523623', '06656875831', '63122128', 'Travessa Francisco Sousa Brasil', '0', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-02-03 20:05:52', '2021-02-03 20:05:52'),
(123, 12, 394, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-05 13:11:18', '2021-02-05 13:11:18'),
(124, 12, 395, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-05 13:12:22', '2021-02-05 13:12:22'),
(125, 12, 396, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-05 13:14:50', '2021-02-05 13:14:50'),
(126, 12, 397, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-05 13:23:54', '2021-02-05 13:23:54'),
(127, 12, 398, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-05 13:27:29', '2021-02-05 13:27:29'),
(128, 12, 399, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-05 13:34:44', '2021-02-05 13:34:44'),
(129, 12, 400, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '123242523623', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-05 15:05:26', '2021-02-05 15:05:26'),
(130, 12, 401, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-11 19:14:11', '2021-02-11 19:14:11'),
(131, 12, 402, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35010040', 'Rua Bárbara Heliodora', '', '', 'Centro', 'Governador Valadares', 'MG', 'BR', '2021-02-11 19:17:39', '2021-02-11 19:17:39'),
(132, 12, 403, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-11 19:27:01', '2021-02-11 19:27:01'),
(133, 12, 404, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35010040', 'Rua Bárbara Heliodora', '', '', 'Centro', 'Governador Valadares', 'MG', 'BR', '2021-02-11 19:34:37', '2021-02-11 19:34:37'),
(134, 12, 405, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-11 19:36:06', '2021-02-11 19:36:06'),
(135, 12, 406, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-11 19:38:59', '2021-02-11 19:38:59'),
(136, 12, 407, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-11 19:42:06', '2021-02-11 19:42:06'),
(137, 12, 408, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-15 11:39:56', '2021-02-15 11:39:56'),
(138, 12, 409, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', 'Apto 3', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-15 11:46:37', '2021-02-15 11:46:37'),
(139, 12, 410, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35010040', 'Rua Bárbara Heliodora', '330', '', 'Centro', 'Governador Valadares', 'MG', 'BR', '2021-02-15 11:54:49', '2021-02-15 11:54:49'),
(140, 12, 411, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '3', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-23 17:00:22', '2021-02-23 17:00:22'),
(141, 12, 412, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-23 18:07:59', '2021-02-23 18:07:59'),
(142, 12, 413, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-23 18:11:52', '2021-02-23 18:11:52'),
(143, 12, 414, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-23 18:15:50', '2021-02-23 18:15:50'),
(144, 12, 415, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-23 18:18:17', '2021-02-23 18:18:17'),
(145, 12, 416, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-23 18:22:59', '2021-02-23 18:22:59'),
(146, 12, 417, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-23 18:25:07', '2021-02-23 18:25:07'),
(147, 12, 418, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-23 18:27:04', '2021-02-23 18:27:04'),
(148, 12, 419, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-23 18:29:44', '2021-02-23 18:29:44'),
(149, 12, 420, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-24 19:22:01', '2021-02-24 19:22:01'),
(150, 12, 421, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-25 17:25:42', '2021-02-25 17:25:42'),
(151, 12, 422, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-25 17:28:03', '2021-02-25 17:28:03'),
(152, 12, 423, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-25 17:29:17', '2021-02-25 17:29:17'),
(153, 12, 424, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '330', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-26 19:02:19', '2021-02-26 19:02:19'),
(154, 12, 425, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-26 19:03:53', '2021-02-26 19:03:53'),
(155, 12, 426, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-26 19:05:57', '2021-02-26 19:05:57'),
(156, 12, 427, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-02-26 19:09:10', '2021-02-26 19:09:10'),
(157, 12, 428, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-03-01 13:11:31', '2021-03-01 13:11:31'),
(158, 12, 429, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-03-01 13:27:19', '2021-03-01 13:27:19'),
(159, 12, 430, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '63122128', 'Travessa Francisco Sousa Brasil', '', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-03-01 13:53:59', '2021-03-01 13:53:59'),
(160, 12, 431, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '63122128', 'Travessa Francisco Sousa Brasil', '', '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-03-01 14:41:50', '2021-03-01 14:41:50'),
(161, 12, 432, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', '33999102490', '12719252654', '35012140', 'Rua São Bartolomeu', '', '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-03-01 20:51:13', '2021-03-01 20:51:13');

-- --------------------------------------------------------

--
-- Estrutura da tabela `integracao_notazz`
--

CREATE TABLE `integracao_notazz` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `api_notazz` varchar(200) DEFAULT NULL,
  `data_nota` tinyint(4) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `codigo_cnae` varchar(10) DEFAULT NULL,
  `codigo_lc116` varchar(5) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `integracao_notazz`
--

INSERT INTO `integracao_notazz` (`id`, `usuario`, `api_notazz`, `data_nota`, `produto`, `codigo_cnae`, `codigo_lc116`, `status`, `created_at`, `updated_at`) VALUES
(3, 12, 'wYyYDO0EzYjlDOmdjNwYmNzYjZyMGNklDZ4IzNlFDOjpHd14ke5QVMuNmM2gDNxM2Y5gjZ3YDMmZzM2YmMjRDZ5QGOycTZxgzYnZGKsy14L0BRxu8Ap35AOjLTlLJylZj6wBxSzcsPNSlrLnhbZeoI5Fr9XMbth3czZNJ8yiZVTvL7OfZzAx1', 0, 0, '', '', 1, '2021-02-09 14:29:01', '2021-02-09 14:29:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `nota_fiscal`
--

CREATE TABLE `nota_fiscal` (
  `id` int(11) NOT NULL,
  `id_nota` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `venda` int(11) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `link_pdf` varchar(400) DEFAULT NULL,
  `link_xml` varchar(400) DEFAULT NULL,
  `chave` varchar(100) DEFAULT NULL,
  `codigo_verificacao` varchar(20) DEFAULT NULL,
  `emissao` datetime DEFAULT NULL,
  `motivo_status` varchar(300) DEFAULT NULL,
  `protocolo_autorizacao` varchar(50) DEFAULT NULL,
  `cfop` varchar(20) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `serie` int(3) DEFAULT NULL,
  `venda1` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `nota_fiscal`
--

INSERT INTO `nota_fiscal` (`id`, `id_nota`, `status`, `venda`, `usuario`, `link_pdf`, `link_xml`, `chave`, `codigo_verificacao`, `emissao`, `motivo_status`, `protocolo_autorizacao`, `cfop`, `numero`, `serie`, `venda1`, `created_at`, `updated_at`) VALUES
(1, 'e22eb51eee3e6e0e1872cebc65ea61e3', 1, 245, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-14 14:47:25', '2021-01-14 14:47:25'),
(2, '827ccb0eea8a706c4c34a16891f84e7b', 1, 245, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-14 14:47:25', '2021-01-14 14:47:25'),
(3, 'c8b0f5b87fcd56ab1ce7a5d53701a2e2', 1, 400, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-09 14:29:18', '2021-02-09 14:29:18'),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-22 13:11:05', '2021-02-22 13:11:05'),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-22 13:11:31', '2021-02-22 13:11:31'),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-22 13:14:28', '2021-02-22 13:14:28'),
(7, '827ccb0eea8a706c4c34a16891f84e23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-22 13:18:42', '2021-02-22 13:18:42');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacao`
--

CREATE TABLE `notificacao` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `venda` int(11) DEFAULT NULL,
  `texto` varchar(200) DEFAULT NULL,
  `lida` tinyint(4) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `notificacao`
--

INSERT INTO `notificacao` (`id`, `usuario`, `venda`, `texto`, `lida`, `link`, `created_at`, `updated_at`) VALUES
(1, 12, NULL, 'Novo boleto gerado', 0, NULL, '2020-12-02 20:25:21', '2020-12-02 20:25:21'),
(2, 12, NULL, 'Novo boleto gerado', 0, NULL, '2020-12-02 20:25:21', '2020-12-02 20:25:21'),
(3, 12, NULL, 'Novo boleto gerado', 0, NULL, '2020-12-02 20:37:33', '2020-12-02 20:37:33'),
(4, 12, NULL, 'Novo boleto gerado', 0, NULL, '2020-12-02 20:37:33', '2020-12-02 20:37:33'),
(5, 12, NULL, 'Novo boleto gerado', 0, NULL, '2020-12-02 20:40:39', '2020-12-02 20:40:39'),
(6, 3, NULL, 'Novo boleto gerado', 0, NULL, '2020-12-02 20:40:39', '2020-12-02 20:40:39'),
(7, 12, NULL, 'Novo boleto gerado', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 20:43:21', '2020-12-02 20:43:21'),
(8, 3, NULL, 'Novo boleto gerado', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 20:43:21', '2020-12-02 20:43:21'),
(9, 12, NULL, 'Novo boleto gerado', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 20:44:41', '2020-12-02 20:44:41'),
(10, 3, NULL, 'Novo boleto gerado', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 20:44:41', '2020-12-02 20:44:41'),
(11, 12, 149, 'Novo boleto gerado', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 20:45:51', '2020-12-02 20:45:51'),
(12, 3, 149, 'Novo boleto gerado', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 20:45:51', '2020-12-02 20:45:51'),
(13, 12, 149, 'Novo boleto gerado', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:01:21', '2020-12-02 21:01:21'),
(14, 3, 149, 'Novo boleto geradoSua comissão: R$ 10', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:01:21', '2020-12-02 21:01:21'),
(15, 12, 149, 'Novo boleto gerado', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:03:43', '2020-12-02 21:03:43'),
(16, 3, 149, 'Novo boleto gerado\n Sua comissão: R$ 10', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:03:43', '2020-12-02 21:03:43'),
(17, 12, 149, 'Novo boleto gerado', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:07:47', '2020-12-02 21:07:47'),
(18, 3, 149, 'Novo boleto gerado - Sua comissão: R$ 10', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:07:47', '2020-12-02 21:07:47'),
(19, 12, 149, 'Novo boleto gerado', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:08:35', '2020-12-02 21:08:35'),
(20, 3, 149, 'Novo boleto gerado - Sua comissão: R$ 10,00', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:08:35', '2020-12-02 21:08:35'),
(21, 12, 149, ' - Produto Produto Teste 4', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:33:57', '2020-12-02 21:33:57'),
(22, 3, 149, ' - Produto Produto Teste 4 - Sua comissão: R$ 10,00', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:33:57', '2020-12-02 21:33:57'),
(23, 12, 149, 'Boleto gerado - Produto Produto Teste 4', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:34:28', '2020-12-02 21:34:28'),
(24, 3, 149, 'Boleto gerado - Produto Produto Teste 4 - Sua comissão: R$ 10,00', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:34:28', '2020-12-02 21:34:28'),
(25, 12, 149, 'Boleto gerado - Produto: Produto Teste 4', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:34:51', '2020-12-02 21:34:51'),
(26, 3, 149, 'Boleto gerado - Produto: Produto Teste 4 - Sua comissão: R$ 10,00', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:34:51', '2020-12-02 21:34:51'),
(27, 12, 149, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:36:32', '2020-12-02 21:36:32'),
(28, 3, 149, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4 - Sua comissão: R$ 10,00', 0, 'https://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-02 21:36:32', '2020-12-02 21:36:32'),
(29, 12, 165, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-TDKZVMN1LN0W', '2020-12-03 13:44:38', '2020-12-03 13:44:38'),
(30, 3, 166, 'Boleto gerado - PRODUTO: PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-9YUK39OA55UQ', '2020-12-03 13:47:35', '2020-12-03 13:47:35'),
(31, 3, 167, 'Boleto gerado - PRODUTO: PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-Y75UOEW1Q9ON', '2020-12-03 13:49:57', '2020-12-03 13:49:57'),
(32, 3, 168, 'Boleto gerado - PRODUTO: PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-H3RGGGFSTMJ7', '2020-12-03 13:50:21', '2020-12-03 13:50:21'),
(33, 3, 169, 'Boleto gerado - PRODUTO: PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-4NT6CN9B8SKU', '2020-12-03 13:58:19', '2020-12-03 13:58:19'),
(34, 3, 170, 'Boleto gerado - PRODUTO: PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-92Q28REENB66', '2020-12-03 13:59:39', '2020-12-03 13:59:39'),
(35, 3, 171, 'Boleto gerado - PRODUTO: PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-PS6BMRT3O2IF', '2020-12-03 14:00:52', '2020-12-03 14:00:52'),
(36, 3, 172, 'Boleto gerado - PRODUTO: PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-3M6HE4NC48GH', '2020-12-03 14:18:05', '2020-12-03 14:18:05'),
(37, 3, 173, 'Boleto gerado - PRODUTO: PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-YD3H9FK01YN0', '2020-12-03 14:25:14', '2020-12-03 14:25:14'),
(38, 3, 174, 'Boleto gerado - PRODUTO: PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-YXCPQYTUDBC6', '2020-12-03 14:26:14', '2020-12-03 14:26:14'),
(39, 3, 177, 'Boleto gerado - PRODUTO: PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-BVKY4R2TSBRZ', '2020-12-03 14:36:43', '2020-12-03 14:36:43'),
(40, 3, 178, 'Boleto gerado - PRODUTO: PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-1WFQW35BKIXO', '2020-12-03 14:37:29', '2020-12-03 14:37:29'),
(41, 3, 179, 'Boleto gerado - PRODUTO: PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-QXNMBHDOQ7P4', '2020-12-03 14:38:32', '2020-12-03 14:38:32'),
(42, 12, 180, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-F52SSPVPZT47', '2020-12-03 14:40:57', '2020-12-03 14:40:57'),
(43, 12, 181, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-AIL7FUD13KAN', '2020-12-03 14:42:46', '2020-12-03 14:42:46'),
(44, 12, 182, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-3FTPHMBVM1GG', '2020-12-03 14:43:40', '2020-12-03 14:43:40'),
(45, 12, 183, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-FOISSADLLAN5', '2020-12-03 14:47:35', '2020-12-03 14:47:35'),
(46, 12, 184, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-W5PDEBD7QB4I', '2020-12-03 14:49:45', '2020-12-03 14:49:45'),
(47, 12, 185, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-8HPBF9NE39O3', '2020-12-03 14:51:19', '2020-12-03 14:51:19'),
(48, 12, 186, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-N6670A5U4KMI', '2020-12-03 14:53:47', '2020-12-03 14:53:47'),
(49, 12, 187, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-RBTYV363RFMM', '2020-12-03 14:55:15', '2020-12-03 14:55:15'),
(50, 12, 188, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-IGP3ZK0DYJ2G', '2020-12-03 14:56:06', '2020-12-03 14:56:06'),
(51, 12, 189, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-8FDDD6EDND2P', '2020-12-03 14:57:49', '2020-12-03 14:57:49'),
(52, 12, 190, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-7BS5VUSM8YVJ', '2020-12-03 14:58:41', '2020-12-03 14:58:41'),
(53, 12, 191, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-BF19E81M3FRK', '2020-12-03 14:59:46', '2020-12-03 14:59:46'),
(54, 12, 192, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-NCM2LXAIVXGT', '2020-12-03 15:02:15', '2020-12-03 15:02:15'),
(55, 12, 193, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-733UPCXM9MZU', '2020-12-03 15:03:40', '2020-12-03 15:03:40'),
(56, 12, 194, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-F3NQB3ML9JR4', '2020-12-03 15:05:03', '2020-12-03 15:05:03'),
(57, 12, 195, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-T1CGQAFC5SO9', '2020-12-03 15:05:57', '2020-12-03 15:05:57'),
(58, 12, 196, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-XC8N5YU825KB', '2020-12-03 15:13:33', '2020-12-03 15:13:33'),
(59, 12, 197, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-SFPG19E473N3', '2020-12-03 15:17:46', '2020-12-03 15:17:46'),
(60, 12, 198, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-NZH3TII6N04A', '2020-12-03 15:19:05', '2020-12-03 15:19:05'),
(61, 12, 199, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-26OXAD5EQALL', '2020-12-03 15:20:45', '2020-12-03 15:20:45'),
(62, 12, 200, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-ISINBEUTXFQE', '2020-12-03 15:25:21', '2020-12-03 15:25:21'),
(63, 12, 201, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-YPQXSMRSHLDS', '2020-12-03 15:36:30', '2020-12-03 15:36:30'),
(64, 12, 202, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-E770IS7GOM53', '2020-12-03 15:37:17', '2020-12-03 15:37:17'),
(65, 12, 203, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-RX8DSJBA5HK4', '2020-12-03 15:43:42', '2020-12-03 15:43:42'),
(66, 12, 204, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-5339NPM8913A', '2020-12-03 15:44:18', '2020-12-03 15:44:18'),
(67, 12, 205, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-UH7FY8678SGG', '2020-12-03 16:19:53', '2020-12-03 16:19:53'),
(68, 12, 206, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-SDMAHCMZ4HYO', '2020-12-03 16:22:11', '2020-12-03 16:22:11'),
(69, 12, 207, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-VG5R1HB4PSKV', '2020-12-03 16:25:46', '2020-12-03 16:25:46'),
(70, 12, 208, 'Boleto gerado - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-QCXG5Z4J4CVH', '2020-12-03 16:26:21', '2020-12-03 16:26:21'),
(71, 12, 209, 'Parabéns! Venda realizada - PRODUTO: PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-0DK0WHUK8KEK', '2020-12-03 18:28:13', '2020-12-03 18:28:13'),
(72, 12, 149, 'Boleto gerado - PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-04 18:00:00', '2020-12-04 18:00:00'),
(73, 3, 149, 'Boleto gerado - PRODUTO TESTE 4 - Sua comissão: R$ 10,00', 0, 'http://localhost/octapay/vendas?venda=PAY-PMNFFJI02Y4S', '2020-12-04 18:00:01', '2020-12-04 18:00:01'),
(74, 12, 210, 'Boleto gerado - PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-34AZFGQIGLFI', '2020-12-04 19:57:34', '2020-12-04 19:57:34'),
(75, 12, 211, 'Boleto gerado - PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-CJNP3WO8NL2M', '2020-12-08 18:16:09', '2020-12-08 18:16:09'),
(76, 12, 212, 'Boleto gerado - PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-150WYUUY55L9', '2020-12-08 18:24:33', '2020-12-08 18:24:33'),
(77, 12, 213, 'Boleto gerado - PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-M8RLRQCEHB3Z', '2020-12-08 18:25:19', '2020-12-08 18:25:19'),
(78, 12, 214, 'Boleto gerado - PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-W0J8GX6PZMCL', '2020-12-08 19:12:36', '2020-12-08 19:12:36'),
(79, 12, 215, 'Boleto gerado - PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-96F558UOKSIT', '2020-12-08 19:18:20', '2020-12-08 19:18:20'),
(80, 12, 216, 'Boleto gerado - PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-VFP9EIWLYO1U', '2020-12-08 19:19:14', '2020-12-08 19:19:14'),
(81, 12, 217, 'Boleto gerado - PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-XF8GNG6JFNS6', '2020-12-08 19:25:55', '2020-12-08 19:25:55'),
(82, 12, 218, 'Boleto gerado - PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-XWQNN3ZKNORG', '2020-12-08 19:40:39', '2020-12-08 19:40:39'),
(83, 12, 219, 'Boleto gerado - PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-7YLV8IQK0QJ9', '2020-12-08 21:19:21', '2020-12-08 21:19:21'),
(84, 12, 220, 'Boleto gerado - PRODUTO TESTE 4', 0, 'http://localhost/octapay/vendas?venda=PAY-QG4JX2GD2VB9', '2020-12-08 21:24:51', '2020-12-08 21:24:51'),
(85, 3, 221, 'Boleto gerado - PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-H4OFWSU44OYA', '2020-12-08 21:32:01', '2020-12-08 21:32:01'),
(86, 3, 222, 'Boleto gerado - PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-TXQ6MJMOA5FJ', '2020-12-08 21:45:29', '2020-12-08 21:45:29'),
(87, 3, 223, 'Boleto gerado - PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-UW957MG23Y4N', '2020-12-09 19:16:57', '2020-12-09 19:16:57'),
(88, 3, 224, 'Boleto gerado - PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-OJW2SIR65FHE', '2020-12-09 19:20:24', '2020-12-09 19:20:24'),
(89, 3, 225, 'Boleto gerado - PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-JX22ZAKX33EK', '2020-12-09 19:21:45', '2020-12-09 19:21:45'),
(90, 3, 226, 'Boleto gerado - PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-D1VO76C4JBW2', '2020-12-09 19:22:16', '2020-12-09 19:22:16'),
(91, 3, 227, 'Boleto gerado - PRODUTO TESTE 1', 0, 'http://localhost/octapay/vendas?venda=PAY-IS36RDUIATIE', '2020-12-09 19:55:07', '2020-12-09 19:55:07'),
(92, 3, 228, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-0DQU387J67JJ', '2020-12-21 13:47:11', '2020-12-21 13:47:11'),
(93, 12, 229, 'Boleto gerado - BLEND BERRY', 0, 'http://localhost/octapay/vendas?venda=PAY-27LJZ5YVG5OF', '2020-12-28 15:53:33', '2020-12-28 15:53:33'),
(94, 12, 230, 'Boleto gerado - BLEND BERRY', 0, 'http://localhost/octapay/vendas?venda=PAY-LWCSIXK3FX5W', '2020-12-28 15:53:45', '2020-12-28 15:53:45'),
(95, 12, 231, 'Boleto gerado - BLEND BERRY', 0, 'http://localhost/octapay/vendas?venda=PAY-QQ7YRMDGC9SL', '2020-12-28 18:02:19', '2020-12-28 18:02:19'),
(96, 3, 232, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-II2FZWK3FUAW', '2020-12-28 20:33:49', '2020-12-28 20:33:49'),
(97, 12, 233, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-DOG4IJ4V9EA4', '2020-12-29 12:30:07', '2020-12-29 12:30:07'),
(98, 25, 233, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 117,30', 0, 'http://localhost/octapay/vendas?venda=PAY-DOG4IJ4V9EA4', '2020-12-29 12:30:07', '2020-12-29 12:30:07'),
(99, 12, 234, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-C0MK9JGNFPVC', '2020-12-29 12:59:46', '2020-12-29 12:59:46'),
(100, 12, 235, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-N5TK5CVE5NG1', '2020-12-29 13:04:05', '2020-12-29 13:04:05'),
(101, 25, 235, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 117,30', 0, 'http://localhost/octapay/vendas?venda=PAY-N5TK5CVE5NG1', '2020-12-29 13:04:05', '2020-12-29 13:04:05'),
(102, 3, 236, 'Parabéns! Venda realizada - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-4OB0MFOVSF5Q', '2021-01-04 13:17:38', '2021-01-04 13:17:38'),
(103, 3, 237, 'Parabéns! Venda realizada - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-GQTU4UHWINOH', '2021-01-04 13:49:36', '2021-01-04 13:49:36'),
(104, 12, 238, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-IW6R0O8QH2BQ', '2021-01-05 19:45:42', '2021-01-05 19:45:42'),
(105, 12, 239, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-078VRHCE52BI', '2021-01-05 22:10:55', '2021-01-05 22:10:55'),
(106, 3, 240, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-2OCYPJ3OEH49', '2021-01-07 20:44:37', '2021-01-07 20:44:37'),
(107, 3, 241, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-1FTVHRJXZN9R', '2021-01-07 20:48:08', '2021-01-07 20:48:08'),
(108, 3, 242, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-O8I3OSBF1US9', '2021-01-07 20:57:32', '2021-01-07 20:57:32'),
(109, 12, 245, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-691RULZHXDIR', '2021-01-11 18:28:34', '2021-01-11 18:28:34'),
(110, 12, 246, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-892HL8LGBIIN', '2021-01-11 19:43:05', '2021-01-11 19:43:05'),
(111, 12, 247, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-8QWXLA6A2SB9', '2021-01-11 20:09:03', '2021-01-11 20:09:03'),
(112, 12, 248, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-IWLXBPXGQ4B8', '2021-01-11 20:12:37', '2021-01-11 20:12:37'),
(113, 12, 249, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-TLQW2HZ4MKMM', '2021-01-11 20:14:05', '2021-01-11 20:14:05'),
(114, 12, 250, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-KHWFMIVUBYAF', '2021-01-11 20:17:56', '2021-01-11 20:17:56'),
(115, 12, 251, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-2WAPOEFWAF08', '2021-01-11 20:20:34', '2021-01-11 20:20:34'),
(116, 12, 252, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-9A37DP86BNS0', '2021-01-12 12:59:17', '2021-01-12 12:59:17'),
(117, 12, 253, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-T82NXPVAWTOV', '2021-01-12 18:37:59', '2021-01-12 18:37:59'),
(118, 12, 254, 'Boleto gerado - BLEND BERRY', 0, 'http://localhost/octapay/vendas?venda=PAY-3KAKFILNF9NX', '2021-01-13 20:18:45', '2021-01-13 20:18:45'),
(119, 12, 255, 'Parabéns! Venda realizada - BLEND BERRY', 0, 'http://localhost/octapay/vendas?venda=PAY-LZOJIEF3T3FX', '2021-01-13 20:48:25', '2021-01-13 20:48:25'),
(120, 12, 256, 'Parabéns! Venda realizada - BLEND BERRY', 0, 'http://localhost/octapay/vendas?venda=PAY-K66ML64GO9TA', '2021-01-13 20:53:38', '2021-01-13 20:53:38'),
(121, 12, 257, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-9OAF4V36EKEN', '2021-01-15 14:47:24', '2021-01-15 14:47:24'),
(122, 12, 258, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-I63VR2RB0TCR', '2021-01-16 17:42:04', '2021-01-16 17:42:04'),
(123, 12, 259, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-ZVITHYJ6C20B', '2021-01-18 15:43:45', '2021-01-18 15:43:45'),
(124, 12, 260, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-FXJZNKE0G7IC', '2021-01-18 18:32:35', '2021-01-18 18:32:35'),
(125, 12, 261, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-OYEJ5S1J1FZB', '2021-01-18 18:47:29', '2021-01-18 18:47:29'),
(126, 12, 262, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-L2K7LARZMZHL', '2021-01-18 18:50:49', '2021-01-18 18:50:49'),
(127, 12, 263, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-ICQ2P54JHN0M', '2021-01-19 21:33:28', '2021-01-19 21:33:28'),
(128, 12, 264, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-D1AEKRL0GMFC', '2021-01-19 21:39:48', '2021-01-19 21:39:48'),
(129, 12, 265, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-Q75OA9HA0JY6', '2021-01-19 21:59:33', '2021-01-19 21:59:33'),
(130, 12, 268, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-NOPCW5VHP6WA', '2021-01-20 15:52:54', '2021-01-20 15:52:54'),
(131, 12, 269, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-Q6H1ZVIXGTLD', '2021-01-20 16:01:40', '2021-01-20 16:01:40'),
(132, 12, 270, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-AXVM8HVDZDAZ', '2021-01-20 18:01:48', '2021-01-20 18:01:48'),
(133, 12, 271, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-KS368M0P6YN3', '2021-01-20 18:02:52', '2021-01-20 18:02:52'),
(134, 12, 272, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-VVVLKQYYPIWA', '2021-01-20 18:04:02', '2021-01-20 18:04:02'),
(135, 12, 273, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-I2IEV1P2BGXR', '2021-01-20 18:33:58', '2021-01-20 18:33:58'),
(136, 12, 274, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-6P7PF5NWV3VB', '2021-01-20 18:43:26', '2021-01-20 18:43:26'),
(137, 12, 275, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-QLCQWV6RY2FE', '2021-01-20 18:50:19', '2021-01-20 18:50:19'),
(138, 12, 276, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-IVEU66WW9F25', '2021-01-20 18:52:12', '2021-01-20 18:52:12'),
(139, 12, 277, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-1EFQ4S6RTYKG', '2021-01-20 19:14:12', '2021-01-20 19:14:12'),
(140, 12, 278, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-A2RPO2HUJWI3', '2021-01-20 19:26:00', '2021-01-20 19:26:00'),
(141, 12, 279, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-WTOFVRZ3H0BN', '2021-01-20 19:44:58', '2021-01-20 19:44:58'),
(142, 12, 280, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-63TQRYXCXGRC', '2021-01-20 19:48:53', '2021-01-20 19:48:53'),
(143, 12, 281, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-3GDKE5Y6HHU7', '2021-01-20 21:13:30', '2021-01-20 21:13:30'),
(144, 12, 282, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-PY9R7066578C', '2021-01-20 21:43:07', '2021-01-20 21:43:07'),
(145, 12, 283, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-8HCJZTGAV6Q0', '2021-01-20 21:53:48', '2021-01-20 21:53:48'),
(146, 12, 284, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-Q7NFAR4SKT9E', '2021-01-20 21:55:34', '2021-01-20 21:55:34'),
(147, 12, 285, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-ONFBMGCX812X', '2021-01-20 21:57:16', '2021-01-20 21:57:16'),
(148, 12, 286, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-FWPE88GIX5QP', '2021-01-20 21:58:15', '2021-01-20 21:58:15'),
(149, 12, 287, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-71NDFYZX6ZIE', '2021-01-20 22:02:32', '2021-01-20 22:02:32'),
(150, 12, 288, 'Parabéns! Venda realizada - BLEND BERRY', 0, 'http://localhost/octapay/vendas?venda=PAY-DWT5MSA38DZ5', '2021-01-21 12:21:31', '2021-01-21 12:21:31'),
(151, 12, 289, 'Boleto gerado - BLEND BERRY', 0, 'http://localhost/octapay/vendas?venda=PAY-WHTV85YBFHJ6', '2021-01-21 14:09:09', '2021-01-21 14:09:09'),
(152, 12, 290, 'Boleto gerado - BLEND BERRY', 0, 'http://localhost/octapay/vendas?venda=PAY-TFJZYLNH3Y8G', '2021-01-21 14:21:54', '2021-01-21 14:21:54'),
(153, 12, 291, 'Boleto gerado - BLEND BERRY', 0, 'http://localhost/octapay/vendas?venda=PAY-C76WPWTUL38X', '2021-01-21 14:26:24', '2021-01-21 14:26:24'),
(154, 12, 292, 'Boleto gerado - BLEND BERRY', 0, 'http://localhost/octapay/vendas?venda=PAY-2IISDMJXVWQO', '2021-01-21 15:04:08', '2021-01-21 15:04:08'),
(155, 12, 293, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-DUE2JV8G36NY', '2021-01-25 15:38:19', '2021-01-25 15:38:19'),
(156, 12, 294, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-CWKRH2N9WFEE', '2021-01-25 15:48:22', '2021-01-25 15:48:22'),
(157, 12, 295, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-VVZ1JH6244L0', '2021-01-25 15:50:24', '2021-01-25 15:50:24'),
(158, 12, 296, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-D741S60HFWM8', '2021-01-25 15:50:53', '2021-01-25 15:50:53'),
(159, 12, 297, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-TB0YZCNKHR3B', '2021-01-25 15:51:40', '2021-01-25 15:51:40'),
(160, 12, 298, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-EL1SSJQ7MH6Y', '2021-01-25 15:57:25', '2021-01-25 15:57:25'),
(161, 12, 299, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-893PV0M47CN7', '2021-01-25 15:57:39', '2021-01-25 15:57:39'),
(162, 12, 300, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-540F9TZMZP8E', '2021-01-25 17:53:17', '2021-01-25 17:53:17'),
(163, 12, 301, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-Z7WAC6D0EDKF', '2021-01-25 18:01:29', '2021-01-25 18:01:29'),
(164, 12, 302, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-LBNW879MBLHD', '2021-01-25 18:05:33', '2021-01-25 18:05:33'),
(165, 12, 303, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-NKV6BMPLB1CE', '2021-01-25 18:08:36', '2021-01-25 18:08:36'),
(166, 12, 304, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-55YWQKLIS6AL', '2021-01-25 18:46:40', '2021-01-25 18:46:40'),
(167, 12, 305, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-YB916NET3U8X', '2021-01-25 18:49:23', '2021-01-25 18:49:23'),
(168, 12, 306, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-1TKU7C9ZI6GT', '2021-01-25 18:50:01', '2021-01-25 18:50:01'),
(169, 12, 307, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-WRW7KYFQSW6Y', '2021-01-25 18:51:22', '2021-01-25 18:51:22'),
(170, 12, 308, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-791DNWJGWW67', '2021-01-25 18:52:04', '2021-01-25 18:52:04'),
(171, 12, 309, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-AYW3UJ029AZF', '2021-01-25 18:57:22', '2021-01-25 18:57:22'),
(172, 12, 310, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-SD6RSUWJTGZE', '2021-01-25 18:59:32', '2021-01-25 18:59:32'),
(173, 12, 311, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-G7UHHYAVT1LA', '2021-01-25 19:00:32', '2021-01-25 19:00:32'),
(174, 12, 312, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-Q1SZNFR6HOO1', '2021-01-25 19:02:27', '2021-01-25 19:02:27'),
(175, 12, 313, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-LF74L0BS3SCX', '2021-01-25 19:04:48', '2021-01-25 19:04:48'),
(176, 12, 314, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-KU65JJTIIIDL', '2021-01-25 19:09:39', '2021-01-25 19:09:39'),
(177, 12, 315, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-K94C2BVSC83V', '2021-01-25 19:10:25', '2021-01-25 19:10:25'),
(178, 12, 316, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-V86ZM3QZG5HB', '2021-01-25 19:11:14', '2021-01-25 19:11:14'),
(179, 12, 317, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-NEDXXRV7TZ64', '2021-01-25 20:20:17', '2021-01-25 20:20:17'),
(180, 12, 318, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-DE5AHDQ261EE', '2021-01-25 20:48:15', '2021-01-25 20:48:15'),
(181, 12, 319, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-TRGYKWL3JFC6', '2021-01-26 13:52:27', '2021-01-26 13:52:27'),
(182, 12, 320, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-PYWTHCZ7WGM4', '2021-01-26 13:54:54', '2021-01-26 13:54:54'),
(183, 12, 321, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-UCRBJLGA22FK', '2021-01-26 13:59:35', '2021-01-26 13:59:35'),
(184, 12, 322, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-XOYQBYZA3FDQ', '2021-01-26 14:25:21', '2021-01-26 14:25:21'),
(185, 12, 323, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-V0YY5F9L17IR', '2021-01-26 14:29:33', '2021-01-26 14:29:33'),
(186, 12, 324, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-LK5T1CJHP9B8', '2021-01-26 14:32:49', '2021-01-26 14:32:49'),
(187, 12, 325, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-UXU4LOU2ZRT2', '2021-01-26 14:33:31', '2021-01-26 14:33:31'),
(188, 12, 326, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-43B1O5P4U024', '2021-01-26 14:51:06', '2021-01-26 14:51:06'),
(189, 12, 327, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-VY60NE7PTR3G', '2021-01-26 14:56:36', '2021-01-26 14:56:36'),
(190, 12, 328, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-1PN7EX8FKWOV', '2021-01-26 14:57:14', '2021-01-26 14:57:14'),
(191, 12, 329, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-GYE38HDXCUY5', '2021-01-26 15:02:44', '2021-01-26 15:02:44'),
(192, 12, 330, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-J6L1AEL3H7C9', '2021-01-26 15:03:51', '2021-01-26 15:03:51'),
(193, 12, 331, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-1TJZTTNAAK2T', '2021-01-26 15:09:34', '2021-01-26 15:09:34'),
(194, 12, 332, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-77OVIJRUL1M1', '2021-01-26 15:16:01', '2021-01-26 15:16:01'),
(195, 12, 333, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-OKZY7X5A1N02', '2021-01-26 15:17:29', '2021-01-26 15:17:29'),
(196, 12, 334, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-SG7BJBZY1JR6', '2021-01-26 15:20:08', '2021-01-26 15:20:08'),
(197, 12, 335, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-JE44U7O1TUHJ', '2021-01-26 15:25:58', '2021-01-26 15:25:58'),
(198, 12, 336, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-GTFX07SRO3IW', '2021-01-26 15:29:53', '2021-01-26 15:29:53'),
(199, 12, 337, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-UQCNLB1G197R', '2021-01-26 15:30:27', '2021-01-26 15:30:27'),
(200, 12, 338, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-YBY4Z834FTUW', '2021-01-26 15:31:46', '2021-01-26 15:31:46'),
(201, 12, 339, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-W996AVWHSC9S', '2021-01-26 15:32:23', '2021-01-26 15:32:23'),
(202, 12, 340, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-5B0EQ2F4V79M', '2021-01-26 15:37:15', '2021-01-26 15:37:15'),
(203, 12, 341, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-TCEX13NK67DJ', '2021-01-26 15:44:23', '2021-01-26 15:44:23'),
(204, 12, 342, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-8498L1JKV3C6', '2021-01-26 15:45:07', '2021-01-26 15:45:07'),
(205, 12, 343, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-CZ3YS9M490R8', '2021-01-26 19:20:09', '2021-01-26 19:20:09'),
(206, 12, 344, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-KRV61WNVPH39', '2021-01-26 19:24:32', '2021-01-26 19:24:32'),
(207, 12, 345, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-BXX88BPG4UC9', '2021-01-26 20:50:07', '2021-01-26 20:50:07'),
(208, 12, 346, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-LHD0F4K9D83E', '2021-01-26 20:52:19', '2021-01-26 20:52:19'),
(209, 12, 347, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-HFIEO6R4CBYD', '2021-01-26 20:53:41', '2021-01-26 20:53:41'),
(210, 12, 348, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-6EG3DZYNVQ5G', '2021-01-26 21:00:48', '2021-01-26 21:00:48'),
(211, 12, 349, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-V4L9KL2AMP42', '2021-01-27 14:20:07', '2021-01-27 14:20:07'),
(212, 12, 350, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-VUHXDD5PH6CN', '2021-01-27 14:21:59', '2021-01-27 14:21:59'),
(213, 12, 351, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-GFZ6530I494K', '2021-01-27 18:40:22', '2021-01-27 18:40:22'),
(214, 12, 352, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-J563AENOH1YT', '2021-01-27 18:50:55', '2021-01-27 18:50:55'),
(215, 12, 353, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-84KZZALL1TQ6', '2021-01-27 18:55:45', '2021-01-27 18:55:45'),
(216, 12, 354, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-E2IWVBDBU559', '2021-01-27 20:33:35', '2021-01-27 20:33:35'),
(217, 12, 355, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-5ILI2DIXL2R1', '2021-01-27 20:34:32', '2021-01-27 20:34:32'),
(218, 12, 356, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-RT2ODL1G8NEZ', '2021-01-27 21:07:52', '2021-01-27 21:07:52'),
(219, 12, 357, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-XAQJMK2XV0F0', '2021-01-27 21:10:16', '2021-01-27 21:10:16'),
(220, 12, 358, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-UEQ318VWNU8L', '2021-01-27 21:22:07', '2021-01-27 21:22:07'),
(221, 12, 359, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-TDDVFM8KXRE0', '2021-01-28 13:07:26', '2021-01-28 13:07:26'),
(222, 12, 360, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-ZGG4H28XPV6J', '2021-01-28 13:20:27', '2021-01-28 13:20:27'),
(223, 12, 361, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-KAXW0GDOYE9F', '2021-01-28 13:21:30', '2021-01-28 13:21:30'),
(224, 12, 362, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-WRLV18742X9F', '2021-01-28 13:25:23', '2021-01-28 13:25:23'),
(225, 12, 363, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-I7OVQ9T26BRK', '2021-01-28 13:30:06', '2021-01-28 13:30:06'),
(226, 12, 364, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-2R28NFZ9CR2T', '2021-01-28 13:31:34', '2021-01-28 13:31:34'),
(227, 12, 365, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-YX1ABQN0JP9Z', '2021-01-28 13:57:14', '2021-01-28 13:57:14'),
(228, 12, 366, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-IBO7U9Q7QPR8', '2021-02-01 14:29:21', '2021-02-01 14:29:21'),
(229, 5, 366, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 117,30', 0, 'http://localhost/octapay/vendas?venda=PAY-IBO7U9Q7QPR8', '2021-02-01 14:29:21', '2021-02-01 14:29:21'),
(230, 12, 367, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-QZKNMD7VLA7M', '2021-02-01 17:52:20', '2021-02-01 17:52:20'),
(231, 5, 367, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 117,30', 0, 'http://localhost/octapay/vendas?venda=PAY-QZKNMD7VLA7M', '2021-02-01 17:52:20', '2021-02-01 17:52:20'),
(232, 12, 368, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-YT7W0J3SFQEH', '2021-02-01 18:23:15', '2021-02-01 18:23:15'),
(233, 5, 368, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 117,30', 0, 'http://localhost/octapay/vendas?venda=PAY-YT7W0J3SFQEH', '2021-02-01 18:23:15', '2021-02-01 18:23:15'),
(234, 12, 369, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-MARSXYYUCRHN', '2021-02-01 18:27:51', '2021-02-01 18:27:51'),
(235, 5, 369, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 117,30', 0, 'http://localhost/octapay/vendas?venda=PAY-MARSXYYUCRHN', '2021-02-01 18:27:51', '2021-02-01 18:27:51'),
(236, 12, 370, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-GB47BVOM2G1D', '2021-02-01 18:31:32', '2021-02-01 18:31:32'),
(237, 5, 370, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 117,30', 0, 'http://localhost/octapay/vendas?venda=PAY-GB47BVOM2G1D', '2021-02-01 18:31:32', '2021-02-01 18:31:32'),
(238, 12, 371, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-FU3AYICPZSOR', '2021-02-01 18:40:14', '2021-02-01 18:40:14'),
(239, 5, 371, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 117,30', 0, 'http://localhost/octapay/vendas?venda=PAY-FU3AYICPZSOR', '2021-02-01 18:40:14', '2021-02-01 18:40:14'),
(240, 12, 372, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-P3C7GGLX964J', '2021-02-01 19:21:06', '2021-02-01 19:21:06'),
(241, 5, 372, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 117,30', 0, 'http://localhost/octapay/vendas?venda=PAY-P3C7GGLX964J', '2021-02-01 19:21:06', '2021-02-01 19:21:06'),
(242, 12, 373, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-JADA2N0SQ2QX', '2021-02-01 19:52:25', '2021-02-01 19:52:25'),
(243, 5, 373, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 117,30', 0, 'http://localhost/octapay/vendas?venda=PAY-JADA2N0SQ2QX', '2021-02-01 19:52:25', '2021-02-01 19:52:25'),
(244, 12, 374, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-X30HX27ITM5S', '2021-02-01 19:57:46', '2021-02-01 19:57:46'),
(245, 5, 374, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 117,30', 0, 'http://localhost/octapay/vendas?venda=PAY-X30HX27ITM5S', '2021-02-01 19:57:46', '2021-02-01 19:57:46'),
(246, 12, 375, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-Z2OHYL6XCT1T', '2021-02-02 14:36:07', '2021-02-02 14:36:07'),
(247, 5, 375, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-Z2OHYL6XCT1T', '2021-02-02 14:36:07', '2021-02-02 14:36:07'),
(248, 12, 376, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-CRXMR83XY4AD', '2021-02-02 14:38:17', '2021-02-02 14:38:17'),
(249, 5, 376, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-CRXMR83XY4AD', '2021-02-02 14:38:17', '2021-02-02 14:38:17'),
(250, 12, 377, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-A271E4PQHLXH', '2021-02-02 14:43:58', '2021-02-02 14:43:58'),
(251, 5, 377, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-A271E4PQHLXH', '2021-02-02 14:43:58', '2021-02-02 14:43:58'),
(252, 12, 378, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-FFEUSNCTXAUE', '2021-02-02 15:30:10', '2021-02-02 15:30:10'),
(253, 5, 378, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-FFEUSNCTXAUE', '2021-02-02 15:30:10', '2021-02-02 15:30:10'),
(254, 12, 379, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-ZDIZAH3251WE', '2021-02-02 17:54:51', '2021-02-02 17:54:51'),
(255, 5, 379, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-ZDIZAH3251WE', '2021-02-02 17:54:51', '2021-02-02 17:54:51'),
(256, 12, 380, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-IKF9R11GP4ZC', '2021-02-02 17:56:30', '2021-02-02 17:56:30'),
(257, 5, 380, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-IKF9R11GP4ZC', '2021-02-02 17:56:30', '2021-02-02 17:56:30'),
(258, 12, 381, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-955CWUD8PVG4', '2021-02-02 18:13:35', '2021-02-02 18:13:35'),
(259, 5, 381, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-955CWUD8PVG4', '2021-02-02 18:13:35', '2021-02-02 18:13:35'),
(260, 12, 382, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-7GDV3AO5S1DX', '2021-02-02 18:14:41', '2021-02-02 18:14:41'),
(261, 5, 382, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-7GDV3AO5S1DX', '2021-02-02 18:14:41', '2021-02-02 18:14:41'),
(262, 12, 383, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-COVYXYIJ3BVA', '2021-02-02 20:06:02', '2021-02-02 20:06:02'),
(263, 5, 383, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-COVYXYIJ3BVA', '2021-02-02 20:06:02', '2021-02-02 20:06:02'),
(264, 12, 384, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-82KM1RKEBAR0', '2021-02-02 21:55:40', '2021-02-02 21:55:40'),
(265, 5, 384, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-82KM1RKEBAR0', '2021-02-02 21:55:40', '2021-02-02 21:55:40'),
(266, 12, 385, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-VOB9NDG2UC4V', '2021-02-03 14:19:19', '2021-02-03 14:19:19'),
(267, 5, 385, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-VOB9NDG2UC4V', '2021-02-03 14:19:19', '2021-02-03 14:19:19'),
(268, 12, 386, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-G5XW0M6H35HH', '2021-02-03 14:32:32', '2021-02-03 14:32:32'),
(269, 5, 386, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-G5XW0M6H35HH', '2021-02-03 14:32:32', '2021-02-03 14:32:32'),
(270, 12, 387, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-J00BO1FRJLJS', '2021-02-03 14:33:39', '2021-02-03 14:33:39'),
(271, 5, 387, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-J00BO1FRJLJS', '2021-02-03 14:33:39', '2021-02-03 14:33:39'),
(272, 12, 388, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-CRTWHZWXYPJN', '2021-02-03 14:36:36', '2021-02-03 14:36:36'),
(273, 5, 388, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-CRTWHZWXYPJN', '2021-02-03 14:36:36', '2021-02-03 14:36:36'),
(274, 12, 389, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-A6I4MQWU46JZ', '2021-02-03 14:38:30', '2021-02-03 14:38:30'),
(275, 5, 389, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-A6I4MQWU46JZ', '2021-02-03 14:38:30', '2021-02-03 14:38:30'),
(276, 12, 390, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-WJKNXFWPUO4Q', '2021-02-03 15:23:44', '2021-02-03 15:23:44'),
(277, 5, 390, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-WJKNXFWPUO4Q', '2021-02-03 15:23:44', '2021-02-03 15:23:44'),
(278, 12, 391, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-LX4YGRWHXXV9', '2021-02-03 15:25:23', '2021-02-03 15:25:23'),
(279, 5, 391, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-LX4YGRWHXXV9', '2021-02-03 15:25:23', '2021-02-03 15:25:23'),
(280, 12, 392, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-Y31C186B47OP', '2021-02-03 15:27:57', '2021-02-03 15:27:57'),
(281, 5, 392, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-Y31C186B47OP', '2021-02-03 15:27:57', '2021-02-03 15:27:57'),
(282, 12, 393, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-KK100VZZR6X5', '2021-02-03 20:05:53', '2021-02-03 20:05:53'),
(283, 5, 393, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-KK100VZZR6X5', '2021-02-03 20:05:53', '2021-02-03 20:05:53'),
(284, 3, 394, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-U581ZOMAWQZF', '2021-02-05 13:11:19', '2021-02-05 13:11:19'),
(285, 12, 394, 'Boleto gerado - PRODUTO TESTE 3 - Sua comissão: R$ 46,80', 0, 'http://localhost/octapay/vendas?venda=PAY-U581ZOMAWQZF', '2021-02-05 13:11:19', '2021-02-05 13:11:19'),
(286, 12, 395, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-ROSAM9WHQAJI', '2021-02-05 13:12:23', '2021-02-05 13:12:23'),
(287, 5, 395, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-ROSAM9WHQAJI', '2021-02-05 13:12:23', '2021-02-05 13:12:23'),
(288, 12, 396, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-HUX9JU8YPMWH', '2021-02-05 13:14:51', '2021-02-05 13:14:51'),
(289, 5, 396, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-HUX9JU8YPMWH', '2021-02-05 13:14:51', '2021-02-05 13:14:51'),
(290, 12, 397, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-TJICID9NXLTZ', '2021-02-05 13:23:55', '2021-02-05 13:23:55'),
(291, 5, 397, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-TJICID9NXLTZ', '2021-02-05 13:23:55', '2021-02-05 13:23:55'),
(292, 12, 398, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-3LOELH1QNTOQ', '2021-02-05 13:27:30', '2021-02-05 13:27:30'),
(293, 5, 398, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-3LOELH1QNTOQ', '2021-02-05 13:27:30', '2021-02-05 13:27:30'),
(294, 12, 399, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-ZEC6YJQPXZD2', '2021-02-05 13:34:45', '2021-02-05 13:34:45'),
(295, 5, 399, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-ZEC6YJQPXZD2', '2021-02-05 13:34:45', '2021-02-05 13:34:45'),
(296, 12, 400, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-WY1S5UCXB1XS', '2021-02-05 15:05:27', '2021-02-05 15:05:27');
INSERT INTO `notificacao` (`id`, `usuario`, `venda`, `texto`, `lida`, `link`, `created_at`, `updated_at`) VALUES
(297, 5, 400, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-WY1S5UCXB1XS', '2021-02-05 15:05:27', '2021-02-05 15:05:27'),
(298, 3, 401, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-VLDY4USW34F0', '2021-02-11 19:14:11', '2021-02-11 19:14:11'),
(299, 12, 401, 'Boleto gerado - PRODUTO TESTE 3 - Sua comissão: R$ 46,80', 0, 'http://localhost/octapay/vendas?venda=PAY-VLDY4USW34F0', '2021-02-11 19:14:11', '2021-02-11 19:14:11'),
(300, 3, 402, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-WX5469B0BR06', '2021-02-11 19:17:39', '2021-02-11 19:17:39'),
(301, 12, 402, 'Boleto gerado - PRODUTO TESTE 3 - Sua comissão: R$ 46,80', 0, 'http://localhost/octapay/vendas?venda=PAY-WX5469B0BR06', '2021-02-11 19:17:39', '2021-02-11 19:17:39'),
(302, 3, 403, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-ZY0KJGJYN1QI', '2021-02-11 19:27:01', '2021-02-11 19:27:01'),
(303, 12, 403, 'Boleto gerado - PRODUTO TESTE 3 - Sua comissão: R$ 46,80', 0, 'http://localhost/octapay/vendas?venda=PAY-ZY0KJGJYN1QI', '2021-02-11 19:27:01', '2021-02-11 19:27:01'),
(304, 3, 404, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-OLHA0HWCHUJJ', '2021-02-11 19:34:37', '2021-02-11 19:34:37'),
(305, 12, 404, 'Boleto gerado - PRODUTO TESTE 3 - Sua comissão: R$ 46,80', 0, 'http://localhost/octapay/vendas?venda=PAY-OLHA0HWCHUJJ', '2021-02-11 19:34:37', '2021-02-11 19:34:37'),
(306, 3, 405, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-FJSG6ITJMA3W', '2021-02-11 19:36:06', '2021-02-11 19:36:06'),
(307, 12, 405, 'Boleto gerado - PRODUTO TESTE 3 - Sua comissão: R$ 46,80', 0, 'http://localhost/octapay/vendas?venda=PAY-FJSG6ITJMA3W', '2021-02-11 19:36:06', '2021-02-11 19:36:06'),
(308, 3, 406, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-QBYWE28C8PNN', '2021-02-11 19:38:59', '2021-02-11 19:38:59'),
(309, 12, 406, 'Boleto gerado - PRODUTO TESTE 3 - Sua comissão: R$ 46,80', 0, 'http://localhost/octapay/vendas?venda=PAY-QBYWE28C8PNN', '2021-02-11 19:38:59', '2021-02-11 19:38:59'),
(310, 3, 407, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-1B5IZNK82HY2', '2021-02-11 19:42:06', '2021-02-11 19:42:06'),
(311, 12, 407, 'Boleto gerado - PRODUTO TESTE 3 - Sua comissão: R$ 46,80', 0, 'http://localhost/octapay/vendas?venda=PAY-1B5IZNK82HY2', '2021-02-11 19:42:06', '2021-02-11 19:42:06'),
(312, 3, 408, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-IUF2R8KU9V7N', '2021-02-15 11:39:56', '2021-02-15 11:39:56'),
(313, 12, 408, 'Boleto gerado - PRODUTO TESTE 3 - Sua comissão: R$ 46,80', 0, 'http://localhost/octapay/vendas?venda=PAY-IUF2R8KU9V7N', '2021-02-15 11:39:56', '2021-02-15 11:39:56'),
(314, 12, 409, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-1SL6JDD58YZ1', '2021-02-15 11:46:39', '2021-02-15 11:46:39'),
(315, 5, 409, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 12,58', 0, 'http://localhost/octapay/vendas?venda=PAY-1SL6JDD58YZ1', '2021-02-15 11:46:39', '2021-02-15 11:46:39'),
(316, 12, 410, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-SRV98X36YZIW', '2021-02-15 11:54:50', '2021-02-15 11:54:50'),
(317, 5, 410, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 12,58', 0, 'http://localhost/octapay/vendas?venda=PAY-SRV98X36YZIW', '2021-02-15 11:54:50', '2021-02-15 11:54:50'),
(318, 12, 411, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-VIVRR5Q7IYMO', '2021-02-23 17:00:23', '2021-02-23 17:00:23'),
(319, 5, 411, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-VIVRR5Q7IYMO', '2021-02-23 17:00:23', '2021-02-23 17:00:23'),
(320, 12, 412, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-CE9NBC30XRFU', '2021-02-23 18:08:00', '2021-02-23 18:08:00'),
(321, 5, 412, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-CE9NBC30XRFU', '2021-02-23 18:08:00', '2021-02-23 18:08:00'),
(322, 12, 413, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-DMTC4XVN4W3T', '2021-02-23 18:11:53', '2021-02-23 18:11:53'),
(323, 5, 413, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-DMTC4XVN4W3T', '2021-02-23 18:11:53', '2021-02-23 18:11:53'),
(324, 12, 414, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-5GS1XO2RMTCT', '2021-02-23 18:15:51', '2021-02-23 18:15:51'),
(325, 5, 414, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-5GS1XO2RMTCT', '2021-02-23 18:15:51', '2021-02-23 18:15:51'),
(326, 12, 415, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-H3JI7SQDOWGK', '2021-02-23 18:18:18', '2021-02-23 18:18:18'),
(327, 5, 415, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-H3JI7SQDOWGK', '2021-02-23 18:18:18', '2021-02-23 18:18:18'),
(328, 12, 416, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-W6HQ7HYUBA5L', '2021-02-23 18:23:01', '2021-02-23 18:23:01'),
(329, 5, 416, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 1,00', 0, 'http://localhost/octapay/vendas?venda=PAY-W6HQ7HYUBA5L', '2021-02-23 18:23:01', '2021-02-23 18:23:01'),
(330, 12, 417, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-JYUAQWLDNJKW', '2021-02-23 18:25:08', '2021-02-23 18:25:08'),
(331, 5, 417, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 1,00', 0, 'http://localhost/octapay/vendas?venda=PAY-JYUAQWLDNJKW', '2021-02-23 18:25:08', '2021-02-23 18:25:08'),
(332, 12, 418, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-WQUD79C1JM2J', '2021-02-23 18:27:05', '2021-02-23 18:27:05'),
(333, 5, 418, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 1,00', 0, 'http://localhost/octapay/vendas?venda=PAY-WQUD79C1JM2J', '2021-02-23 18:27:05', '2021-02-23 18:27:05'),
(334, 12, 419, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-YX0AT5GXFDN8', '2021-02-23 18:29:45', '2021-02-23 18:29:45'),
(335, 5, 419, 'Parabéns! Venda realizada - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 1,00', 0, 'http://localhost/octapay/vendas?venda=PAY-YX0AT5GXFDN8', '2021-02-23 18:29:45', '2021-02-23 18:29:45'),
(336, 12, 420, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-966Z7A4U314I', '2021-02-24 19:22:02', '2021-02-24 19:22:02'),
(337, 5, 420, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-966Z7A4U314I', '2021-02-24 19:22:02', '2021-02-24 19:22:02'),
(338, 12, 421, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-GX7EZ1LUJE5H', '2021-02-25 17:25:43', '2021-02-25 17:25:43'),
(339, 5, 421, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-GX7EZ1LUJE5H', '2021-02-25 17:25:43', '2021-02-25 17:25:43'),
(340, 12, 422, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-EDOE68WXNNDG', '2021-02-25 17:28:04', '2021-02-25 17:28:04'),
(341, 5, 422, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-EDOE68WXNNDG', '2021-02-25 17:28:04', '2021-02-25 17:28:04'),
(342, 12, 423, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-5MRAXOERQ558', '2021-02-25 17:29:19', '2021-02-25 17:29:19'),
(343, 5, 423, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-5MRAXOERQ558', '2021-02-25 17:29:19', '2021-02-25 17:29:19'),
(344, 12, 424, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-S0NPACZ1Y50M', '2021-02-26 19:02:21', '2021-02-26 19:02:21'),
(345, 5, 424, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-S0NPACZ1Y50M', '2021-02-26 19:02:21', '2021-02-26 19:02:21'),
(346, 12, 425, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-YD4ATY6BRZP4', '2021-02-26 19:03:56', '2021-02-26 19:03:56'),
(347, 5, 425, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-YD4ATY6BRZP4', '2021-02-26 19:03:56', '2021-02-26 19:03:56'),
(348, 12, 426, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-SMLBH0N6V1J0', '2021-02-26 19:05:59', '2021-02-26 19:05:59'),
(349, 5, 426, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-SMLBH0N6V1J0', '2021-02-26 19:05:59', '2021-02-26 19:05:59'),
(350, 12, 427, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-CBP4NTD503W5', '2021-02-26 19:09:11', '2021-02-26 19:09:11'),
(351, 5, 427, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2 - Sua comissão: R$ 89,90', 0, 'http://localhost/octapay/vendas?venda=PAY-CBP4NTD503W5', '2021-02-26 19:09:11', '2021-02-26 19:09:11'),
(352, 3, 428, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-CNLM32XRNOGB', '2021-03-01 13:11:32', '2021-03-01 13:11:32'),
(353, 12, 428, 'Boleto gerado - PRODUTO TESTE 3 - Sua comissão: R$ 46,80', 0, 'http://localhost/octapay/vendas?venda=PAY-CNLM32XRNOGB', '2021-03-01 13:11:32', '2021-03-01 13:11:32'),
(354, 3, 429, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-GOCOA8JR4QY6', '2021-03-01 13:27:19', '2021-03-01 13:27:19'),
(355, 12, 429, 'Boleto gerado - PRODUTO TESTE 3 - Sua comissão: R$ 46,80', 0, 'http://localhost/octapay/vendas?venda=PAY-GOCOA8JR4QY6', '2021-03-01 13:27:19', '2021-03-01 13:27:19'),
(356, 3, 430, 'Boleto gerado - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-4TSHTF03PC25', '2021-03-01 13:53:59', '2021-03-01 13:53:59'),
(357, 3, 431, 'Parabéns! Venda realizada - PRODUTO TESTE 3', 0, 'http://localhost/octapay/vendas?venda=PAY-ZM834GZMZK86', '2021-03-01 14:41:50', '2021-03-01 14:41:50'),
(358, 12, 432, 'Boleto gerado - PRODUTO TESTE ATUALIZAçãO2', 0, 'http://localhost/octapay/vendas?venda=PAY-4QU0J4HFWGWX', '2021-03-01 20:51:15', '2021-03-01 20:51:15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes_inteligentes`
--

CREATE TABLE `notificacoes_inteligentes` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `integracao_id` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `notificacoes_inteligentes`
--

INSERT INTO `notificacoes_inteligentes` (`id`, `usuario`, `produto`, `token`, `integracao_id`, `created_at`, `updated_at`) VALUES
(3, 12, NULL, 'etI07OG1xvJJJCSLLb5fWjRM0Ow882RY7pAy1b1h1cZonVEMx3lB0ELyg2X7dwws', '2932', '2021-01-22 14:34:52', '2021-01-25 19:58:44');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissao`
--

CREATE TABLE `permissao` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `permitido` int(11) DEFAULT NULL,
  `ativo` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissaomodulo`
--

CREATE TABLE `permissaomodulo` (
  `id` int(11) NOT NULL,
  `permissao` int(11) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `permitido` int(11) DEFAULT NULL,
  `modulo` varchar(100) DEFAULT NULL,
  `acesso` int(1) DEFAULT NULL,
  `incluir` int(1) DEFAULT NULL,
  `alterar` int(1) DEFAULT NULL,
  `excluir` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pixel`
--

CREATE TABLE `pixel` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `boleto` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `executar_checkout` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `plataforma` varchar(30) DEFAULT NULL,
  `id_pixel` varchar(510) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pixel`
--

INSERT INTO `pixel` (`id`, `codigo`, `usuario`, `nome`, `observacao`, `boleto`, `status`, `executar_checkout`, `valor`, `plataforma`, `id_pixel`, `created_at`, `updated_at`) VALUES
(1, 'HG76', 3, 'TESTE', NULL, 1, 1, 1, NULL, 'Facebook', '0000987675', NULL, NULL),
(4, '417372', 3, 'Pixel 2', NULL, 1, 1, 1, NULL, 'Facebook', '3748394844', '2020-08-21 14:10:52', '2020-08-21 14:40:20'),
(5, '344709', 3, 'Pixel 1', NULL, 0, 1, 0, '9.00', 'Facebook', '3748394844', '2020-08-21 14:21:44', '2020-08-21 14:21:44'),
(6, '986758', 4, 'Pixel 1', NULL, 1, 1, 1, '10.00', 'Facebook', '313255056758337', '2020-08-21 19:19:22', '2020-08-25 13:31:43'),
(7, '386201', 3, 'Pixel teste', NULL, 1, 1, 1, NULL, 'Facebook', '313255056758337', '2020-08-24 15:04:10', '2020-08-24 15:04:10'),
(9, '987844', 12, 'Pixel 2', NULL, 1, 1, 1, NULL, 'Facebook', '1654677854812921,9830573918560,574561515946252,1801207626762049', '2020-11-09 15:48:09', '2020-12-28 14:17:10'),
(10, '315293', 25, 'teste', NULL, 1, 1, 1, NULL, 'Facebook', '3748394844', '2020-12-28 22:05:58', '2021-01-07 20:47:40');

-- --------------------------------------------------------

--
-- Estrutura da tabela `planos`
--

CREATE TABLE `planos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT 1,
  `privado` tinyint(4) DEFAULT 0,
  `descricao` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `planos`
--

INSERT INTO `planos` (`id`, `codigo`, `nome`, `produto`, `usuario`, `quantidade`, `preco`, `status`, `ativo`, `privado`, `descricao`, `created_at`, `updated_at`) VALUES
(1, '89760', 'Kit OctaGen 1', 4, 12, 1, '147.00', 3, 1, 0, 'akljflaslmfçals', '2020-08-05 14:51:33', '2020-12-15 15:08:39'),
(3, '89761', 'Kit OctaGen 2', 4, 12, 2, '147.00', 3, 1, 1, NULL, '2020-08-05 14:51:33', '2020-12-15 15:08:39'),
(4, '89762', 'Kit OctaGen 3', 4, 12, 3, '197.00', 3, 1, 0, '', '2020-08-05 14:51:33', '2020-12-15 15:08:39'),
(5, '967079', 'Kit teste 4', 4, 12, 1, '78.00', 3, 1, 0, 'teste', '2020-08-14 13:31:45', '2020-12-15 15:08:39'),
(6, '681301', 'Kit teste 5', 4, 12, 1, '190.00', 3, 1, 1, NULL, '2020-08-14 13:34:47', '2020-12-15 15:08:39'),
(8, '397904', 'plano 1 blend', 5, 12, 1, '197.00', 2, 1, 0, '', '2020-11-10 14:09:09', '2020-11-10 20:37:23'),
(9, '556297', 'Pedro Henrique da Silva', 4, 12, 1, '245.00', 3, 1, 0, '', '2020-11-11 22:02:12', '2020-12-15 15:08:39'),
(10, '655140', 'Plano 1', 1, 12, 1, '3700.00', 2, 1, 0, '', '2020-11-16 14:19:26', '2021-02-23 18:20:11'),
(11, '314251', 'Pedro Henrique da Silva', 1, 12, 0, '0.00', 2, 0, 0, '', '2020-12-23 20:37:48', '2020-12-23 20:37:48'),
(12, '468881', 'Pedro Henrique da Silva', 1, 12, 1, '78.00', 2, 0, 0, '', '2020-12-23 20:42:14', '2020-12-23 20:42:14'),
(13, '59845', 'Plano Blend 2', 5, 12, 2, '297.00', 2, 1, 0, '', '2021-01-13 20:45:51', '2021-01-13 20:45:51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `postback`
--

CREATE TABLE `postback` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `eventos` varchar(300) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `chave_unica` varchar(100) DEFAULT NULL,
  `json` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `postback`
--

INSERT INTO `postback` (`id`, `usuario`, `produto`, `url`, `eventos`, `status`, `chave_unica`, `json`, `created_at`, `updated_at`) VALUES
(5, 12, 1, 'http://localhost/octapay/postback.php', '1,2,3,4,5,6,7,8,9,10', 1, '1e196bc392e079db933deb3f7095f937', 1, '2021-01-15 14:26:50', '2021-02-19 13:47:32'),
(6, 12, 1, 'https://painel.formulas10.com.br/inc/postback_octapa', '1,2,3,4,5,6,7,8,9,10', 1, '1e196bc392e079db933deb3f7095f937', 0, '2021-02-15 20:54:41', '2021-02-24 12:48:28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `rascunho` int(11) DEFAULT 0,
  `nome` varchar(50) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL,
  `subcategoria` int(11) DEFAULT NULL,
  `tipo_produto` int(11) DEFAULT NULL,
  `tipo_cobranca` int(11) DEFAULT NULL,
  `tipo_precificacao` int(11) DEFAULT NULL,
  `rockets` decimal(2,1) DEFAULT 0.0,
  `preco` decimal(10,2) DEFAULT NULL,
  `preco_alteravel` decimal(10,2) DEFAULT NULL,
  `termos` text DEFAULT NULL,
  `aceite_termos` int(11) DEFAULT NULL,
  `email_suporte` varchar(200) DEFAULT NULL,
  `whatsapp_checkout` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `frete_fixo` decimal(10,2) DEFAULT NULL,
  `pagina_venda` varchar(200) DEFAULT NULL,
  `url_midias` varchar(300) DEFAULT NULL,
  `foto` varchar(300) DEFAULT NULL,
  `taxa_juros` decimal(10,2) DEFAULT NULL,
  `parcelas` int(11) DEFAULT NULL,
  `obrigado_boleto` varchar(300) DEFAULT NULL,
  `obrigado_cartao` varchar(300) DEFAULT NULL,
  `obrigado_analise` varchar(300) DEFAULT NULL,
  `garantia` int(11) DEFAULT NULL,
  `disponivel` int(11) DEFAULT NULL,
  `quantidade_max` int(11) DEFAULT NULL,
  `documentos` varchar(300) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `descricao_afiliados` text DEFAULT NULL,
  `abrir_afiliacao` int(11) DEFAULT NULL,
  `afiliados_aprovacao` int(11) DEFAULT NULL,
  `visualizacao` int(11) DEFAULT NULL,
  `libera_comprador` int(11) DEFAULT NULL,
  `tempo_cookie` int(11) DEFAULT NULL,
  `tipo_comissao` int(11) DEFAULT NULL,
  `comissao_afiliado` decimal(10,2) DEFAULT NULL,
  `tipo_atribuicao` int(11) DEFAULT NULL,
  `usuario_ultima_alteracao` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `st4rt` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `codigo`, `rascunho`, `nome`, `usuario`, `descricao`, `categoria`, `subcategoria`, `tipo_produto`, `tipo_cobranca`, `tipo_precificacao`, `rockets`, `preco`, `preco_alteravel`, `termos`, `aceite_termos`, `email_suporte`, `whatsapp_checkout`, `status`, `frete_fixo`, `pagina_venda`, `url_midias`, `foto`, `taxa_juros`, `parcelas`, `obrigado_boleto`, `obrigado_cartao`, `obrigado_analise`, `garantia`, `disponivel`, `quantidade_max`, `documentos`, `observacao`, `descricao_afiliados`, `abrir_afiliacao`, `afiliados_aprovacao`, `visualizacao`, `libera_comprador`, `tempo_cookie`, `tipo_comissao`, `comissao_afiliado`, `tipo_atribuicao`, `usuario_ultima_alteracao`, `created_at`, `updated_at`, `st4rt`) VALUES
(1, '12345', 0, 'Produto Teste Atualização2', 12, 'teste', 1, 2, 4, NULL, NULL, '1.9', '264.42', NULL, NULL, 0, 'pedro@octa.life', '5533999102490', 2, NULL, NULL, 'sfafsdf', '2732a2adec2b599cdefc04b26f05a355.png', NULL, NULL, 'afafasf', 'adfafa', 'sdfghsdf', 30, NULL, NULL, '58ceb47c974dd18cff9ec4a99539e40b.zip', '\r\n                    ', '', 1, 1, 1, 1, 10, 0, '20.00', 2, NULL, NULL, '2021-02-02 12:18:59', NULL),
(2, '12346', 0, 'Produto Teste 1', 3, 'Artigos\r\nPHP\r\nListando arquivos de pastas com PHP\r\n\r\nNesse artigo veremos como listar o nome dos arquivos de diretórios utilizando php.\r\n\r\nAlém de listar o nome dos arquivos, criaremos um link para o mesmo.\r\n\r\nPara começar, crie uma pasta com o nome sugestivo &#34;arquivos&#34;, e coloque destro desta pasta alguns arquivos (imagens, musicas, documentos, etc).\r\n', 4, NULL, 4, 1, 1, '1.8', '245.00', NULL, 'Artigos\r\nPHP\r\nListando arquivos de pastas com PHP\r\n\r\nNesse artigo veremos como listar o nome dos arquivos de diretórios utilizando php.\r\n\r\nAlém de listar o nome dos arquivos, criaremos um link para o mesmo.\r\n\r\nPara começar, crie uma pasta com o nome sugestivo &#34;arquivos&#34;, e coloque destro desta pasta alguns arquivos (imagens, musicas, documentos, etc).', 0, 'pedrohenriquedasilva100@yahoo.com.br', NULL, 4, NULL, 'https://octagen.com.br/', 'sfafsdf', 'a8197f3ac98c857278a06c23b7a557bb.png', NULL, NULL, 'afafasf', 'adfafa', 'sdfghsdf', 30, 1, 13, 'e5792aa4e0a20bd964a6539db3c038f9.pdf', 'Tentativas: \r\nOperador: \r\nMotivo: \r\nÚltimo motivo: ', NULL, 1, 1, 1, 1, 30, 0, '21.00', 2, NULL, '2020-08-03 15:09:28', '2021-01-29 12:06:05', 1),
(3, '12347', 0, 'Produto Teste 3', 3, 'A common use of JSON is to exchange data to/from a web server.\r\n\r\nWhen receiving data from a web server, the data is always a string.\r\n\r\nParse the data with JSON.parse(), and the data becomes a JavaScript object.', 5, NULL, 4, 1, 1, '1.3', '234.00', NULL, 'A common use of JSON is to exchange data to/from a web server.\r\n\r\nWhen receiving data from a web server, the data is always a string.\r\n\r\nParse the data with JSON.parse(), and the data becomes a JavaScript object.', 0, 'pedro@octa.life', NULL, 2, NULL, 'https://phytophen.com.br/', 'sfafsdf', '13c00fe5f8255d1440ead49408f6e22e.png', NULL, NULL, 'afafasf', 'adfafa', 'sdfghsdf', 30, 1, 12, '4bda5b26380740ff55998ba5ef0d53e9.png', NULL, NULL, 1, 0, 1, 0, 30, 0, '20.00', 1, NULL, '2020-08-03 19:06:58', '2021-01-29 12:06:05', 0),
(4, '12348', 0, 'Produto Teste 4', 12, '    Pressione as teclas Windows+R.\r\n    Digite netplwiz clique em OK.\r\n    Em Contas de usuário, selecione o usuário e clique em Propriedades;\r\n    Na guia geral, altere o nome que é apresentado no campo Nome de usuário.\r\n    Clique em Aplicar, OK.\r\n    Reinicie o sistema.', 10, NULL, 11, NULL, NULL, '2.0', '245.00', NULL, NULL, 1, 'pedro@octa.life', NULL, 3, NULL, NULL, 'sfsvsdfgas', 'b86f843d3ff5672a88018d1674acf0af.png', NULL, NULL, 'https://phytophen.com.br/obrigado_boleto.html', 'https://phytophen.com.br/obrigado_cartao.html', 'https://phytophen.com.br/obrigado_boleto.html', 30, NULL, NULL, '4d5d715d15c9f911d37e121b90945210.jpg', 'Tentativas: \r\nOperador: \r\nMotivo: \r\nÚltimo motivo: ', NULL, 1, 1, 1, 0, 30, 1, '34.00', 2, NULL, '2020-08-04 01:51:53', '2021-01-29 12:06:05', NULL),
(5, '12349', 0, 'Blend Berry', 12, 'Emagrecedor', 44, NULL, 8, NULL, NULL, '0.0', '30.00', NULL, NULL, 1, 'pedro@octa.life', '', 2, NULL, NULL, 'https://st4rt.com.br/painel/login', '345012ded3cd9a648644dfacac92ef88.png', NULL, NULL, 'https://st4rt.com.br/painel/login', 'https://st4rt.com.br/painel/login', 'https://st4rt.com.br/painel/login', 30, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-23 12:52:25', '2021-01-29 12:06:05', NULL),
(6, '12350', 0, 'Phytophen', 4, 'Emagrecedor', 44, NULL, 8, NULL, NULL, '3.0', '97.00', NULL, NULL, 1, 'pedro@octa.life', NULL, 2, NULL, NULL, '', 'b99598913393a1dd9ab2963c7dfd2974.png', NULL, NULL, 'https://st4rt.com.br/painel/login', 'https://st4rt.com.br/painel/login', 'https://st4rt.com.br/painel/login', 30, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, '2020-10-23 13:02:05', '2021-01-04 19:58:53', NULL),
(7, '12351', 0, 'Capelli', 12, 'TRATAMENTO INOVADOR E\r\nREVOLUCIONÁRIO\r\nPARA SEU FIOS\r\n\r\n    Reduz queda excessiva em até 99%*\r\n    Estimula a produção de queratina*\r\n    Fortalece os fios ativando o bulbo capilar*\r\n    Acelera em até 5x os fios de cabelos, cílios e sobrancelhas*\r\n    Ação anti-quebras para unhas e cabelos*\r\n    Multivitamínico indicado para tratamentos pós-química e transição*', 17, NULL, 1, NULL, NULL, '0.0', '197.00', NULL, 'TRATAMENTO INOVADOR E\r\nREVOLUCIONÁRIO\r\nPARA SEU FIOS\r\n\r\n    Reduz queda excessiva em até 99%*\r\n    Estimula a produção de queratina*\r\n    Fortalece os fios ativando o bulbo capilar*\r\n    Acelera em até 5x os fios de cabelos, cílios e sobrancelhas*\r\n    Ação anti-quebras para unhas e cabelos*\r\n    Multivitamínico indicado para tratamentos pós-química e transição*', NULL, 'pedro@octa.life', NULL, 2, NULL, NULL, 'https://st4rt.com.br/painel/login', '3d33cf377dd838343bc2d1ccc22ac0f2.png', NULL, NULL, 'https://st4rt.com.br/painel/login', 'https://st4rt.com.br/painel/login', 'https://st4rt.com.br/painel/login', 30, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-12 17:58:04', '2020-11-13 18:48:30', 0),
(8, '12352', 0, 'Plano 1', 12, 'f', 17, NULL, 8, NULL, NULL, '0.0', '195.50', NULL, NULL, NULL, 'sac@octa.life1', NULL, 2, NULL, NULL, '', 'c26aee6bfa5fed148ab193c03c916486.png', NULL, NULL, 'http://biotyn.com.br/obrigado-boleto', 'http://biotyn.com.br/obrigado-cartao', 'http://biotyn.com.br/obrigado-boleto', 30, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, '2021-01-04 18:56:05', '2021-01-04 19:06:22', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `recuperar_senha`
--

CREATE TABLE `recuperar_senha` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `codigo_recuperacao` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `recuperar_senha`
--

INSERT INTO `recuperar_senha` (`id`, `codigo`, `usuario`, `codigo_recuperacao`, `created_at`, `updated_at`) VALUES
(3, '1', 12, '1', '2020-10-28 13:17:51', '2020-10-28 13:17:51'),
(4, '374A', 5, '14A54D5D', '2020-10-28 17:24:51', '2020-10-28 17:24:51'),
(5, '4A62', 5, 'D9874257', '2020-10-28 17:36:25', '2020-10-28 17:36:25'),
(6, '23F5', 12, 'E2270787', '2020-12-14 17:44:57', '2020-12-14 17:44:57'),
(7, '6541', 12, '740C2449', '2020-12-14 17:45:35', '2020-12-14 17:45:35'),
(8, 'A6E0', 12, 'B112608C', '2020-12-14 17:47:21', '2020-12-14 17:47:21'),
(9, '3BAF', 3, '0999DD61', '2020-12-28 21:56:54', '2020-12-28 21:56:54'),
(11, '1663', 3, '979DE98F', '2020-12-28 19:05:01', '2020-12-28 19:05:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `saldo`
--

CREATE TABLE `saldo` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `saldo`
--

INSERT INTO `saldo` (`id`, `usuario`, `valor`) VALUES
(1, 1, '4527.56'),
(2, 12, '20296.60'),
(3, 4, '360.42'),
(4, 3, '3127.68'),
(5, 5, '966.80');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessao`
--

CREATE TABLE `sessao` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `sessao` varchar(100) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sessao`
--

INSERT INTO `sessao` (`id`, `usuario`, `sessao`, `expiration_date`, `ip`, `created_at`, `updated_at`) VALUES
(1, 12, '$2y$10$VsMbHLIRd2.lkE1QZjXxDOjo5YFdss2G8NTQdGj7hVmvdrl9u5tWy', '2021-01-26 23:53:13', '127.0.0.1', '2021-01-26 20:53:13', '2021-01-26 20:53:13'),
(2, 12, '$2y$10$sD.Ma4EUIp.jE3xmjqLsuOUJiOIm9dHBktEEdXFmUwgZapg1.mrLe', '2021-01-27 14:12:13', '127.0.0.1', '2021-01-27 11:12:13', '2021-01-27 11:12:13'),
(3, 12, '$2y$10$371IHXhG1ccPrtbsXqO4cevnIn80dN0uqV4Mbml/1rYvI6hPC9SAW', '2021-01-27 22:11:35', '127.0.0.1', '2021-01-27 19:11:35', '2021-01-27 19:11:35'),
(4, 12, '$2y$10$ztCgZKaMdvdZsihqL/oRveliKyPGR.wr6uRs98B0MmupP7ZAjtEC.', '2021-01-28 14:13:49', '127.0.0.1', '2021-01-28 11:13:49', '2021-01-28 11:13:49'),
(5, 1, '$2y$10$lJtrCHgw6JIkKX1hnHsf8OGmC3DZh97tpUiO1NIx9ZNhnAAeGuOYe', '2021-01-28 20:23:48', '127.0.0.1', '2021-01-28 17:23:48', '2021-01-28 17:23:48'),
(6, 12, '$2y$10$qIZhFBVN1AvElD6iwQmxiuJfXSzURPytyDHPqNbWjkffWgZP0J1aK', '2021-01-28 20:23:56', '127.0.0.1', '2021-01-28 17:23:56', '2021-01-28 17:23:56'),
(7, 12, '$2y$10$8bu1nyQDwFAJMCF3mGqIne1nfwtgRp/6gWNYRxb/V8E0bWzav1p5.', '2021-01-29 14:15:29', '127.0.0.1', '2021-01-29 11:15:30', '2021-01-29 11:15:30'),
(8, 5, '$2y$10$20tJbqB4DUGWbJmyMXikW.hmCtWemeswfTf1HvUDaLe6R27TH9t5O', '2021-01-29 16:34:04', '127.0.0.1', '2021-01-29 13:34:04', '2021-01-29 13:34:04'),
(9, 12, '$2y$10$ZIWBAn16IWpUEyvnQwhQVOv7I6nbHkxjOxgkDT3CDnYButmAXorNq', '2021-01-29 16:34:20', '127.0.0.1', '2021-01-29 13:34:20', '2021-01-29 13:34:20'),
(10, 12, '$2y$10$JsHrnAxaB18VdbDhhQLXW.SkNfQTkAOBvQf6RUrvnH/ctSt7hoIjO', '2021-01-29 16:35:16', '127.0.0.1', '2021-01-29 13:35:16', '2021-01-29 13:35:16'),
(11, 5, '$2y$10$zsLFWOo1LlVaN4zaLRGO7uXZVFMs8iV1TabTkG.BTgZCb4u1ySaAG', '2021-01-29 16:35:23', '127.0.0.1', '2021-01-29 13:35:23', '2021-01-29 13:35:23'),
(12, 12, '$2y$10$PgXThkGWvY7KqmdyDAwC2eRZPE.oKvAfT47MBlB3gwUNKcUMJuoh2', '2021-02-01 14:32:30', '127.0.0.1', '2021-02-01 11:32:30', '2021-02-01 11:32:30'),
(13, 12, '$2y$10$05Jn4ZbA57JgPpJlmLSDNuRX8LhCb0uPpY7VJTWGSJrC/Rodhkr9G', '2021-02-02 14:19:29', '127.0.0.1', '2021-02-02 11:19:29', '2021-02-02 11:19:29'),
(14, 12, '$2y$10$4NwC3C1znaZIneUo/01b3OY/Th/luWJJkYVIdP7zTDA16s.IJPDy2', '2021-02-02 20:21:55', '127.0.0.1', '2021-02-02 17:21:55', '2021-02-02 17:21:55'),
(15, 12, '$2y$10$12sma83XzrjAmzBkCHLKrOdBx9aMm.ptrUh0T62x6K1UuUOU921um', '2021-02-03 14:17:34', '127.0.0.1', '2021-02-03 11:17:34', '2021-02-03 11:17:34'),
(16, 12, '$2y$10$ZrTX0uv9Gz/XJ8NKZicDQ.Ysp2oVi.EYxGtixCjhh/BeteFinDT82', '2021-02-03 20:39:54', '127.0.0.1', '2021-02-03 17:39:54', '2021-02-03 17:39:54'),
(17, 12, '$2y$10$2o/trjs6EIKKQA7IFlBYl.crxzJx96iOU5tYmIgw0ZYW6lVcyo/2S', '2021-02-04 14:49:36', '127.0.0.1', '2021-02-04 11:49:37', '2021-02-04 11:49:37'),
(18, 12, '$2y$10$V7kzOj45T6zu6Z4JLKhToe1Utf6XUXx3V7zU77F2KUfIYAZejmLri', '2021-02-04 20:49:57', '127.0.0.1', '2021-02-04 17:49:57', '2021-02-04 17:49:57'),
(19, 12, '$2y$10$ePraspBpgfEpCFA02WoBoOjD0bYwRZ2xtCYfdOyv/hvK7ioDiwph.', '2021-02-05 14:15:28', '127.0.0.1', '2021-02-05 11:15:29', '2021-02-05 11:15:29'),
(20, 5, '$2y$10$B6dVbqCdzsVtOdzc8go0DeNDas0adgOY15AVCfEG505deZdWs7zyi', '2021-02-05 17:30:26', '127.0.0.1', '2021-02-05 14:30:26', '2021-02-05 14:30:26'),
(21, 12, '$2y$10$5PsW9WYTB7zWutznnQs.he3ZccL7lEBEn1KZDDg1J7rW05XBxX2Be', '2021-02-05 17:50:29', '127.0.0.1', '2021-02-05 14:50:29', '2021-02-05 14:50:29'),
(22, 12, '$2y$10$vQcGz/Vzgg1Cs76I18D.uepfmclvnS3gzsktzlcL2ZbZRTwimi0Ce', '2021-02-09 16:27:13', '127.0.0.1', '2021-02-09 13:27:13', '2021-02-09 13:27:13'),
(23, 12, '$2y$10$b7X6GJgSTSiTJCReap.r7.OfS.qzJB9ocZytx2/Y4z8B09oh/yR0K', '2021-02-10 00:00:46', '127.0.0.1', '2021-02-09 21:00:46', '2021-02-09 21:00:46'),
(24, 12, '$2y$10$mrDvRH1e9HGsV879KlEOsekL/jCSAViFGGVprc.q6yEXSWZmnB0te', '2021-02-10 21:36:43', '127.0.0.1', '2021-02-10 18:36:43', '2021-02-10 18:36:43'),
(25, 12, '$2y$10$y5RclfwR8eOrenxeJ6flc.MJCi8W1IHnE/7qaNSaGlu7nmSDrUwiy', '2021-02-11 15:35:54', '127.0.0.1', '2021-02-11 12:35:54', '2021-02-11 12:35:54'),
(26, 12, '$2y$10$gzJ2ClOXiNmPloWVbA/HmuMtFMe3usz5hFFRuRUC3Tv19HWWuNd9u', '2021-02-11 22:13:00', '127.0.0.1', '2021-02-11 19:13:00', '2021-02-11 19:13:00'),
(27, 12, '$2y$10$8Vaj1rl0hSh2WIOiIvHGMOnk5IMY.rvDBlqNrLcOG5alI.VXvdn/u', '2021-02-12 17:47:21', '127.0.0.1', '2021-02-12 14:47:21', '2021-02-12 14:47:21'),
(28, 12, '$2y$10$Jv/Mgk3KeFK1x..05s0qmekbnIMQSawf6L6x7MXc/PxP5zPRtzeb2', '2021-02-15 14:28:36', '127.0.0.1', '2021-02-15 11:28:36', '2021-02-15 11:28:36'),
(29, 12, '$2y$10$GL5PRoJ..1T8029MpR/w..8mGbua6BQvcpc90rX/8zKJ.GK9ydDtS', '2021-02-15 23:54:28', '127.0.0.1', '2021-02-15 20:54:28', '2021-02-15 20:54:28'),
(30, 12, '$2y$10$xBxJZehWigOFF82iI/4SCeRxbiWAkFvUeUJqMb8cBeV03QTUqCk/q', '2021-02-17 14:23:09', '127.0.0.1', '2021-02-17 11:23:09', '2021-02-17 11:23:09'),
(31, 12, '$2y$10$4nBOo3yU9QirgGVMywzOYeD7JBVxiAvnuljv6IPDOJhRf4vTZQlka', '2021-02-17 22:19:14', '127.0.0.1', '2021-02-17 19:19:14', '2021-02-17 19:19:14'),
(32, 12, '$2y$10$qrf7c7GqPZDD/.Bxes8OK.gaZAzLPKOPzBzj1BIzt902Jg0IL.RAi', '2021-02-18 14:21:23', '127.0.0.1', '2021-02-18 11:21:23', '2021-02-18 11:21:23'),
(33, 12, '$2y$10$7m8c8jp7A/q3DMsxqvr5jungBXexMtSlvq31lYZGwP1DmfM50GDFm', '2021-02-19 16:33:37', '127.0.0.1', '2021-02-19 13:33:37', '2021-02-19 13:33:37'),
(34, 12, '$2y$10$Y/my6gXHc9P2MYrz5A44PuIglPCVT.1mP21oS4XExl/ZpqSufCP2S', '2021-02-22 14:16:07', '127.0.0.1', '2021-02-22 11:16:07', '2021-02-22 11:16:07'),
(35, 12, '$2y$10$COWDMfUFUAbAaj4VWLJu..EqY9ElUTm1qdo7p4BLv9ueqsMKdw2ha', '2021-02-22 16:12:06', '127.0.0.1', '2021-02-22 13:12:06', '2021-02-22 13:12:06'),
(36, 12, '$2y$10$6AX2xk8o1K3CpbbkQbvh7evUGawTKAV3vx/DWnc/XIPodRrCCC3L2', '2021-02-22 23:41:43', '127.0.0.1', '2021-02-22 20:41:43', '2021-02-22 20:41:43'),
(37, 12, '$2y$10$VM8MYWYwjxXlNJNuYeUA2OPLaA1I7ZLXcBwuSV0mfvEaOYb7z6RFe', '2021-02-23 14:19:39', '127.0.0.1', '2021-02-23 11:19:39', '2021-02-23 11:19:39'),
(38, 12, '$2y$10$LlYpPiU13O2toSXTXDPXxO7a9hNoJf/UMpRx2q3L42PmtUxf/aT3q', '2021-02-23 21:07:08', '127.0.0.1', '2021-02-23 18:07:08', '2021-02-23 18:07:08'),
(39, 12, '$2y$10$QD.r/bsoqDDsdBKtAtjVLO.rTLb6K5JdDu7orPjwutn5NjqQEVNeC', '2021-02-24 14:18:41', '127.0.0.1', '2021-02-24 11:18:41', '2021-02-24 11:18:41'),
(40, 12, '$2y$10$OqDUH5Niw1trL4hwQ5EE.ukje9nQ9Hcr3HlF9VDnydS1NI1u4hL2O', '2021-02-24 17:53:12', '127.0.0.1', '2021-02-24 14:53:12', '2021-02-24 14:53:12'),
(41, 12, '$2y$10$8Yks3yFHKDQRf3akjXo.d.JHoQW3BYYy1CU0h8rihaff4HzRXBiVe', '2021-02-24 23:59:32', '127.0.0.1', '2021-02-24 20:59:32', '2021-02-24 20:59:32'),
(42, 12, '$2y$10$YG5xRMYNmMmx//8gqthh5u/FEyZPAVQq537fsXq6A67vfo5wKoNdS', '2021-02-25 14:13:29', '127.0.0.1', '2021-02-25 11:13:29', '2021-02-25 11:13:29'),
(43, 12, '$2y$10$c6nwJAKQGD2ixPPhXcDyLujonY/HUH8tE332.QZW7o.OEfcIAnpXC', '2021-02-25 16:10:09', '127.0.0.1', '2021-02-25 13:10:09', '2021-02-25 13:10:09'),
(44, 12, '$2y$10$YkRs2MIxZOYBH/0UuTIuz.wdMWtJ6KGXb8OH3iA7ofhvP20M4YWE2', '2021-02-25 23:12:54', '127.0.0.1', '2021-02-25 20:12:54', '2021-02-25 20:12:54'),
(45, 12, '$2y$10$/2Upv99xPzE4g/AMONMr2etDox.b5nawn965sANBHiv.JD5/Os8Ja', '2021-02-26 15:45:44', '127.0.0.1', '2021-02-26 12:45:44', '2021-02-26 12:45:44'),
(46, 12, '$2y$10$4pDWBJ9PP/9HTMrTMvuO8OeKfK7mXak6V/WLy0jM8n.oAamcyjPIi', '2021-03-08 09:32:25', '127.0.0.1', '2021-03-01 12:32:25', '2021-03-01 12:32:25'),
(47, 12, '$2y$10$GCEmCSostmR2jPAgmTvxxOqf//81/dNgyV2P/w6SY3RkaDECUjwSa', '2021-03-02 16:23:08', '127.0.0.1', '2021-03-02 13:23:08', '2021-03-02 13:23:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `taxas`
--

CREATE TABLE `taxas` (
  `id` int(11) NOT NULL,
  `parcelamento` decimal(6,4) DEFAULT NULL,
  `saque` decimal(5,2) DEFAULT NULL,
  `taxa_octapay` decimal(5,2) DEFAULT NULL,
  `valor_transacao` decimal(5,2) DEFAULT NULL,
  `taxa_iniciante` decimal(5,2) DEFAULT NULL,
  `vendas_iniciante` int(11) DEFAULT NULL,
  `dias_iniciante` int(11) DEFAULT NULL,
  `taxa_bronze` decimal(5,2) DEFAULT NULL,
  `vendas_bronze` int(11) DEFAULT NULL,
  `dias_bronze` int(11) DEFAULT NULL,
  `taxa_prata` decimal(5,2) DEFAULT NULL,
  `vendas_prata` int(11) DEFAULT NULL,
  `dias_prata` int(11) DEFAULT NULL,
  `taxa_ouro` decimal(5,2) DEFAULT NULL,
  `vendas_ouro` int(11) DEFAULT NULL,
  `dias_ouro` int(11) DEFAULT NULL,
  `usuario_ultima_alteracao` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `taxas`
--

INSERT INTO `taxas` (`id`, `parcelamento`, `saque`, `taxa_octapay`, `valor_transacao`, `taxa_iniciante`, `vendas_iniciante`, `dias_iniciante`, `taxa_bronze`, `vendas_bronze`, `dias_bronze`, `taxa_prata`, `vendas_prata`, `dias_prata`, `taxa_ouro`, `vendas_ouro`, `dias_ouro`, `usuario_ultima_alteracao`, `created_at`, `updated_at`) VALUES
(1, '0.0299', NULL, '6.99', '1.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, '2020-10-14 19:55:27', '2021-01-19 15:56:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `urls`
--

CREATE TABLE `urls` (
  `id` int(11) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `privada` tinyint(4) DEFAULT NULL,
  `pv` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `urls`
--

INSERT INTO `urls` (`id`, `descricao`, `url`, `usuario`, `produto`, `privada`, `pv`, `created_at`, `updated_at`) VALUES
(2, 'ADV', 'http://localhost/octapay/produtos/urls/1', 12, 1, 0, 1, '2020-10-22 14:36:22', '2020-12-21 21:12:52'),
(3, 'Página de venda', 'https://st4rt.com.br/painel/login', 12, 5, 0, 0, '2020-10-23 12:52:25', '2020-10-23 12:52:25'),
(4, 'Página de venda', 'https://st4rt.com.br/painel/login', 4, 6, 0, 0, '2020-10-23 13:02:05', '2020-10-23 13:02:05'),
(5, 'Página de Vendas', 'https://octagen.com.br/', 3, 2, 0, 1, '2020-11-03 12:41:15', '2020-11-03 12:41:15'),
(6, 'ADV', 'https://capelli-oficial.com/', 3, 2, 0, 0, '2020-11-03 13:51:19', '2020-11-03 13:51:19'),
(8, 'link 1', 'https://remotomobds1.websiteseguro.com/octapay/painel.php', 12, 4, 1, 0, '2020-11-11 20:04:55', '2020-11-24 19:42:53'),
(9, 'Página de venda', 'https://st4rt.com.br/painel/login', 12, 7, 0, 0, '2020-11-12 17:58:04', '2020-11-12 17:58:04'),
(10, 'Página de vendas', 'https://qastack.com.br/', 12, 4, 0, 1, '2020-11-23 18:17:40', '2020-11-23 18:17:40'),
(11, 'Octagen 2', 'http://localhost/octapay/produtos/urls/1', 12, 1, 0, 0, '2020-12-21 21:15:40', '2020-12-21 21:15:40'),
(13, 'Página de venda', 'https://blendberrycaps.com/', 12, 8, 0, 1, '2021-01-04 18:56:05', '2021-01-04 18:56:05'),
(14, 'Plano 2 Blend', 'https://biotyn.com.br/segredo-da-reativacao/', 12, 1, 0, 0, '2021-01-07 20:01:52', '2021-01-07 20:01:52');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario_dados` int(11) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `nome_abreviado` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `tipo_usuario` int(1) DEFAULT NULL,
  `ativo` int(1) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `taxa_saque` decimal(10,2) DEFAULT NULL,
  `taxa_octapay` decimal(5,2) DEFAULT NULL,
  `tempo_saque` varchar(2) DEFAULT NULL,
  `grupo` tinyint(4) DEFAULT NULL,
  `foto` varchar(64) DEFAULT NULL,
  `user_google` varchar(100) DEFAULT NULL,
  `facebook` varchar(300) DEFAULT NULL,
  `pid_facebook` varchar(140) DEFAULT NULL,
  `pid_google` varchar(140) DEFAULT NULL,
  `sexo` varchar(2) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `tema` varchar(30) DEFAULT 'tema1',
  `cliente_st4rt` tinyint(4) DEFAULT 0,
  `chave_unica` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `usuario_dados`, `nome`, `nome_abreviado`, `email`, `login`, `senha`, `tipo_usuario`, `ativo`, `status`, `taxa_saque`, `taxa_octapay`, `tempo_saque`, `grupo`, `foto`, `user_google`, `facebook`, `pid_facebook`, `pid_google`, `sexo`, `celular`, `observacao`, `tema`, `cliente_st4rt`, `chave_unica`, `created_at`, `updated_at`) VALUES
(1, 37, 'OctaPay Master', 'OctaPay', 'master@octapay.com.br', 'master', '$2y$10$JzWgLvX4jIITVNJ9iww9S.mQihTa2.Bx7sMNxk9crCG1pM494f0tK', 1, 1, 1, NULL, '6.50', '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 1, 'bcf910e25ab9354034e8f499b48ff23b', '2020-10-21 13:53:52', '2021-01-26 12:47:56'),
(2, NULL, 'Pedro ADM 2', 'Pedro', 'pedro@octa.life2', 'pedro2', '$2y$10$A7d6i0CJsxOvA8/FdZXJmux.6U.sD7ivIoLMZM13fD/3R2ULBJmwC', 1, 1, 1, '6.50', '7.50', '30', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, 'a49482a76fb6ff1ae1714f2ccba9dab3', '2020-07-30 20:08:54', '2021-01-26 12:48:03'),
(3, 2, 'Pedro Henrique da Silva', 'Pedro', 'pedro@pedro', 'teste2', '$2y$10$4zf9HJFtrv8blYgjPDs6meJeg87J5KdqYI3HfhgPfrmY5PaFwssC.', 3, 1, 1, '7.55', '7.50', '7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '1e196bc392e079db933deb3f7095f937', '2020-07-30 20:10:00', '2021-01-26 12:48:12'),
(4, 7, 'Teste 3', 'Teste3', 'test3@teste', 'teste3', '$2y$10$xWj40IGoedisI8JH7ZqtFeSkb3SZiaKXpfsEywFN8XlZ2y35LUK.K', 4, 1, 1, '7.50', '7.50', '15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, 'aa3c6e9957db4f0a47fedce908e6a73d', '2020-08-10 20:42:50', '2021-01-26 12:48:22'),
(5, 4, 'Pedro Henrique da Silva', 'Pedro', 'jilo_123@outlook.com', 'pedro345', '$2y$10$61TqORmfMo8Cf/mgDvYF6.73pa2qSXGpsbuvNybhvShJI999yVwau', 5, 1, 1, '7.50', '7.50', '20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 1, '1e196bc392e079db933deb3f7095f937', '2020-08-25 18:03:11', '2021-01-26 20:44:09'),
(6, 10, 'Comprador Teste 2', 'Comprador', 'teste@teste.com', 'teste.com', '$2y$10$./2LZLoeP1nF9IAVFwti.uH1E2WGeXnRdiAwPxXdpFqyXBbpZT6f6', 5, 1, 1, '7.50', '7.50', '20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '8f4145e1b24f002ae3bd538fbdedc889', '2020-10-13 15:09:30', '2021-01-26 12:48:37'),
(7, 9, 'Comprador Teste', 'Comprador', 'teste@teste.com2', '1234', '$2y$10$atOFMbvp2l6xwlaiAxWWd.nXs/eOgBt0P26W6c3hWTbrWwpJq9eQK', 5, 1, 1, '7.50', '7.50', '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '7dcae5c17b87ac2010b353f8daed86cc', '2020-10-13 15:13:38', '2021-01-26 12:48:44'),
(8, 21, 'Pedro Henrique da Silva', 'Pedro', 'pedro@octa.life3', 'pedro3', '$2y$10$5Mjwo5Xfw3rtSpctH/.uoOLN8hWbZFnvgQ8c4ZBaulnXIz0K4OJh6', 5, 1, 1, '7.50', '7.50', '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '1e196bc392e079db933deb3f7095f937', '2020-10-13 16:47:12', '2021-01-12 12:27:01'),
(9, 27, 'Pedro Henrique da Silva', 'Pedro', 'pedro@octa.life4', 'pedro4', '$2y$10$XWZwLHzN/zDdICFX9MGUY.KvcVfiYoGKdhOFLBzcpG2u6WS2wHkY2', 5, 1, 0, '7.50', '7.50', '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '1e196bc392e079db933deb3f7095f937', '2020-10-13 17:39:14', '2021-01-12 12:27:01'),
(10, NULL, 'Pedro Henrique da Silva', 'Pedro', 'comprador@teste2', 'pedro6', '$2y$10$cQ9DSNSQPYtX0aqxyGZ/EuHSYzeyjwDh7WXxateSPOSoReO6QYApa', 5, 1, 0, '7.50', '7.50', '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '1e196bc392e079db933deb3f7095f937', '2020-10-15 16:45:31', '2021-01-12 12:27:01'),
(11, NULL, 'Taxa Teste', 'Taxa', 'taxa@taxa', '12344', '$2y$10$FVV2vRMUx.A.Dkh4Rt11deUwtZ52EUawUdIcZz0bP9VZspKtXOHQm', 5, 1, 0, '7.50', '7.50', '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '148e4cc5b75f5f79721086f28d7ccfc0', '2020-10-15 16:48:05', '2021-01-12 12:27:01'),
(12, 1, 'Pedro Henrique da Silva', 'Pedro', 'pedrohenriquedasilva100@gmail.com', 'pedro', '$2y$10$A2uG5HsW8GFsxOmrNlA6qe/YF7ja.G3PlQuHpZjF8DtaFaNNQLUpm', 1, 1, 1, '6.50', '6.50', '10', 0, '935b3c9b54e28ee9e08feba3094651da.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '1e196bc392e079db933deb3f7095f937', '2020-07-30 18:46:10', '2021-01-25 21:28:48'),
(15, 29, 'Brenda Letícia', 'Brenda', 'brenda@octa.life', 'brenda', '$2y$10$hq.tnvJsTq28pEwc2EbjRul9TAk.0FrKAs5KSqUaz5F2b.wfqEIi.', 2, 1, 1, NULL, '7.50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '5a7f5d1ae6acb580dfb0bb4b6180422e', '2020-10-28 14:48:47', '2021-01-12 12:27:01'),
(16, NULL, 'Pedro Henrique da Silva', 'Pedro', 'pedrohenriquedasilva100@gmail.co', 'pedro454', '$2y$10$xpvY18iGTjDdrBpVv3gmN.2WruoEnZDDYdvYqprzOlH.jUtNi2XTK', 5, 1, 0, '7.50', '7.50', '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '1e196bc392e079db933deb3f7095f937', '2020-10-28 20:50:59', '2021-01-12 12:27:01'),
(17, NULL, 'Teste Teste', 'Teste', 'teste@teste123', 'teste', '$2y$10$LcajLI5RC/CFEBPWtgJ/9uvAkAEG0J9gL5zWi7qQAJAKL7FRvMjH6', 5, 1, 1, '7.50', '7.50', '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '809a4d7e56cf02b6335e6f6971ef79e3', '2020-10-29 12:09:49', '2021-01-12 12:27:01'),
(18, 32, 'Clara Alana Allana Fogaça', 'Clara', 'suporte@octapay.com.br', NULL, '$2y$10$1NQkfdpateYQAADJ.3c/bO8QTObpP.AOgZFgZ8uWTIKVwD2Aue4DS', 5, 1, 1, NULL, '7.50', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '47a859fb88e1d0ee1ef551fc23d7efde', '2020-11-03 15:27:16', '2021-01-12 12:27:01'),
(19, 33, 'Julio Ian Porto', 'Julio', 'suporte@octapay.com.br1', NULL, '$2y$10$ZdISzCkJlslvWA3hGNihTeVYR/.4eRlqSuY.6uPkP1kzo9vWpg3CW', 5, 1, 1, '7.50', '7.50', '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, 'a0c579596eabb8f7f3f3993ac1dd14ae', '2020-11-03 15:42:00', '2021-01-12 12:27:01'),
(20, 34, 'Marina Heloise da Mata', 'Marina', 'suporte@octapay.com.br2', NULL, '$2y$10$Co0YxEHPeaV4O9ru01PXqee8SmIDNAHo79QvES/dCeeZnUdCKsAv2', 6, 1, 1, '7.50', '7.50', '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, 'ae5cc633bb1271a267c235a6c3475424', '2020-11-03 15:45:58', '2021-01-12 12:27:01'),
(21, 35, 'Isabella Pietra Farias', 'Isabella', 'suporte@octapay.com.br3', NULL, '$2y$10$zH2kS/BdlX0I19cUwILAmuMCxb7P7.wrc3sw27I5IWazPBY1jdsp2', 6, 1, 1, '7.50', '7.50', '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, 'f065ca751658be02c37117a8b33b10be', '2020-11-03 15:48:14', '2021-01-12 12:27:01'),
(22, NULL, 'Thiago Tatim', 'Thiago', 'thiagotatim@octa.life', 'ttatim', '$2y$10$QGUh2teybi4FycALwHs4keVqDGmIl6TE7R0QSfs0BRanIlDTYIBVu', 1, 1, 1, NULL, '7.50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema2', 0, '530563338639f1111fa545a84f459fd7', '2020-12-10 13:53:42', '2021-01-12 12:27:01'),
(23, NULL, ' thiago felix da silva', '', 'thiago@octapay.com.br', 'thfelix', '$2y$10$/MtPyLvb9/qdJQxcCqbvjuiAJjmZnsYh8ztv1sQ8QrioM1BWbsbRS', 1, 1, 1, NULL, '7.50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema2', 0, 'a8462a98bdd90777bdb6adf6166e7926', '2020-12-10 13:54:54', '2021-01-12 12:27:01'),
(24, NULL, 'Diego Gonçalves', 'Diego', 'dgoncalvesgv@gmail.com', 'Dgoncalves', '$2y$10$I7OzvzKop4zJLytv.pNf7OnGUIaU2MmCIKyplzY3IYiUKvqR6lbJy', 1, 1, 1, NULL, '7.50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema2', 0, 'a4137c104866bbfb9ecc6ffea4a04832', '2020-12-10 13:58:15', '2021-01-12 12:27:01'),
(25, 41, 'Teste T', 'Teste', 'teste@teste', 'teste1', '$2y$10$RZ.TkzmbhdLiNiYOg3PNkOvKMZ1sMm3pwOIv4jy8NEcf51bXsXRla', 5, 1, 1, '7.50', '7.50', '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '8309a007c3738d2164a0ec8826b1d7b1', '2020-12-28 21:37:16', '2021-01-12 12:27:01'),
(26, NULL, 'Pedro Henrique da Silva', 'Pedro', 'pedrohenriquedasilva100@yahoo.com.br', 'theuz1313', '$2y$10$1v6xu35QCkG1W9xVsmLh.emCzVWV4VUW7pYe63mv3HJ1rl9GhjKQW', 5, 1, 0, '7.50', '7.50', '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, '1e196bc392e079db933deb3f7095f937', '2021-01-05 13:34:23', '2021-01-12 12:27:01'),
(27, 43, 'Pedro Teste 2', 'Pedro', 'designmarketing.contato@gmail.com2', NULL, '$2y$10$GjTrTbdOHYLEV8apgb5n3e7PgiUrn6jQfUBOOPSB3srWqaIi3mzR.', 6, 1, 0, '7.50', NULL, '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, NULL, '2021-01-21 14:09:03', '2021-01-21 14:09:03'),
(28, 44, 'Pedro Teste', 'Pedro', 'business.phs.2020@gmail.com', NULL, '$2y$10$jveGsFrvUnRoEswkHT.cbeF/Lr5o06YjBg7pc4jqehWOWP2pXDO9y', 6, 1, 0, '7.50', NULL, '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, NULL, '2021-01-21 14:21:49', '2021-01-21 14:21:49'),
(29, 45, 'Pedro Teste 2', 'Pedro', 'designmarketing.contato@gmail.com', NULL, '$2y$10$MfHbDolM8iZxVeKLz6q/Mu79srqMEMtsdcCIzfyZv4Tn9k0UemxbG', 6, 1, 0, '7.50', NULL, '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, NULL, '2021-01-21 14:26:16', '2021-01-21 14:26:16'),
(30, 46, 'OctaPay Master', 'OctaPay', 'master@octapay.com.br', NULL, '$2y$10$iZHA0D6fFktyHkAc9VEY8uQzM4K/VzuYW2WGRwEjHTW/1a.YrkfFS', 6, 1, 0, '7.50', NULL, '30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tema1', 0, NULL, '2021-01-26 19:20:01', '2021-01-26 19:20:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_dados`
--

CREATE TABLE `usuario_dados` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tipo_doc` tinyint(4) DEFAULT NULL COMMENT '1 = cpf\r\n2 = cnpj',
  `cpf_cnpj` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `cep_entrega` varchar(15) DEFAULT NULL,
  `rua_entrega` varchar(50) DEFAULT NULL,
  `numero_entrega` int(11) DEFAULT NULL,
  `complemento_entrega` varchar(100) DEFAULT NULL,
  `bairro_entrega` varchar(50) DEFAULT NULL,
  `cidade_entrega` varchar(50) DEFAULT NULL,
  `estado_entrega` varchar(50) DEFAULT NULL,
  `pais_entrega` varchar(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario_dados`
--

INSERT INTO `usuario_dados` (`id`, `usuario`, `nome`, `email`, `tipo_doc`, `cpf_cnpj`, `telefone`, `cep`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `pais`, `cep_entrega`, `rua_entrega`, `numero_entrega`, `complemento_entrega`, `bairro_entrega`, `cidade_entrega`, `estado_entrega`, `pais_entrega`, `created_at`, `updated_at`, `customer_id`) VALUES
(1, 12, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.com', 2, '12719252654', '123242523623', '35012140', 'Rua São Bartolomeu', 330, 'Apto 3', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '35012140', 'Rua São Bartolomeu', 330, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2020-07-30 18:46:10', '2021-01-25 21:28:48', NULL),
(2, 3, 'Pedro Henrique da Silva', 'pedro@pedro', 2, '3344455', '33999102490', '35012140', 'Rua São Bartolomeu', 330, '', 'Vila Mariana', 'Governador Valadares', 'MS', 'BR', '35012160', 'Rua São Felipe', 330, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2020-08-06 12:15:18', '2021-01-05 15:02:34', NULL),
(3, NULL, 'Pedro Henrique da Silva', 'teste@teste', 1, NULL, '33999102490', NULL, 'Rua São Bartolomeu', 330, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', NULL, 'Rua São Bartolomeu', 330, '', 'Vila Mariana', 'Governador Valadares', 'MG', '0', '2020-08-06 12:16:31', '2020-08-06 12:16:31', NULL),
(4, 5, 'Pedro Henrique da Silva', 'jilo_123@outlook.com', 1, '06929943606', '123242523623', '', 'Rua São Bartolomeu', 330, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '35012140', 'Rua São Bartolomeu', 20, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2020-08-06 12:35:02', '2020-12-09 21:01:50', 'CUS-3BL32NCC3A74'),
(5, NULL, 'Pedro Henrique da Silva', 'teste@teste', 1, '53080816030', '33999102490', NULL, 'Rua São Bartolomeu', 330, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', NULL, 'Rua São Bartolomeu', 330, '', 'Vila Mariana', 'Governador Valadares', 'MG', '0', '2020-08-06 12:40:42', '2020-08-06 14:41:07', NULL),
(6, NULL, 'Teste Teste', 'pedro@octa.life2', 1, '97394691080', '12324252362345', NULL, 'Rua São Bartolomeu', 330, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '', 'Rua São Bartolomeu', 0, '', 'Vila Mariana', 'Governador Valadares', 'MG', '0', '2020-08-06 14:46:22', '2020-12-02 21:46:49', NULL),
(7, 4, 'Teste 3', 'test3@teste', 2, '483948493', '33999102490', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-10 20:42:50', '2020-08-10 20:42:50', NULL),
(8, NULL, 'Cristina Ferreira de Melo Oliveira', 'teste4@teste', 1, '78890387041', '33999102490', '35012140', 'Rua São Bartolomeu', 330, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '35012140', 'Rua São Bartolomeu', 330, '', 'Vila Mariana', 'Governador Valadares', 'MG', '0', '2020-08-12 12:50:16', '2020-08-12 12:50:31', NULL),
(9, 7, 'Comprador Teste', 'comprador@teste', 1, '93444578083', '33999102490', '35054220', 'Rua A', 345, '', 'Jardim do Trevo', 'Governador Valadares', 'MG', 'BR', '35054220', 'Rua A', 345, '', 'Jardim do Trevo', 'Governador Valadares', 'MG', '0', '2020-08-14 12:06:15', '2020-08-14 12:09:20', NULL),
(10, 6, 'Comprador Teste 2', 'comprador@teste2', 1, '10279377053', '33999102490', '35010172', 'Avenida Sete de Setembro', 345, '', 'Centro', 'Governador Valadares', 'MG', 'BR', '35010172', 'Avenida Sete de Setembro', 345, '', 'Centro', 'Governador Valadares', 'MG', '0', '2020-08-14 12:10:35', '2020-08-14 12:10:35', NULL),
(11, NULL, 'Cristina Ferreira de Melo Oliveira', 'pedro@octa.life2', 1, '50631842004', '33999102490', '35010172', 'Avenida Sete de Setembro', 345, '', 'Centro', 'Governador Valadares', 'MG', 'BR', '35012140', 'Rua São Bartolomeu', 345, '', 'Vila Mariana', 'Governador Valadares', 'MG', '0', '2020-08-14 12:17:15', '2020-08-25 13:47:07', NULL),
(12, NULL, 'Pedro Henrique da Silva', 'pedro@octa.life2', 1, '32024427081', '3335012140', '35012140', 'Rua São Bartolomeu', 23, 'Governador Valadares', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '35012140', 'Rua São Bartolomeu', 23, 'Governador Valadares', 'Vila Mariana', 'Governador Valadares', 'MG', '0', '2020-08-14 19:59:20', '2020-08-14 20:02:33', NULL),
(13, NULL, 'Pedro Henrique da Silva', 'pedro@octa.life', 1, '97687319079', '33999102490', '35012140', 'Rua São Bartolomeu', 0, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '35012140', 'Rua São Bartolomeu', 0, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2020-08-18 13:39:21', '2020-12-28 20:33:43', NULL),
(14, NULL, 'Pedro Henrique da Silva', 'pedro@octa.life', 1, '49976400004', '', '35012140', 'Rua São Bartolomeu', 0, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '35012140', 'Rua São Bartolomeu', 0, '', 'Vila Mariana', 'Governador Valadares', 'MG', '0', '2020-08-18 13:40:39', '2020-08-18 13:40:39', NULL),
(15, NULL, 'Pedro Henrique da Silva', 'pedro@octa.life', 1, '10077712757', '', '35012140', 'Rua São Bartolomeu', 0, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '35012140', 'Rua São Bartolomeu', 0, '', 'Vila Mariana', 'Governador Valadares', 'MG', '0', '2020-08-18 14:21:27', '2020-08-18 14:39:55', NULL),
(16, NULL, 'André J', 'teste4@teste', 1, '91681712008', '33999102490', '36415000', 'Rua São Bartolomeu', 23, '', 'Centro', 'Congonhas', 'MG', 'BR', '36415000', 'Rua São Bartolomeu', 23, '', 'Centro', 'Congonhas', 'MG', '0', '2020-08-25 12:56:29', '2020-08-25 13:03:53', NULL),
(17, NULL, 'Teste 2', 'pedro@octa.life', 1, '33132379085', '12324252362345', '35012140', 'Rua São Bartolomeu', 2341, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '35012140', 'Rua São Bartolomeu', 2341, '', 'Vila Mariana', 'Governador Valadares', 'MG', '0', '2020-08-25 13:30:32', '2020-08-25 13:32:36', NULL),
(20, NULL, 'Comprador Teste', 'teste@teste.com2', 1, '12345', '33999102490', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-13 15:13:38', '2020-10-13 15:13:38', NULL),
(21, 8, 'Pedro Henrique da Silva', 'pedro@octa.life3', 2, '7y55655', '999102490', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-13 16:47:12', '2020-10-13 16:47:12', NULL),
(23, 10, 'Pedro Henrique da Silva', 'comprador@teste2', 1, '2422332', '35012140', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-15 16:45:31', '2020-10-15 16:45:31', NULL),
(24, 11, 'Taxa Teste', 'taxa@taxa', 1, '13232', '24234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-15 16:48:05', '2020-10-15 16:48:05', NULL),
(25, NULL, 'Cristina Ferreira de Melo Oliveira', 'cristina@cristina.com', 1, '79823868069', '3333999102490', '35010172', 'Avenida Sete de Setembro', 123, '', 'Centro', 'Governador Valadares', 'MG', 'BR', '35010172', 'Avenida Sete de Setembro', 123, '', 'Centro', 'Governador Valadares', 'MG', '0', '2020-10-15 19:41:35', '2020-10-15 19:45:39', NULL),
(26, NULL, 'Thayane de lemos costa', 'pedro@octa.life3', 1, '82808767072', '33339999999', '35054220', 'Rua A', 330, '', 'Jardim do Trevo', 'Governador Valadares', 'MG', 'BR', '35054220', 'Rua A', 23, 'Jardim do Trevo', 'Jardim do Trevo', 'Governador Valadares', 'MG', '0', '2020-10-16 12:28:44', '2020-10-16 13:31:12', NULL),
(27, 9, 'Teixeira Duarte', 'pedro@octa.life4', 1, '74225881016', '33339999999', '35010172', 'Avenida Sete de Setembro', 23, '', 'Centro', 'Governador Valadares', 'MG', 'BR', '35010172', 'Avenida Sete de Setembro', 23, '', 'Centro', 'Governador Valadares', 'MG', '0', '2020-10-16 18:04:00', '2020-10-16 18:04:00', NULL),
(28, NULL, 'Cristina Ferreira de Melo Oliveira', 'pedro@octa.life5', 1, '39638814020', '33999999997394691080', '35054220', 'Rua A', 330, 'Centro', 'Jardim do Trevo', 'Governador Valadares', 'MG', 'BR', '35054220', 'Rua A', 4, 'Vila Mariana', 'Jardim do Trevo', 'Governador Valadares', 'MG', '0', '2020-10-16 18:16:48', '2020-11-17 15:51:18', NULL),
(29, 15, 'Brenda Letícia', 'brenda@octa.life', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-28 14:48:47', '2020-12-10 13:52:40', NULL),
(30, 16, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@gmail.co', 1, '123', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-28 20:50:59', '2020-10-28 20:50:59', NULL),
(31, 17, 'Teste Teste', 'teste@teste123', 1, '4356', '123455', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-29 12:09:49', '2020-10-29 12:09:49', NULL),
(32, NULL, 'Clara Alana Allana Fogaça', 'suporte@octapay.com.br', 1, '06656875831', '123242523623', '63122128', 'Travessa Francisco Sousa Brasil', 324, '', 'Santa Luzia', 'Crato', 'CE', 'BR', '63122128', 'Travessa Francisco Sousa Brasil', 0, '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2020-11-03 15:27:16', '2020-12-29 13:03:58', NULL),
(33, 19, 'Julio Ian Porto', 'suporte@octapay.com.br1', 1, '96981617838', '88993150957', '63122128', 'Travessa Francisco Sousa Brasil', 324, '', 'Santa Luzia', 'Crato', 'CE', 'BR', '63122128', 'Travessa Francisco Sousa Brasil', 324, '', 'Santa Luzia', 'Crato', 'CE', '0', '2020-11-03 15:42:00', '2020-11-03 15:42:00', NULL),
(34, 20, 'Marina Heloise da Mata', 'suporte@octapay.com.br2', 1, '55813715983', '24252362345', '63122128', 'Travessa Francisco Sousa Brasil', 324, '', 'Santa Luzia', 'Crato', 'CE', 'BR', '63122128', 'Travessa Francisco Sousa Brasil', 0, '', 'Santa Luzia', 'Crato', 'CE', '0', '2020-11-03 15:45:58', '2020-12-03 13:50:18', NULL),
(35, 21, 'Isabella Pietra Farias', 'suporte@octapay.com.br3', 1, '09218312774', '12324252362345', '63122128', 'Travessa Francisco Sousa Brasil', 324, '', 'Santa Luzia', 'Crato', 'CE', 'BR', '63122128', 'Travessa Francisco Sousa Brasil', 0, '', 'Santa Luzia', 'Crato', 'CE', '0', '2020-11-03 15:48:14', '2020-12-03 13:40:43', NULL),
(37, 1, 'OctaPay Master', 'master@octapay.com.br', 2, '1271925265', '33999102490', '35012140', 'Rua São Bartolomeu', 330, 'Apto 3', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '35012140', 'Rua São Bartolomeu', 0, '', 'Vila Mariana', 'Governador Valadares', 'MG', '0', '2020-07-30 18:46:10', '2020-11-06 18:52:27', NULL),
(38, 22, 'Thiago Tatim', 'thiagotatim@octa.life', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-10 13:53:42', '2020-12-10 13:53:42', NULL),
(39, 23, ' thiago felix da silva', 'thiago@octapay.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-10 13:54:54', '2020-12-10 13:54:54', NULL),
(40, 24, 'Diego Gonçalves', 'dgoncalvesgv@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-10 13:58:15', '2020-12-10 13:58:15', NULL),
(41, 25, 'Teste T', 'teste@teste', 1, '12345678901', '33999102490', '', '', 0, '', '', '', 'AC', '', '', '', 0, '', '', '', NULL, '', '2020-12-28 21:37:16', '2020-12-28 22:00:04', NULL),
(42, 26, 'Pedro Henrique da Silva', 'pedrohenriquedasilva100@yahoo.com.br', 1, '1234', '33999102490', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-05 13:34:23', '2021-01-05 13:34:23', NULL),
(43, 27, 'Pedro Teste 2', 'designmarketing.contato@gmail.com', 1, '97941232006', '33988869997', '35012160', 'Rua São Felipe', 65, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '35012160', 'Rua São Felipe', 65, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-21 14:09:03', '2021-01-21 14:09:03', NULL),
(44, 28, 'Pedro Teste', 'business.phs.2020@gmail.com', 1, '85633573013', '33988869997', '63122128', 'Travessa Francisco Sousa Brasil', 330, '', 'Santa Luzia', 'Crato', 'CE', 'BR', '63122128', 'Travessa Francisco Sousa Brasil', 330, '', 'Santa Luzia', 'Crato', 'CE', 'BR', '2021-01-21 14:21:49', '2021-01-21 14:21:49', NULL),
(45, 29, 'Pedro Teste 2', 'designmarketing.contato@gmail.com', 1, '93678275044', '33988869997', '35012160', 'Rua São Felipe', 65, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '35012160', 'Rua São Felipe', 65, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-21 14:26:16', '2021-01-21 14:26:16', NULL),
(46, 30, 'OctaPay Master', 'master@octapay.com.br', 1, '02039274006', '33999102490', '35012140', 'Rua São Bartolomeu', 0, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '35012140', 'Rua São Bartolomeu', 0, '', 'Vila Mariana', 'Governador Valadares', 'MG', 'BR', '2021-01-26 19:20:01', '2021-01-26 19:20:01', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_premium`
--

CREATE TABLE `usuario_premium` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `indicado` int(11) DEFAULT NULL,
  `expiracao` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario_premium`
--

INSERT INTO `usuario_premium` (`id`, `codigo`, `usuario`, `indicado`, `expiracao`, `created_at`, `updated_at`) VALUES
(1, NULL, 12, 16, '2021-10-28', '2020-10-28 20:50:59', '2020-10-28 20:50:59'),
(2, NULL, 12, 17, '2020-10-28', '2020-10-29 12:09:49', '2020-10-29 12:09:49'),
(3, NULL, 12, 3, '2020-10-28', '2020-10-29 12:24:43', '2020-10-29 12:24:50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `transacao` varchar(30) DEFAULT NULL,
  `produto` int(255) DEFAULT NULL,
  `plano` int(11) DEFAULT NULL,
  `comprador` int(11) DEFAULT NULL,
  `endereco` int(11) DEFAULT NULL,
  `produtor` int(11) DEFAULT NULL,
  `campanha` int(11) DEFAULT NULL,
  `afiliado` int(11) DEFAULT NULL,
  `comissao_afiliado` decimal(10,2) DEFAULT NULL,
  `meio_pagamento` varchar(20) DEFAULT NULL,
  `forma_pagamento` int(11) DEFAULT NULL,
  `status_transacao` int(11) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `url_checkout` varchar(300) DEFAULT NULL,
  `link_boleto` varchar(100) DEFAULT NULL,
  `linha_digitavel` varchar(100) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `valor_produto` decimal(10,2) DEFAULT NULL,
  `valor_juros` decimal(10,2) DEFAULT NULL,
  `valor_frete` decimal(10,2) DEFAULT NULL,
  `taxa_juros` decimal(10,4) DEFAULT NULL,
  `valor_taxa` decimal(10,2) DEFAULT NULL,
  `taxa_octapay` decimal(10,2) DEFAULT NULL,
  `valor_octapay` decimal(10,2) DEFAULT NULL,
  `valor_desconto` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `parcelas` int(11) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `data_pedido` date DEFAULT NULL,
  `data_finalizada` datetime DEFAULT NULL,
  `data_ultimo_evento` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `src` varchar(200) DEFAULT NULL,
  `utm_source` varchar(200) DEFAULT NULL,
  `utm_campaign` varchar(200) DEFAULT NULL,
  `utm_medium` varchar(200) DEFAULT NULL,
  `utm_content` varchar(200) DEFAULT NULL,
  `st4rt` int(11) DEFAULT NULL,
  `postback_st4rt` int(11) DEFAULT 0,
  `carrinho_abandonado` int(11) DEFAULT NULL,
  `coprodutores` varchar(200) DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL,
  `coprodutor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `transacao`, `produto`, `plano`, `comprador`, `endereco`, `produtor`, `campanha`, `afiliado`, `comissao_afiliado`, `meio_pagamento`, `forma_pagamento`, `status_transacao`, `motivo`, `url_checkout`, `link_boleto`, `linha_digitavel`, `valor_bruto`, `valor_produto`, `valor_juros`, `valor_frete`, `taxa_juros`, `valor_taxa`, `taxa_octapay`, `valor_octapay`, `valor_desconto`, `valor_liquido`, `parcelas`, `data_vencimento`, `data_pedido`, `data_finalizada`, `data_ultimo_evento`, `created_at`, `updated_at`, `src`, `utm_source`, `utm_campaign`, `utm_medium`, `utm_content`, `st4rt`, `postback_st4rt`, `carrinho_abandonado`, `coprodutores`, `ip`, `coprodutor`) VALUES
(1, 'PAY-S28Z0UH0SU7H', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 4, NULL, NULL, 'https://sandbox.moip.com.br/v2/boleto/BOL-Y92FG1Z81KAX/print', NULL, '147.00', '147.00', NULL, NULL, '0.0299', NULL, '6.90', '11.14', NULL, '135.86', 1, NULL, '2020-11-23', '2020-11-23 09:50:56', '2020-11-23 09:50:56', '2020-08-07 12:02:55', '2020-08-07 12:02:55', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(2, 'PAY-K4V0XTR1024G', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, NULL, 'https://sandbox.moip.com.br/v2/boleto/BOL-OPTCST3FCAZT/print', NULL, NULL, '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-07', NULL, '2020-08-07 09:54:19', '2020-08-07 12:54:22', '2020-08-07 12:54:22', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(3, 'PAY-Z5273NJ0JXW6', 4, 1, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 6, NULL, NULL, 'https://sandbox.moip.com.br/v2/boleto/BOL-1VI6SCP2LHYX/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-07', '2020-11-30 09:59:34', '2020-08-07 09:56:45', '2020-08-07 12:56:48', '2020-08-07 12:56:48', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(4, 'PAY-J5AXBPNS2TGD', 4, 1, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/o', 'https://sandbox.moip.com.br/v2/boleto/BOL-R4WLEOHMDWC9/print', NULL, '177.12', '147.00', '30.12', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 12, NULL, '2020-08-07', '2020-08-07 10:03:27', '2020-08-07 10:03:27', '2020-08-07 13:03:31', '2020-08-28 21:52:16', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(5, 'PAY-TB3XNZ5504PC', 4, 1, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-07', '2020-08-07 10:08:19', '2020-08-07 10:08:19', '2020-08-07 13:08:21', '2020-08-07 13:08:21', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(6, 'PAY-3ZY4L3T9E3OT', 4, 1, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-07', '2020-08-07 10:14:47', '2020-08-07 10:14:47', '2020-08-07 13:14:49', '2020-08-07 13:14:49', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(7, 'PAY-MPIDTMZBQFDF', 4, 1, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-07', '2020-08-07 10:17:39', '2020-08-07 10:17:39', '2020-08-07 13:17:42', '2020-08-07 13:17:42', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(8, 'PAY-Z8DQ0GJ1CMOG', 4, 1, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-07', '2020-08-07 10:32:39', '2020-08-07 10:32:39', '2020-08-07 13:32:42', '2020-08-07 13:32:42', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(9, 'PAY-BN0UU0KWLTSQ', 4, 1, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-XN88A69FGHBY/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-07', NULL, '2020-08-07 10:33:03', '2020-08-07 13:33:07', '2020-08-07 13:33:07', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(10, 'PAY-R9NMHZBQGOGY', 4, 1, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-T4HBKK1JIUD6/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-07', NULL, '2020-08-07 10:34:07', '2020-08-07 13:34:10', '2020-08-07 13:34:10', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(11, 'PAY-MO1AOV35NVDL', 4, 1, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-FKIWBKP6GUPN/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-07', NULL, '2020-08-07 10:34:28', '2020-08-07 13:34:32', '2020-08-07 13:34:32', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(12, 'PAY-A80GCOWQUFIN', 4, 1, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-07', '2020-08-07 10:36:07', '2020-08-07 10:36:07', '2020-08-07 13:36:10', '2020-08-07 13:36:10', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(13, 'PAY-M7D84QQF8H56', 4, 1, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-07', '2020-08-07 10:44:00', '2020-08-07 10:44:00', '2020-08-07 13:44:02', '2020-08-07 13:44:02', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(14, 'PAY-B2HC05XPJ2VS', 4, 1, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-07', '2020-08-07 11:46:02', '2020-08-07 11:46:02', '2020-08-07 14:46:04', '2020-08-07 14:46:04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(25, 'PAY-JPK6WHTZA7TZ', 3, NULL, 6, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/B3105BE3', 'https://sandbox.moip.com.br/v2/boleto/BOL-9R67OI1CA52J/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '234.00', 1, NULL, '2020-08-09', NULL, '2020-08-09 16:19:08', '2020-08-09 19:19:10', '2020-08-09 19:19:10', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(26, 'PAY-D328S6MHXRD8', 3, NULL, 6, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/B3105BE3', 'https://sandbox.moip.com.br/v2/boleto/BOL-HLTL36V1Z3GW/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '234.00', 1, NULL, '2020-08-09', NULL, '2020-08-09 16:20:38', '2020-08-09 19:20:40', '2020-08-09 19:20:40', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(27, 'PAY-B3SE90Y4MU84', 3, NULL, 6, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/B3105BE3', 'https://sandbox.moip.com.br/v2/boleto/BOL-O2P6HFWBR2BW/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '234.00', 1, NULL, '2020-08-09', NULL, '2020-08-09 16:59:10', '2020-08-09 19:59:13', '2020-08-09 19:59:13', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(28, 'PAY-00UU86D313Q9', 4, 1, 8, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-12', '2020-08-12 09:50:31', '2020-08-12 09:50:31', '2020-08-12 12:50:33', '2020-08-12 12:50:33', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(30, 'PAY-6IMB8CI0POKZ', 4, 1, 9, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '172.20', '147.00', '25.20', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 10, NULL, '2020-08-14', '2020-08-14 09:08:06', '2020-08-14 09:08:06', '2020-08-14 12:08:09', '2020-08-14 12:08:09', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(31, 'PAY-LL3KJ7EUQHIA', 4, 1, 9, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '172.20', '147.00', '25.20', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 10, NULL, '2020-08-14', '2020-08-14 09:09:20', '2020-08-14 09:09:20', '2020-08-14 12:09:23', '2020-08-14 12:09:23', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(33, 'PAY-8IZU7VQH875Y', 4, 1, 11, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '172.20', '147.00', '25.20', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 10, NULL, '2020-08-14', '2020-08-14 09:17:15', '2020-08-14 09:17:15', '2020-08-14 12:17:33', '2020-08-14 12:17:33', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(34, 'PAY-VMWQVNDGF96N', 4, 1, 11, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '172.20', '147.00', '25.20', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 10, NULL, '2020-08-14', '2020-08-14 09:19:07', '2020-08-14 09:19:07', '2020-08-14 12:19:10', '2020-08-14 12:19:10', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(35, 'PAY-7SGML6D4PXXM', 4, 1, 11, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-5NV818KA2M3X/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-14', NULL, '2020-08-14 09:19:18', '2020-08-14 12:19:23', '2020-08-14 12:19:23', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(36, 'PAY-KE67HESCQUB7', 4, 1, 11, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-E0BO9C895R8Z/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-14', NULL, '2020-08-14 09:29:00', '2020-08-14 12:29:04', '2020-08-14 12:29:04', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(37, 'PAY-97OA1IU8J4YF', 4, 1, 1, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-OT296MVNH9XV/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-14', NULL, '2020-08-14 15:14:18', '2020-08-14 18:14:21', '2020-08-14 18:14:21', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(38, 'PAY-RBO65ZPNEQC1', 4, 1, 1, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-9BX0M1CJ895Y/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-14', NULL, '2020-08-14 15:24:54', '2020-08-14 18:24:56', '2020-08-14 18:24:56', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(39, 'PAY-VE5H0IK7F40E', 4, 1, 1, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-UF3AGLLXFAYY/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-14', NULL, '2020-08-14 15:25:32', '2020-08-14 18:25:35', '2020-08-14 18:25:35', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(40, 'PAY-GE9QNZ1PS0LF', 4, 1, 1, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '172.20', '147.00', '25.20', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 10, NULL, '2020-08-14', '2020-08-14 15:27:47', '2020-08-14 15:27:47', '2020-08-14 18:27:49', '2020-08-14 18:27:49', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(41, 'PAY-HC3BHYFCK87B', 4, 1, 1, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-CIKE036SWWRW/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-14', NULL, '2020-08-14 16:07:32', '2020-08-14 19:07:35', '2020-08-14 19:07:35', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(42, 'PAY-7JKD9EN8L5QY', 4, 1, 12, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://api.moip.com.br/v2/boleto/BOL-ERHVVRA5U9H3/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-14', NULL, '2020-08-14 16:59:20', '2020-08-14 19:59:24', '2020-08-14 19:59:24', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(43, 'PAY-B1XLMTZTSM8W', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro', 'https://sandbox.moip.com.br/v2/boleto/BOL-3P9MTHRL5FP8/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-17', NULL, '2020-08-17 14:40:09', '2020-08-17 17:40:12', '2020-08-17 17:40:12', 'pedro', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(44, 'PAY-MAKOSJGAF941', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-W7JCXKP0M34X/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-17', NULL, '2020-08-17 17:14:39', '2020-08-17 20:14:45', '2020-08-17 20:14:45', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(45, 'PAY-OTGG4XC5QMMM', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-17', '2020-08-17 17:18:37', '2020-08-17 17:18:37', '2020-08-17 20:18:39', '2020-08-17 20:18:39', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(46, 'PAY-D6QVYFAB11YI', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-94LMTHOT46DT/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-17', NULL, '2020-08-17 17:19:37', '2020-08-17 20:19:40', '2020-08-17 20:19:40', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(47, 'PAY-DRWSERNKF6FH', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-17', '2020-08-17 17:22:21', '2020-08-17 17:22:21', '2020-08-17 20:22:24', '2020-08-17 20:22:24', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(48, 'PAY-14BLU1IS9BMF', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-M0QSSULIIQXH/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-17', NULL, '2020-08-17 17:22:30', '2020-08-17 20:22:33', '2020-08-17 20:22:33', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(49, 'PAY-4MHAHEBJYPYV', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-17', '2020-08-17 17:27:49', '2020-08-17 17:27:49', '2020-08-17 20:27:51', '2020-08-17 20:27:51', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(50, 'PAY-CTKJBJAHRNSP', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-XIPRRHVT5MTW/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-17', NULL, '2020-08-17 17:28:07', '2020-08-17 20:28:10', '2020-08-17 20:28:10', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(51, 'PAY-D0YSDX8V2TVO', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-17', '2020-08-17 17:42:20', '2020-08-17 17:42:20', '2020-08-17 20:42:23', '2020-08-17 20:42:23', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(52, 'PAY-XRSLATJFOP22', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-17', '2020-08-17 17:51:34', '2020-08-17 17:51:34', '2020-08-17 20:51:36', '2020-08-17 20:51:36', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(53, 'PAY-1XPKQA6FTIFE', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-114ZZ3JJM70U/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:34:29', '2020-08-18 11:34:31', '2020-08-18 11:34:31', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(54, 'PAY-G3CHU0R90OYN', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-C6JS4G20A4R9/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:40:29', '2020-08-18 11:40:32', '2020-08-18 11:40:32', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(55, 'PAY-5LAA67WR4L4W', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-Y3TJL4J5JGOC/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:45:06', '2020-08-18 11:45:09', '2020-08-18 11:45:09', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(56, 'PAY-53MGGEEHJLR7', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-Z64Y1XZ81ETX/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:46:07', '2020-08-18 11:46:10', '2020-08-18 11:46:10', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(57, 'PAY-F102HI512459', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-VLYZDECUBW7T/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:49:16', '2020-08-18 11:49:18', '2020-08-18 11:49:18', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(58, 'PAY-2P1AM6XJDNO1', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-FBW34A3UZMDW/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:49:49', '2020-08-18 11:49:51', '2020-08-18 11:49:51', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(59, 'PAY-H9IFE44XUSUZ', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-8G64CWOYWRMC/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:50:32', '2020-08-18 11:50:34', '2020-08-18 11:50:34', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(60, 'PAY-P83A4HBUORBT', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-VSYKRDLMJU2X/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:51:23', '2020-08-18 11:51:27', '2020-08-18 11:51:27', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(61, 'PAY-GD64N6BKEI6O', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-3VZ8310PHX0P/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:53:50', '2020-08-18 11:53:53', '2020-08-18 11:53:53', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(62, 'PAY-JWQ7CE5IYWIU', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-3XFTKOA1QPKB/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:54:05', '2020-08-18 11:54:08', '2020-08-18 11:54:08', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(63, 'PAY-V8M6CW3QRDXK', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-E6Q6RBJ1R7DM/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:55:29', '2020-08-18 11:55:31', '2020-08-18 11:55:31', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(64, 'PAY-79ALIN4J967G', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-8Y4LSO5UN0C2/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:58:45', '2020-08-18 11:58:49', '2020-08-18 11:58:49', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(65, 'PAY-JKS8QWL1BOZC', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-3SEA2SYI04BN/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 08:59:40', '2020-08-18 11:59:42', '2020-08-18 11:59:42', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(66, 'PAY-2PF9K7IBYTCV', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-5CD3PF7BTXB6/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:05:03', '2020-08-18 12:05:07', '2020-08-18 12:05:07', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(67, 'PAY-JPJLWMLM369W', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-O1DDBQJ2EOYG/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:25:06', '2020-08-18 12:25:09', '2020-08-18 12:25:09', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(68, 'PAY-O51SABN7VRLV', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-K45YAULVGVA2/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:25:28', '2020-08-18 12:25:30', '2020-08-18 12:25:30', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(69, 'PAY-EEKH41Y5W5E1', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-QB3OGSBTZ8R1/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:25:49', '2020-08-18 12:25:52', '2020-08-18 12:25:52', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(70, 'PAY-GABQUSK09YN4', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-JMVOJLZX488Q/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:31:35', '2020-08-18 12:31:38', '2020-08-18 12:31:38', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(71, 'PAY-UG4KIIVFJUVT', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-FG6DB2AQ74D1/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:32:57', '2020-08-18 12:32:59', '2020-08-18 12:32:59', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(72, 'PAY-HJRKDV300BTC', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-EWTX0N8O42E5/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:36:40', '2020-08-18 12:36:43', '2020-08-18 12:36:43', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(73, 'PAY-OIZQZ69JVKIX', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-MXJXHOJASNNM/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:37:58', '2020-08-18 12:38:01', '2020-08-18 12:38:01', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(74, 'PAY-JX7XE3LO23YS', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-D657BC5J20PT/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:38:33', '2020-08-18 12:38:36', '2020-08-18 12:38:36', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(75, 'PAY-E682VDMHG11Z', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-FLXGJRCUSV76/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:41:17', '2020-08-18 12:41:20', '2020-08-18 12:41:20', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(76, 'PAY-XH71TT5KBKBH', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-YJ96IJ5PZGTW/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:41:38', '2020-08-18 12:41:40', '2020-08-18 12:41:40', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(77, 'PAY-RHW41MS518FY', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-023ZKXWM5NK6/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:44:37', '2020-08-18 12:44:39', '2020-08-18 12:44:39', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(78, 'PAY-D0KROL4ZUVAI', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-XXE3WB4NZP2Q/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:45:27', '2020-08-18 12:45:30', '2020-08-18 12:45:30', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(79, 'PAY-4L98BO6ZQBU5', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-P7LQFKT91SKL/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 09:50:18', '2020-08-18 12:50:21', '2020-08-18 12:50:21', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(80, 'PAY-CYX9ATDOMFOF', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', NULL, NULL, '172.20', '147.00', '25.20', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 10, NULL, '2020-08-18', '2020-08-18 10:21:13', '2020-08-18 10:21:13', '2020-08-18 13:21:15', '2020-08-18 13:21:15', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(81, 'PAY-LOHF2W3A6BRR', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-BVWA138LFLTK/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 10:26:25', '2020-08-18 13:26:28', '2020-08-18 13:26:28', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(82, 'PAY-F2CLQDCAV443', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-Z1XJ14KMNU9M/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 10:28:17', '2020-08-18 13:28:20', '2020-08-18 13:28:20', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(83, 'PAY-TD5EFB9KU014', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', NULL, NULL, '172.20', '147.00', '25.20', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 10, NULL, '2020-08-18', '2020-08-18 10:28:27', '2020-08-18 10:28:27', '2020-08-18 13:28:28', '2020-08-18 13:28:28', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(84, 'PAY-8TE7WBKHXTM3', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-KT7AF5UTDANV/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 10:28:38', '2020-08-18 13:28:42', '2020-08-18 13:28:42', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(85, 'PAY-FYECRB3M1VKN', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', NULL, NULL, '172.20', '147.00', '25.20', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 10, NULL, '2020-08-18', '2020-08-18 10:31:20', '2020-08-18 10:31:20', '2020-08-18 13:31:22', '2020-08-18 13:31:22', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(86, 'PAY-4TPA119V4BJZ', 4, 1, 13, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', NULL, NULL, '172.20', '147.00', '25.20', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 10, NULL, '2020-08-18', '2020-08-18 10:39:21', '2020-08-18 10:39:21', '2020-08-18 13:39:22', '2020-08-18 13:39:22', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(87, 'PAY-0SJLFIPUJJGY', 4, 1, 14, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', NULL, NULL, '172.20', '147.00', '25.20', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 10, NULL, '2020-08-18', '2020-08-18 10:40:39', '2020-08-18 10:40:39', '2020-08-18 13:40:41', '2020-08-18 13:40:41', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(88, 'PAY-WQNT8V1U2AZO', 4, 1, 15, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-MDFG13W5VLGC/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-08-31', '2020-08-31 09:44:36', '2020-08-31 09:44:36', '2020-08-18 14:21:36', '2020-08-31 12:44:36', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(89, 'PAY-6XKVJ4GX11NQ', 4, 1, 15, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', NULL, NULL, '172.20', '147.00', '25.20', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 10, NULL, '2020-08-18', '2020-08-18 11:22:07', '2020-08-18 11:22:07', '2020-08-18 14:22:13', '2020-08-18 14:22:13', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(90, 'PAY-3MYABBMDWNQW', 4, 1, 15, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-T0P1D247TIM9/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 11:25:00', '2020-08-18 14:25:06', '2020-08-18 14:25:06', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(91, 'PAY-75PW7RGHLP99', 4, 1, 15, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-AZ4NG8IHZ8B6/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 11:26:55', '2020-08-18 14:27:23', '2020-08-18 14:27:23', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(92, 'PAY-6PHNCV97V2B4', 4, 1, 15, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?src=pedro&utm_source=teste', 'https://sandbox.moip.com.br/v2/boleto/BOL-FTS9UW2JCZWE/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-18', NULL, '2020-08-18 11:39:55', '2020-08-18 14:40:31', '2020-08-18 14:40:31', 'pedro', 'teste', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(93, 'PAY-EPFT7UT95D22', 2, NULL, 4, NULL, 3, NULL, 4, '51.45', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-4V7FR5DZM8CI/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '7.50', '18.38', '0.00', '245.00', 1, NULL, '2020-08-19', '2020-08-19 15:12:52', '2020-08-19 15:12:52', '2020-08-19 18:13:15', '2020-08-19 18:13:15', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(94, 'PAY-L2AMMYWX7REU', 2, NULL, 4, NULL, 3, NULL, 4, '51.45', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-TAGN1OHS1XC6/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '7.50', '18.38', '0.00', '245.00', 1, NULL, '2020-08-19', '2020-08-19 15:29:16', '2020-08-19 15:29:16', '2020-08-19 18:29:19', '2020-08-19 18:29:19', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(95, 'PAY-522SXQ2S072Z', 2, NULL, 4, NULL, 3, NULL, 4, '51.45', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-FTCQPMRTHLD4/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '7.50', '18.38', '0.00', '245.00', 1, NULL, '2020-08-19', '2020-08-19 15:29:32', '2020-08-19 15:29:32', '2020-08-19 18:29:35', '2020-08-19 18:29:35', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(96, 'PAY-BV6LM7B312RZ', 2, NULL, 4, NULL, 3, NULL, 4, '51.45', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-L8LAZQU4OXL2/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '245.00', 1, NULL, '2020-08-19', NULL, '2020-08-19 15:31:19', '2020-08-19 18:31:22', '2020-08-19 18:31:22', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(97, 'PAY-4W25EYYFOVEY', 4, 1, 6, NULL, 3, NULL, 4, '34.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-5IRDSSK5I0X6/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-19', NULL, '2020-08-19 15:44:46', '2020-08-19 18:44:49', '2020-08-19 18:44:49', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(98, 'PAY-XQARMVUVDW5F', 4, 1, 6, NULL, 3, NULL, 4, '34.00', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-21', '2020-08-21 14:14:16', '2020-08-21 14:14:16', '2020-08-21 17:14:19', '2020-08-21 17:14:19', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(99, 'PAY-7QCTNQAQLLSI', 4, 1, 1, NULL, 3, NULL, 4, '34.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?cp=296973', 'https://sandbox.moip.com.br/v2/boleto/BOL-NU62OJP4MYVF/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-24', NULL, '2020-08-24 17:21:20', '2020-08-24 20:21:24', '2020-08-24 20:21:24', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(100, 'PAY-0S140IWVGKPC', 4, 1, 1, NULL, 3, NULL, 4, '34.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?cp=296973', 'https://sandbox.moip.com.br/v2/boleto/BOL-9DBOYCJ7IUE5/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-24', NULL, '2020-08-24 17:25:46', '2020-08-24 20:25:50', '2020-08-24 20:25:50', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(101, 'PAY-BGMUWTPZVT6Y', 4, 1, 1, NULL, 3, NULL, 4, '34.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?cp=296973', 'https://sandbox.moip.com.br/v2/boleto/BOL-115HAJ95JPXJ/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-24', NULL, '2020-08-24 17:27:08', '2020-08-24 20:27:11', '2020-08-24 20:27:11', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(102, 'PAY-TFJBS0977ZBK', 4, 1, 16, NULL, 3, 20, 4, '34.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?cp=296973', 'https://sandbox.moip.com.br/v2/boleto/BOL-6S5BNRHMZYVT/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-25', NULL, '2020-08-25 09:56:29', '2020-08-25 12:56:34', '2020-08-25 12:56:34', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(103, 'PAY-R1H6UHU7O6FX', 4, 1, 16, NULL, 3, 20, 4, '34.00', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221?cp=296973', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, NULL, NULL, '0.00', '147.00', 12, NULL, '2020-08-25', '2020-08-25 10:03:53', '2020-08-25 10:03:53', '2020-08-25 13:03:56', '2020-08-25 13:03:56', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(104, 'PAY-IQWMVAPAX2CF', 4, 1, 17, NULL, 3, 20, 4, '34.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?cp=296973', 'https://sandbox.moip.com.br/v2/boleto/BOL-Z00KCKBF0DOV/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-25', NULL, '2020-08-25 10:30:32', '2020-08-25 13:30:36', '2020-08-25 13:30:36', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(105, 'PAY-Y7M3KM3SDM18', 4, 1, 17, NULL, 3, 20, 4, '34.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?cp=296973', 'https://sandbox.moip.com.br/v2/boleto/BOL-J44WQAHF4MYJ/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-25', NULL, '2020-08-25 10:32:36', '2020-08-25 13:32:41', '2020-08-25 13:32:41', '', '', '', '', '', NULL, 0, NULL, NULL, NULL, NULL),
(106, 'PAY-YELPKA6IK7V8', 4, 1, 11, NULL, 3, 18, 4, '34.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?cp=963111', 'https://sandbox.moip.com.br/v2/boleto/BOL-92B7WK3FFFWZ/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-25', NULL, '2020-08-25 10:47:07', '2020-08-25 13:47:11', '2020-08-26 19:24:17', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(107, 'PAY-8HIQ21618SBD', 4, 1, 4, NULL, 3, 18, 4, '34.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?cp=963111', 'https://sandbox.moip.com.br/v2/boleto/BOL-TYMMU1CN2JFJ/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-25', NULL, '2020-08-25 10:50:08', '2020-08-25 13:50:11', '2020-08-26 19:24:18', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(108, 'PAY-CBWLDDDUQKG1', 4, 1, 6, NULL, 3, NULL, 4, '34.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221?cp=711523', 'https://sandbox.moip.com.br/v2/boleto/BOL-89R6BHB97L1H/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, NULL, NULL, '0.00', '147.00', 1, NULL, '2020-08-25', NULL, '2020-08-25 10:58:56', '2020-08-25 13:58:58', '2020-08-26 19:24:18', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(109, 'PAY-QJ4EDWW88ODN', 4, 1, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://api.moip.com.br/v2/boleto/BOL-00QKWN9BC6HV/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-08-26', '2020-08-26 08:59:48', '2020-08-26 08:59:48', '2020-08-26 11:59:53', '2020-08-31 12:27:00', '', '', '', '', '', 1, 1, NULL, NULL, NULL, NULL),
(110, 'PAY-0PQ8BAGG9TKD', 4, 1, 4, NULL, 3, NULL, 12, '43.31', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/2/DFAD7221', 'https://api.moip.com.br/v2/boleto/BOL-EG27CNZ752YQ/print', NULL, '177.12', '147.00', '30.12', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 12, NULL, '2020-08-26', '2020-08-26 09:30:28', '2020-08-26 09:30:28', '2020-08-26 12:30:33', '2020-08-31 12:27:01', '', '', '', '', '', 1, 1, NULL, NULL, NULL, NULL),
(111, 'PAY-DZLV90E6EGAT', 4, 1, 6, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/2/DFAD7221', 'https://api.moip.com.br/v2/boleto/BOL-U34G5U6IP7BY/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-08-26', '2020-08-26 17:21:36', '2020-08-26 17:21:36', '2020-08-26 20:21:42', '2020-08-31 12:27:02', '', '', '', '', '', 1, 1, NULL, NULL, NULL, NULL),
(112, 'PAY-BA2CQOK0OYRQ', 2, NULL, 25, NULL, 3, NULL, 4, '43.31', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/562D4773', NULL, NULL, '295.20', '245.00', '50.20', '0.00', '0.0300', '3.51', NULL, NULL, '0.00', '245.00', 12, NULL, '2020-10-15', '2020-10-15 16:41:35', '2020-10-15 16:41:35', '2020-10-15 19:41:37', '2020-10-15 19:41:37', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(113, 'PAY-DS54T4XUL9YX', 2, NULL, 25, NULL, 3, NULL, 4, '43.31', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/562D4773', NULL, NULL, '295.20', '245.00', '50.20', '0.00', '0.0300', NULL, '6.90', '17.91', '0.00', '227.90', 12, NULL, '2020-10-15', '2020-10-15 16:45:39', '2020-10-15 16:45:39', '2020-10-15 19:45:41', '2020-10-15 19:45:41', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(114, 'PAY-CYCIU55H9LZN', 4, 1, 26, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-ELLK5BAT9RLD/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-10-16', '2020-10-16 09:28:44', '2020-10-16 09:28:44', '2020-10-16 12:28:49', '2020-11-06 14:58:27', '', '', '', '', '', 1, 1, NULL, NULL, NULL, NULL),
(115, 'PAY-FKVFONTC4NT5', 4, 1, 26, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-XULN9SAXRZ70/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '147.00', 1, NULL, '2020-10-16', NULL, '2020-10-16 09:31:46', '2020-10-16 12:31:51', '2020-10-16 12:31:51', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(116, 'PAY-SXXNZY2QT4DK', 4, 1, 26, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-UVRPGU3K6RFZ/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '147.00', 1, NULL, '2020-10-16', NULL, '2020-10-16 10:07:12', '2020-10-16 13:07:16', '2020-10-16 13:07:16', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(117, 'PAY-WY2CM5J2QYWO', 4, 1, 26, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-PEGA8HCHU8IF/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '147.00', 1, NULL, '2020-10-16', NULL, '2020-10-16 10:09:14', '2020-10-16 13:09:18', '2020-10-16 13:09:18', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(118, 'PAY-HUGAX9ZE3YE7', 4, 1, 26, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-7687MNHUP2M1/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '1.00', '0.00', '147.00', 1, NULL, '2020-10-16', NULL, '2020-10-16 10:13:22', '2020-10-16 13:13:26', '2020-10-16 13:13:26', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(119, 'PAY-OD5L84IJMOLE', 4, 1, 26, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-XK8N3MFD8Q83/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '1.00', '0.00', '147.00', 1, NULL, '2020-10-16', NULL, '2020-10-16 10:14:24', '2020-10-16 13:14:28', '2020-10-16 13:14:28', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(120, 'PAY-EU5LWKL7CH5P', 4, 1, 26, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-ZS6U97DZKDT9/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '147.00', 1, NULL, '2020-10-16', NULL, '2020-10-16 10:31:12', '2020-10-16 13:31:17', '2020-10-16 13:31:17', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(121, 'PAY-DX1JKRB3PV6M', 2, NULL, 27, NULL, 3, NULL, 4, '51.45', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-X0CBQGCKPQH3/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '245.00', 1, NULL, '2020-10-16', NULL, '2020-10-16 15:04:00', '2020-10-16 18:04:03', '2020-10-16 18:04:03', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(122, 'PAY-J4SNJJZEKQMW', 2, NULL, 28, NULL, 3, NULL, 4, '51.45', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-1XBKGFAKPILS/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '245.00', 1, NULL, '2020-10-16', NULL, '2020-10-16 15:16:48', '2020-10-16 18:16:52', '2020-10-16 18:16:52', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(123, 'PAY-3BJ8QFB454A5', 2, NULL, 28, NULL, 3, NULL, 4, '51.45', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-5U7XRBGFUW9V/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '245.00', 1, NULL, '2020-10-16', NULL, '2020-10-16 15:19:58', '2020-10-16 18:20:02', '2020-10-16 18:20:02', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(124, 'PAY-D239FO15TCE1', 2, NULL, 28, NULL, 3, NULL, 4, '51.45', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-LSMMYTYJXE0A/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '245.00', 1, NULL, '2020-10-16', NULL, '2020-10-16 15:20:54', '2020-10-16 18:20:58', '2020-10-16 18:20:58', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(125, 'PAY-0M7N5F5DMP4N', 2, NULL, 28, NULL, 3, NULL, 4, '51.45', 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-H0YK44ZPV7J0/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-10-16', '2020-10-16 15:22:50', '2020-10-16 15:22:50', '2020-10-16 18:22:54', '2020-10-16 18:22:54', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `vendas` (`id`, `transacao`, `produto`, `plano`, `comprador`, `endereco`, `produtor`, `campanha`, `afiliado`, `comissao_afiliado`, `meio_pagamento`, `forma_pagamento`, `status_transacao`, `motivo`, `url_checkout`, `link_boleto`, `linha_digitavel`, `valor_bruto`, `valor_produto`, `valor_juros`, `valor_frete`, `taxa_juros`, `valor_taxa`, `taxa_octapay`, `valor_octapay`, `valor_desconto`, `valor_liquido`, `parcelas`, `data_vencimento`, `data_pedido`, `data_finalizada`, `data_ultimo_evento`, `created_at`, `updated_at`, `src`, `utm_source`, `utm_campaign`, `utm_medium`, `utm_content`, `st4rt`, `postback_st4rt`, `carrinho_abandonado`, `coprodutores`, `ip`, `coprodutor`) VALUES
(126, 'PAY-PDL1IXODCS0H', 2, NULL, 32, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-KWTS2S9OA70B/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-11-03', NULL, '2020-11-03 12:27:17', '2020-11-03 15:27:21', '2020-11-03 15:27:21', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(127, 'PAY-JJM5FORP2UH7', 2, NULL, 33, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-KTIHNBSJUH6K/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-11-03', NULL, '2020-11-03 12:42:00', '2020-11-03 15:42:05', '2020-11-03 15:42:05', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(128, 'PAY-1U5HCTEFRTGR', 2, NULL, 34, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-ZHGPABDSAEU5/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-11-03', NULL, '2020-11-03 12:45:58', '2020-11-03 15:46:03', '2020-11-03 15:46:03', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(129, 'PAY-AE1TGYTLAE77', 2, NULL, 35, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-2C4SJ7C86P7C/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-11-03', NULL, '2020-11-03 12:48:14', '2020-11-03 15:48:19', '2020-11-03 15:48:19', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(130, 'PAY-73E6XKGDMMAT', 4, 1, 34, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-NRN3SKAJD1SY/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.99', '11.28', '20.00', '115.72', 1, NULL, '2020-11-11', NULL, '2020-11-11 11:01:15', '2020-11-11 14:01:21', '2020-11-11 14:01:21', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(131, 'PAY-4EU02UV7CWY0', 4, 1, 34, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-N4BOO48YSI22/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.99', '11.28', '20.00', '115.72', 1, NULL, '2020-11-11', '2020-11-11 11:03:03', '2020-11-11 11:03:03', '2020-11-11 14:03:08', '2021-01-08 18:24:18', '', '', '', '', '', 1, 1, NULL, NULL, NULL, NULL),
(132, 'PAY-A5O6PO42OXP9', 4, 1, 35, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '177.12', '147.00', '30.12', '0.00', '0.0299', NULL, '6.99', '11.28', '20.00', '115.72', 12, NULL, '2020-11-11', '2020-11-11 11:28:27', '2020-11-11 11:28:27', '2020-11-11 14:28:29', '2021-01-08 18:24:18', '', '', '', '', '', 1, 1, NULL, NULL, NULL, NULL),
(133, 'PAY-621R5EG5VQMH', 5, 8, 32, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/C755A006', NULL, NULL, '237.36', '197.00', '40.36', '0.00', '0.0299', NULL, '6.99', '14.77', '19.70', '162.53', 12, NULL, '2020-11-11', '2020-11-11 11:44:02', '2020-11-11 11:44:02', '2020-11-11 14:44:04', '2020-11-11 14:44:04', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(134, 'PAY-NHMJKJYHPGY8', 5, 8, 32, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/C755A006', 'https://sandbox.moip.com.br/v2/boleto/BOL-HW7PRKH2FTVL/print', NULL, '197.00', '197.00', '0.00', '0.00', '0.0000', NULL, '6.99', '14.77', '0.00', '182.23', 1, NULL, '2020-11-11', NULL, '2020-11-11 11:52:12', '2020-11-11 14:52:15', '2020-11-11 14:52:15', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(135, 'PAY-FM2D7XJTHR7U', 5, 8, 32, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/C755A006', NULL, NULL, '217.66', '197.00', '20.66', '0.00', '0.0299', NULL, '6.99', '14.77', '19.70', '162.53', 12, NULL, '2020-11-11', '2020-11-11 11:59:42', '2020-11-11 11:59:42', '2020-11-11 14:59:44', '2020-11-11 14:59:44', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(136, 'PAY-EZ1D5PC2822L', 5, 8, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/283DD590', 'https://sandbox.moip.com.br/v2/boleto/BOL-WFYISZWE3O7M/print', NULL, '1.97', '197.00', '0.00', '0.00', '0.0000', NULL, '6.99', '14.77', '0.00', '182.23', 1, NULL, '2020-11-11', NULL, '2020-11-11 12:38:02', '2020-11-11 15:38:05', '2020-11-11 15:38:05', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(137, 'PAY-3HY403FMVN5Q', 5, 8, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/283DD590', 'https://sandbox.moip.com.br/v2/boleto/BOL-H8AUS743FK5W/print', NULL, '19700.00', '197.00', '0.00', '0.00', '0.0000', NULL, '6.99', '14.77', '0.00', '182.23', 1, NULL, '2020-11-11', NULL, '2020-11-11 12:45:59', '2020-11-11 15:46:02', '2020-11-11 15:46:02', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(138, 'PAY-PPCRGBL9A9M0', 5, 8, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/283DD590', 'https://sandbox.moip.com.br/v2/boleto/BOL-Z1MSDWOCX5AY/print', NULL, '17730.00', '197.00', '0.00', '0.00', '0.0000', NULL, '6.99', '14.77', '19.70', '162.53', 1, NULL, '2020-11-11', NULL, '2020-11-11 12:48:01', '2020-11-11 15:48:04', '2020-11-11 15:48:04', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(139, 'PAY-P0TDZRSR5T75', 5, 8, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/283DD590', 'https://sandbox.moip.com.br/v2/boleto/BOL-M85E831UAXPU/print', NULL, '177.30', '197.00', '0.00', '0.00', '0.0000', NULL, '6.99', '14.77', '19.70', '162.53', 1, NULL, '2020-11-11', NULL, '2020-11-11 12:56:25', '2020-11-11 15:56:29', '2020-11-11 15:56:29', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(140, 'PAY-BP4J2KJMWBP4', 5, 8, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/283DD590', NULL, NULL, '211.10', '197.00', '14.10', '0.00', '0.0299', NULL, '6.99', '14.77', '19.70', '162.53', 10, NULL, '2020-11-11', '2020-11-11 12:57:21', '2020-11-11 12:57:21', '2020-11-11 15:57:24', '2020-11-11 15:57:24', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(141, 'PAY-JPSXFDLZP29M', 5, 8, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/283DD590', NULL, NULL, '211.10', '197.00', '14.10', '0.00', '0.0299', NULL, '6.99', '14.77', '19.70', '162.53', 10, NULL, '2020-11-11', '2020-11-11 13:09:38', '2020-11-11 13:09:38', '2020-11-11 16:09:41', '2020-11-11 16:09:41', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(142, 'PAY-I0KCFVIHV9Q0', 2, NULL, 32, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-YY4PN3Q8FVWW/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.99', '18.13', '0.00', '226.87', 1, NULL, '2020-11-13', NULL, '2020-11-13 12:14:53', '2020-11-13 15:14:56', '2020-11-13 15:14:56', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(143, 'PAY-RTRTDG0A40KM', 2, NULL, 28, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-UFQSYDMDDY7M/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.99', '18.13', '0.00', '226.87', 1, NULL, '2020-11-17', NULL, '2020-11-17 12:51:18', '2020-11-17 15:51:22', '2020-11-27 18:18:22', '', '', '', '', '', 0, 0, NULL, NULL, NULL, NULL),
(144, 'PAY-XK2ITRO92HK6', 4, 3, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-QRPXD2E4U37K/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-11-26', NULL, '2020-11-26 09:34:17', '2020-11-26 12:34:22', '2020-11-27 18:18:22', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(145, 'PAY-S2OV19BUEWF3', 4, 3, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-DBIR7WFF3NVL/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-11-26', NULL, '2020-11-26 09:39:32', '2020-11-26 12:39:36', '2020-11-26 12:39:36', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(146, 'PAY-HFVCQLE54EVU', 4, 3, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-YUWBFALH62YD/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-11-27', NULL, '2020-11-27 15:20:46', '2020-11-27 18:20:56', '2020-11-27 18:21:41', '', '', '', '', '', 1, 0, NULL, NULL, NULL, NULL),
(147, 'PAY-DN5MPJFRYO5N', 4, 3, 4, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-W3N0I4RYT3MJ/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-11-27', NULL, '2020-11-27 16:01:43', '2020-11-27 19:01:49', '2020-11-27 19:01:49', '', '', '', '', '', 1, 0, 28, NULL, NULL, NULL),
(148, 'PAY-TAZJ0IGJG38Y', 4, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-MEX9DDIU8RLN/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-02', '2020-12-02 17:16:19', '2020-12-02 17:16:19', '2020-12-02 20:16:24', '2021-01-08 18:24:18', '', '', '', '', '', 1, 1, 29, NULL, NULL, NULL),
(149, 'PAY-PMNFFJI02Y4S', 4, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-QL603GUNXE2E/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-02', '2020-12-02 17:20:09', '2020-12-02 17:20:09', '2020-12-02 20:20:13', '2021-01-08 18:24:18', '', '', '', '', '', 1, 1, 0, NULL, NULL, NULL),
(150, 'PAY-3CA9148D53NO', 4, NULL, 6, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-7YPXBD8F91TZ/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-02', '2020-12-02 18:46:49', '2020-12-02 18:46:49', '2020-12-02 21:46:53', '2021-01-08 18:24:18', '', '', '', '', '', 1, 1, 30, NULL, NULL, NULL),
(151, 'PAY-B0Y88YQV9K2I', 4, NULL, 32, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-J2FPB0Z3KJ4D/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-02', '2020-12-02 18:50:03', '2020-12-02 18:50:03', '2020-12-02 21:50:07', '2021-01-08 18:24:18', '', '', '', '', '', 1, 1, 0, NULL, NULL, NULL),
(152, 'PAY-Y7LNNESXXUZY', 4, NULL, 32, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-5WCL9QUYOCXT/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-02', '2020-12-02 18:51:11', '2020-12-02 18:51:11', '2020-12-02 21:51:15', '2021-01-08 18:24:19', '', '', '', '', '', 1, 1, 0, NULL, NULL, NULL),
(153, 'PAY-NRB3HQ10RRK4', 4, NULL, 32, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-MZ6LMJ8KZ2KX/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-02', '2020-12-02 18:59:46', '2020-12-02 18:59:46', '2020-12-02 21:59:50', '2021-01-08 18:24:19', '', '', '', '', '', 1, 1, 0, NULL, NULL, NULL),
(154, 'PAY-ILLHDDENLZ1K', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-XX965B5CSPK5/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-02', NULL, '2020-12-02 19:04:01', '2020-12-02 22:04:06', '2020-12-02 22:04:06', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(155, 'PAY-FZ0ARHK64ZO1', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-7FKPB6C0TG65/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-02', NULL, '2020-12-02 19:05:31', '2020-12-02 22:05:35', '2020-12-02 22:05:35', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(156, 'PAY-GBHXQR87SR59', 4, NULL, 34, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-HZMQ26VWVWWN/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-02', NULL, '2020-12-02 19:08:17', '2020-12-02 22:08:21', '2020-12-02 22:08:21', '', '', '', '', '', 1, 0, 31, NULL, NULL, NULL),
(157, 'PAY-9ZZXMIU2N1OI', 4, NULL, 34, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-0MV04NM7YDG2/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-02', NULL, '2020-12-02 19:09:40', '2020-12-02 22:09:45', '2020-12-02 22:09:45', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(158, 'PAY-RQWBWG7PXXZ4', 4, NULL, 34, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-1SMDH0DPAUH6/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-02', NULL, '2020-12-02 19:11:33', '2020-12-02 22:11:36', '2020-12-02 22:11:36', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(159, 'PAY-1XD3PGVG51M2', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-IEEOFIDNNUSD/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-02', NULL, '2020-12-02 19:12:21', '2020-12-02 22:12:24', '2020-12-02 22:12:24', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(160, 'PAY-1R8OST6HBBHC', 4, NULL, 35, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-1S7D8ZFBT5CD/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 10:24:13', '2020-12-03 13:24:17', '2020-12-03 13:24:17', '', '', '', '', '', 1, 0, 32, NULL, NULL, NULL),
(161, 'PAY-P90P0C1D6ZJF', 4, NULL, 35, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-GG4JJ06EKHXO/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 10:31:06', '2020-12-03 13:31:10', '2020-12-03 13:31:10', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(162, 'PAY-ZIZXEB0A3A98', 4, NULL, 35, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-JRS722W87N0D/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 10:31:47', '2020-12-03 13:31:51', '2020-12-03 13:31:51', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(163, 'PAY-QH7WHVYH9HD0', 4, NULL, 35, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-ME59O4FNJOZB/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 10:33:31', '2020-12-03 13:33:34', '2020-12-03 13:33:34', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(164, 'PAY-6NGIURR1AQAJ', 4, NULL, 35, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-2OQKSNOQMTF7/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 10:40:43', '2020-12-03 13:40:46', '2020-12-03 13:40:46', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(165, 'PAY-TDKZVMN1LN0W', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-4ONZXKTJ5J9I/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 10:44:35', '2020-12-03 13:44:38', '2020-12-03 13:44:38', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(166, 'PAY-9YUK39OA55UQ', 2, NULL, 34, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-NPRV0KZYMOOI/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 10:47:30', '2020-12-03 13:47:35', '2020-12-03 13:47:35', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(167, 'PAY-Y75UOEW1Q9ON', 2, NULL, 34, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-5CMIZQEQFYDW/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 10:49:54', '2020-12-03 13:49:57', '2020-12-03 13:49:57', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(168, 'PAY-H3RGGGFSTMJ7', 2, NULL, 34, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-DPJ791QFPO23/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 10:50:18', '2020-12-03 13:50:21', '2020-12-03 13:50:21', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(169, 'PAY-4NT6CN9B8SKU', 2, NULL, 32, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-LTQWNAIGHX79/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 10:58:17', '2020-12-03 13:58:19', '2020-12-03 13:58:19', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(170, 'PAY-92Q28REENB66', 2, NULL, 32, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-Z0MFCRVIOFO4/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 10:59:36', '2020-12-03 13:59:39', '2020-12-03 13:59:39', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(171, 'PAY-PS6BMRT3O2IF', 2, NULL, 32, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-AA64JJZ676UT/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:00:50', '2020-12-03 14:00:52', '2020-12-03 14:00:52', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(172, 'PAY-3M6HE4NC48GH', 2, NULL, 32, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-RSY7OTF51NHD/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:18:02', '2020-12-03 14:18:05', '2020-12-03 14:18:05', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(173, 'PAY-YD3H9FK01YN0', 2, NULL, 32, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-2S7SI8TT5NET/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:25:11', '2020-12-03 14:25:14', '2020-12-03 14:25:14', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(174, 'PAY-YXCPQYTUDBC6', 2, NULL, 32, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-3IW8L0V54MDH/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:26:11', '2020-12-03 14:26:14', '2020-12-03 14:26:14', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(175, 'PAY-S3VR2BBYMPEC', 2, NULL, 32, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-6V8O0SFF8P8B/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:32:14', '2020-12-03 14:32:16', '2020-12-03 14:32:16', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(176, 'PAY-5ROYOIOOTFQT', 2, NULL, 32, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-4EGA9CED1AVH/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:32:32', '2020-12-03 14:32:35', '2020-12-03 14:32:35', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(177, 'PAY-BVKY4R2TSBRZ', 2, NULL, 32, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-7ECSOU2Y99CU/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:36:40', '2020-12-03 14:36:43', '2020-12-03 14:36:43', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(178, 'PAY-1WFQW35BKIXO', 2, NULL, 1, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-T1OPUF8Q6QFI/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:37:27', '2020-12-03 14:37:29', '2020-12-03 14:37:29', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(179, 'PAY-QXNMBHDOQ7P4', 2, NULL, 1, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-7K7M8875YM12/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:38:29', '2020-12-03 14:38:31', '2020-12-03 14:38:31', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(180, 'PAY-F52SSPVPZT47', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-CAL6FZUGYB34/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:40:54', '2020-12-03 14:40:57', '2020-12-03 14:40:57', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(181, 'PAY-AIL7FUD13KAN', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-3CFE9X3Z8TQV/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:42:43', '2020-12-03 14:42:46', '2020-12-03 14:42:46', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(182, 'PAY-3FTPHMBVM1GG', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-UZBJCEIZHB35/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:43:37', '2020-12-03 14:43:40', '2020-12-03 14:43:40', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(183, 'PAY-FOISSADLLAN5', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-SCJY2PVJO9M2/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:47:33', '2020-12-03 14:47:35', '2020-12-03 14:47:35', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(184, 'PAY-W5PDEBD7QB4I', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-S75CN5QLKB09/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:49:42', '2020-12-03 14:49:45', '2020-12-03 14:49:45', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(185, 'PAY-8HPBF9NE39O3', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-W9GZZ0JXW23T/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:51:15', '2020-12-03 14:51:19', '2020-12-03 14:51:19', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(186, 'PAY-N6670A5U4KMI', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-E189Z60E13WI/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:53:44', '2020-12-03 14:53:47', '2020-12-03 14:53:47', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(187, 'PAY-RBTYV363RFMM', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-1Y0BY62JXQAA/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:55:12', '2020-12-03 14:55:15', '2020-12-03 14:55:15', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(188, 'PAY-IGP3ZK0DYJ2G', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-YTLH89QV5TN7/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:56:04', '2020-12-03 14:56:06', '2020-12-03 14:56:06', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(189, 'PAY-8FDDD6EDND2P', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-IVUF7EK5VC4N/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:57:47', '2020-12-03 14:57:49', '2020-12-03 14:57:49', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(190, 'PAY-7BS5VUSM8YVJ', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-K75HRPEMRY5L/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:58:38', '2020-12-03 14:58:41', '2020-12-03 14:58:41', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(191, 'PAY-BF19E81M3FRK', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-6VEVIB9TV2CL/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 11:59:43', '2020-12-03 14:59:46', '2020-12-03 14:59:46', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(192, 'PAY-NCM2LXAIVXGT', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-9PSKVQWC4JOR/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:02:13', '2020-12-03 15:02:15', '2020-12-03 15:02:15', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(193, 'PAY-733UPCXM9MZU', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-ODPFKH9L2HZZ/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:03:38', '2020-12-03 15:03:40', '2020-12-03 15:03:40', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(194, 'PAY-F3NQB3ML9JR4', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-UI04IAUPVGB4/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:05:00', '2020-12-03 15:05:03', '2020-12-03 15:05:03', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(195, 'PAY-T1CGQAFC5SO9', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-NUTU7NVNASHL/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:05:55', '2020-12-03 15:05:57', '2020-12-03 15:05:57', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(196, 'PAY-XC8N5YU825KB', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-3O5YA3D14075/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:13:31', '2020-12-03 15:13:33', '2020-12-03 15:13:33', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(197, 'PAY-SFPG19E473N3', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-BL99C8A5EAQX/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:17:44', '2020-12-03 15:17:46', '2020-12-03 15:17:46', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(198, 'PAY-NZH3TII6N04A', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-I3Y11KD191NT/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:19:02', '2020-12-03 15:19:05', '2020-12-03 15:19:05', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(199, 'PAY-26OXAD5EQALL', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-WQP47RWM5JKV/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:20:42', '2020-12-03 15:20:45', '2020-12-03 15:20:45', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(200, 'PAY-ISINBEUTXFQE', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-2YFVQTX261XR/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:25:17', '2020-12-03 15:25:21', '2020-12-03 15:25:21', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(201, 'PAY-YPQXSMRSHLDS', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-1D6JUNN9BKWP/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:36:27', '2020-12-03 15:36:30', '2020-12-03 15:36:30', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(202, 'PAY-E770IS7GOM53', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-SHQ3WKM1ZCCV/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:37:15', '2020-12-03 15:37:17', '2020-12-03 15:37:17', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(203, 'PAY-RX8DSJBA5HK4', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-29RDNPMJP5QV/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:43:39', '2020-12-03 15:43:42', '2020-12-03 15:43:42', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(204, 'PAY-5339NPM8913A', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-YHCDZ5G9D8OB/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 12:44:15', '2020-12-03 15:44:18', '2020-12-03 15:44:18', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(205, 'PAY-UH7FY8678SGG', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-G2K0BIX3OHK9/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 13:19:49', '2020-12-03 16:19:53', '2020-12-03 16:19:53', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(206, 'PAY-SDMAHCMZ4HYO', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-9HVNES53KAKX/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 13:22:07', '2020-12-03 16:22:11', '2020-12-03 16:22:11', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(207, 'PAY-VG5R1HB4PSKV', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-DMRRSLISVHCJ/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 13:25:42', '2020-12-03 16:25:46', '2020-12-03 16:25:46', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(208, 'PAY-QCXG5Z4J4CVH', 4, NULL, 32, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-721H9UK33J5Z/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-03', NULL, '2020-12-03 13:26:18', '2020-12-03 16:26:21', '2020-12-03 16:26:21', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(209, 'PAY-0DK0WHUK8KEK', 4, NULL, 32, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/DFAD7221', NULL, NULL, '275.20', '245.00', '30.20', '0.00', '0.0299', NULL, '6.90', '17.91', '20.00', '207.09', 12, NULL, '2020-12-03', '2020-12-03 15:28:10', '2020-12-03 15:28:10', '2020-12-03 18:28:13', '2020-12-03 18:28:13', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(210, 'PAY-34AZFGQIGLFI', 4, NULL, 4, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/DFAD7221', 'https://sandbox.moip.com.br/v2/boleto/BOL-0J7Q81P8WV6M/print', NULL, '225.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '20.00', '207.09', 1, NULL, '2020-12-04', NULL, '2020-12-04 16:57:29', '2020-12-04 19:57:34', '2020-12-04 19:57:34', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(211, 'PAY-CJNP3WO8NL2M', 4, 3, 4, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-6XTFDSS9ONA5/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-12-08', NULL, '2020-12-08 15:16:04', '2020-12-08 18:16:09', '2020-12-08 18:16:09', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(212, 'PAY-150WYUUY55L9', 4, 3, 4, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-E87D42YSQLYN/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-12-08', NULL, '2020-12-08 15:24:28', '2020-12-08 18:24:33', '2020-12-08 18:24:33', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(213, 'PAY-M8RLRQCEHB3Z', 4, 3, 4, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-3IQOB8A47XJ3/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-12-08', NULL, '2020-12-08 15:25:14', '2020-12-08 18:25:19', '2020-12-08 18:25:19', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(214, 'PAY-W0J8GX6PZMCL', 4, 3, 4, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-OIS0LK1A8JKU/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-12-08', NULL, '2020-12-08 16:12:31', '2020-12-08 19:12:36', '2020-12-08 19:12:36', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(215, 'PAY-96F558UOKSIT', 4, 3, 4, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-S463SCGWUBWY/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-12-08', NULL, '2020-12-08 16:18:14', '2020-12-08 19:18:20', '2020-12-08 19:18:20', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(216, 'PAY-VFP9EIWLYO1U', 4, 3, 4, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-8RZ2JKP4HGTM/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-12-08', NULL, '2020-12-08 16:19:09', '2020-12-08 19:19:13', '2020-12-08 19:19:13', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(217, 'PAY-XF8GNG6JFNS6', 4, 3, 4, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-AOVNVC15Z46U/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-12-08', NULL, '2020-12-08 16:25:50', '2020-12-08 19:25:55', '2020-12-08 19:25:55', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(218, 'PAY-3M3MNHA2UM20', 4, 3, 1, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-O28D1CIAKI02/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, '2021-01-17', '2020-12-08', NULL, '2020-12-08 16:40:35', '2020-12-08 19:40:39', '2021-01-12 18:58:40', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(219, 'PAY-7YLV8IQK0QJ9', 4, 3, 4, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-71DYKUO6V4OK/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, NULL, '2020-12-08', NULL, '2020-12-08 18:19:15', '2020-12-08 21:19:21', '2020-12-08 21:19:21', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(220, 'PAY-3NZGO5AJ8B9D', 4, 3, 4, NULL, 12, NULL, 4, '30.00', 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/4AC57520', 'https://sandbox.moip.com.br/v2/boleto/BOL-K2TGR951U5QC/print', NULL, '147.00', '147.00', '0.00', '0.00', '0.0000', NULL, '6.90', '11.14', '0.00', '135.86', 1, '2021-01-17', '2020-12-08', NULL, '2020-12-08 18:24:46', '2020-12-08 21:24:51', '2021-01-12 18:55:25', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(221, 'PAY-H4OFWSU44OYA', 2, NULL, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-U7RYM4BHQDHS/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-08', NULL, '2020-12-08 18:31:56', '2020-12-08 21:32:01', '2020-12-08 21:32:01', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(222, 'PAY-TXQ6MJMOA5FJ', 2, NULL, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-4DVFQCBKUGPC/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-08', NULL, '2020-12-08 18:45:24', '2020-12-08 21:45:29', '2020-12-08 21:45:29', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(223, 'PAY-C7OXHR3FOE28', 2, NULL, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-3CVJBGVRTW8O/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, '2021-01-17', '2020-12-09', NULL, '2020-12-09 16:16:52', '2020-12-09 19:16:57', '2021-01-12 18:54:00', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(224, 'PAY-NDBP52C7RJWG', 2, NULL, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-RKD4C378NEUS/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, '2021-01-17', '2020-12-09', NULL, '2020-12-09 16:20:19', '2020-12-09 19:20:24', '2021-01-12 18:51:58', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(225, 'PAY-JX22ZAKX33EK', 2, NULL, 32, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-PIHQS4OFW56D/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-09', NULL, '2020-12-09 16:21:41', '2020-12-09 19:21:45', '2020-12-09 19:21:45', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(226, 'PAY-4A1927ONPVOL', 2, NULL, 1, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-FQGV1TOLUJQ0/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-09', NULL, '2020-12-09 16:22:11', '2020-12-09 19:22:16', '2020-12-11 23:04:04', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(227, 'PAY-T8M9SVWQSA0M', 2, NULL, 4, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 5, NULL, 'localhost/octapay/checkout/562D4773', 'https://sandbox.moip.com.br/v2/boleto/BOL-2F1KQKO6AW0M/print', NULL, '245.00', '245.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.91', '0.00', '227.09', 1, NULL, '2020-12-09', NULL, '2020-12-09 16:55:02', '2020-12-09 19:55:07', '2020-12-11 21:46:11', '', '', '', '', '', 1, 0, 0, NULL, NULL, NULL),
(228, 'PAY-CQ28IQDNQTVA', 3, NULL, 13, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/81B2A2FF', 'https://sandbox.moip.com.br/v2/boleto/BOL-WFVY0N6APGJK/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.15', '0.00', '216.85', 1, '2021-01-13', '2020-12-21', NULL, '2020-12-21 10:47:05', '2020-12-21 13:47:11', '2021-01-12 17:33:44', '', '', '', '', '', 0, 0, 33, NULL, NULL, NULL),
(229, 'PAY-27LJZ5YVG5OF', 5, 8, 13, NULL, 12, 28, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/283DD590?cp=482674', 'https://sandbox.moip.com.br/v2/boleto/BOL-2D24Z4O8UVD9/print', NULL, '177.30', '197.00', '0.00', '0.00', '0.0000', NULL, '6.90', '14.59', '19.70', '162.71', 1, '2021-01-02', '2020-12-28', NULL, '2020-12-28 12:53:19', '2020-12-28 15:53:33', '2020-12-28 15:53:33', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(230, 'PAY-LWCSIXK3FX5W', 5, 8, 13, NULL, 12, 28, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/283DD590?cp=482674', 'https://sandbox.moip.com.br/v2/boleto/BOL-MO82M3J5T4Z0/print', NULL, '177.30', '197.00', '0.00', '0.00', '0.0000', NULL, '6.90', '14.59', '19.70', '162.71', 1, '2021-01-02', '2020-12-28', NULL, '2020-12-28 12:53:35', '2020-12-28 15:53:45', '2020-12-28 15:53:45', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(231, 'PAY-35DJK9CMR5HR', 5, 8, 1, NULL, 12, 28, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/283DD590?cp=482674', 'https://sandbox.moip.com.br/v2/boleto/BOL-9U3UWA6N2GGA/print', NULL, '177.30', '197.00', '0.00', '0.00', '0.0000', NULL, '6.90', '14.59', '19.70', '162.71', 1, '2021-01-14', '2020-12-28', NULL, '2020-12-28 15:02:15', '2020-12-28 18:02:19', '2021-01-12 17:33:13', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(232, 'PAY-II2FZWK3FUAW', 3, NULL, 13, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/B3105BE3', 'https://sandbox.moip.com.br/v2/boleto/BOL-NKSOGEMMAQNJ/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.15', '0.00', '216.85', 1, '2021-01-02', '2020-12-28', NULL, '2020-12-28 17:33:43', '2020-12-28 20:33:49', '2020-12-28 20:33:49', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(233, 'PAY-DOG4IJ4V9EA4', 1, NULL, 32, NULL, 12, NULL, 25, '117.30', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-C3X288B0L70J/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-03', '2020-12-29', NULL, '2020-12-29 09:30:02', '2020-12-29 12:30:07', '2020-12-29 12:30:07', '', '', '', '', '', 0, 0, 37, NULL, NULL, NULL),
(234, 'PAY-C0MK9JGNFPVC', 1, NULL, 32, NULL, 12, 32, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5?cp=822138', 'https://sandbox.moip.com.br/v2/boleto/BOL-LOXOW63KKHDT/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-03', '2020-12-29', NULL, '2020-12-29 09:59:41', '2020-12-29 12:59:46', '2020-12-29 12:59:46', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(235, 'PAY-N5TK5CVE5NG1', 1, NULL, 32, NULL, 12, 32, 25, '117.30', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5?cp=822138', 'https://sandbox.moip.com.br/v2/boleto/BOL-QS06EYO1PRX9/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-03', '2020-12-29', NULL, '2020-12-29 10:03:58', '2020-12-29 13:04:05', '2020-12-29 13:04:05', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(236, 'PAY-4OB0MFOVSF5Q', 3, NULL, 1, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/B3105BE3', NULL, NULL, '281.88', '234.00', '47.88', '0.00', '0.0299', NULL, '6.90', '17.15', '0.00', '216.85', 12, '2021-01-09', '2021-01-04', '2021-01-04 10:17:35', '2021-01-04 10:17:35', '2021-01-04 13:17:37', '2021-01-04 13:17:37', '', '', '', '', '', 0, 0, 38, NULL, NULL, NULL),
(237, 'PAY-GQTU4UHWINOH', 3, NULL, 1, NULL, 3, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/B3105BE3', NULL, NULL, '281.88', '234.00', '47.88', '0.00', '0.0299', NULL, '6.90', '17.15', '0.00', '216.85', 12, '2021-01-09', '2021-01-04', '2021-01-04 10:49:31', '2021-01-04 10:49:31', '2021-01-04 13:49:36', '2021-01-04 13:49:36', '', '', '', '', '', 0, 0, 0, NULL, NULL, NULL),
(238, 'PAY-IW6R0O8QH2BQ', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 4, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-N3GB0VYESZ5F/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-10', '2021-01-05', '2021-01-05 16:45:37', '2021-01-05 16:45:37', '2021-01-05 19:45:42', '2021-01-05 19:45:42', '', '', '', '', '', 0, 0, 39, NULL, NULL, NULL),
(239, 'PAY-078VRHCE52BI', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-C6AUT1Z4SV8N/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-10', '2021-01-05', NULL, '2021-01-05 19:10:51', '2021-01-05 22:10:55', '2021-01-05 22:10:55', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(240, 'PAY-2OCYPJ3OEH49', 3, NULL, 1, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/81B2A2FF', 'https://sandbox.moip.com.br/v2/boleto/BOL-GIBHCRTAJFCG/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.15', '0.00', '216.85', 1, '2021-01-12', '2021-01-07', NULL, '2021-01-07 17:44:32', '2021-01-07 20:44:37', '2021-01-07 20:44:37', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL);
INSERT INTO `vendas` (`id`, `transacao`, `produto`, `plano`, `comprador`, `endereco`, `produtor`, `campanha`, `afiliado`, `comissao_afiliado`, `meio_pagamento`, `forma_pagamento`, `status_transacao`, `motivo`, `url_checkout`, `link_boleto`, `linha_digitavel`, `valor_bruto`, `valor_produto`, `valor_juros`, `valor_frete`, `taxa_juros`, `valor_taxa`, `taxa_octapay`, `valor_octapay`, `valor_desconto`, `valor_liquido`, `parcelas`, `data_vencimento`, `data_pedido`, `data_finalizada`, `data_ultimo_evento`, `created_at`, `updated_at`, `src`, `utm_source`, `utm_campaign`, `utm_medium`, `utm_content`, `st4rt`, `postback_st4rt`, `carrinho_abandonado`, `coprodutores`, `ip`, `coprodutor`) VALUES
(241, 'PAY-1FTVHRJXZN9R', 3, NULL, 1, NULL, 3, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/81B2A2FF', 'https://sandbox.moip.com.br/v2/boleto/BOL-ESZ0U2M8K27K/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.15', '0.00', '216.85', 1, '2021-01-12', '2021-01-07', NULL, '2021-01-07 17:48:04', '2021-01-07 20:48:08', '2021-01-07 20:48:08', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(242, 'PAY-O8I3OSBF1US9', 3, NULL, 1, NULL, 3, 38, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/81B2A2FF', 'https://sandbox.moip.com.br/v2/boleto/BOL-5YVQ0A1YKWD1/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.90', '17.15', '0.00', '216.85', 1, '2021-01-12', '2021-01-07', NULL, '2021-01-07 17:57:27', '2021-01-07 20:57:32', '2021-01-07 20:57:32', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(243, 'PAY-ZFBIG8P5DSR9', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-WFB9EPMZ85KV/print', NULL, '343.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-16', '2021-01-11', NULL, '2021-01-11 15:23:35', '2021-01-11 18:23:41', '2021-01-11 18:23:41', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(244, 'PAY-6H2ZNOC74YLV', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-XPHGX3VF66SN/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-16', '2021-01-11', NULL, '2021-01-11 15:25:07', '2021-01-11 18:25:16', '2021-01-11 18:25:16', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(245, 'PAY-691RULZHXDIR', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-FU9KQA6Y7H36/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-16', '2021-01-11', NULL, '2021-01-11 15:28:29', '2021-01-11 18:28:34', '2021-01-11 18:28:34', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(246, 'PAY-892HL8LGBIIN', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-I5HH1GCN8NEH/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-16', '2021-01-11', NULL, '2021-01-11 16:42:58', '2021-01-11 19:43:05', '2021-01-11 19:43:05', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(247, 'PAY-8QWXLA6A2SB9', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-R41MTCGDPARW/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-16', '2021-01-11', NULL, '2021-01-11 17:08:58', '2021-01-11 20:09:03', '2021-01-11 20:09:03', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(248, 'PAY-IWLXBPXGQ4B8', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-Z2PTNW8RJOTL/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-16', '2021-01-11', NULL, '2021-01-11 17:12:33', '2021-01-11 20:12:37', '2021-01-11 20:12:37', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(249, 'PAY-TLQW2HZ4MKMM', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-QWP7CSZHPMC9/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-16', '2021-01-11', NULL, '2021-01-11 17:13:59', '2021-01-11 20:14:05', '2021-01-11 20:14:05', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(250, 'PAY-KHWFMIVUBYAF', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-5HCSWCX7W6AC/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-16', '2021-01-11', NULL, '2021-01-11 17:17:52', '2021-01-11 20:17:56', '2021-01-11 20:17:56', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(251, 'PAY-2WAPOEFWAF08', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-MHHYUUWAJWFP/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-16', '2021-01-11', NULL, '2021-01-11 17:20:29', '2021-01-11 20:20:34', '2021-01-11 20:20:34', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(252, 'PAY-NWTQAHC6UVU4', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-WM8OHKYGLR2Z/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-17', '2021-01-12', NULL, '2021-01-12 09:59:13', '2021-01-12 12:59:17', '2021-01-12 17:27:08', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(253, 'PAY-V80L9IJJ9UAU', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-7XT1O4OX3JOQ/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-15', '2021-01-12', NULL, '2021-01-12 15:37:49', '2021-01-12 18:37:59', '2021-01-12 18:41:45', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(254, 'PAY-3KAKFILNF9NX', 5, 8, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/C755A006', 'https://sandbox.moip.com.br/v2/boleto/BOL-2IIIYQTFWFK1/print', NULL, '177.30', '197.00', '0.00', '0.00', '0.0000', NULL, '6.90', '14.59', '0.00', '182.41', 1, '2021-01-18', '2021-01-13', NULL, '2021-01-13 17:18:36', '2021-01-13 20:18:45', '2021-01-13 20:18:45', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(255, 'PAY-LZOJIEF3T3FX', 5, 13, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/C0CE93AD', NULL, NULL, '357.84', '297.00', '60.84', '0.00', '0.0299', NULL, '6.90', '21.49', '0.00', '275.51', 12, '2021-01-18', '2021-01-13', '2021-01-13 17:48:22', '2021-01-13 17:48:22', '2021-01-13 20:48:25', '2021-01-13 20:48:25', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(256, 'PAY-K66ML64GO9TA', 5, 13, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/C0CE93AD', NULL, NULL, '357.84', '297.00', '60.84', '0.00', '0.0299', NULL, '6.90', '21.49', '0.00', '275.51', 12, '2021-01-18', '2021-01-13', '2021-01-13 17:53:33', '2021-01-13 17:53:33', '2021-01-13 20:53:38', '2021-01-13 20:53:38', '', '', '', '', '', 0, 0, 0, '/5//3//12/', NULL, NULL),
(257, 'PAY-9OAF4V36EKEN', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-YYWSGO35RT05/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-16', '2021-01-15', NULL, '2021-01-15 11:47:20', '2021-01-15 14:47:24', '2021-01-15 14:47:24', '', '', '', '', '', 0, 0, 1, '/5//3//12/', NULL, NULL),
(258, 'PAY-I63VR2RB0TCR', 1, NULL, 1, NULL, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-7KPASXGK7ZZZ/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-17', '2021-01-16', NULL, '2021-01-16 14:41:56', '2021-01-16 17:42:03', '2021-01-16 17:42:03', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(259, 'PAY-ZVITHYJ6C20B', 1, NULL, 1, NULL, 12, 37, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-1GJSKSXQ05F4/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-19', '2021-01-18', NULL, '2021-01-18 12:43:35', '2021-01-18 15:43:45', '2021-01-18 15:43:45', '', '', '', '', '', 0, 0, 5, '/5//3//12/', NULL, NULL),
(260, 'PAY-FXJZNKE0G7IC', 1, NULL, 1, NULL, 12, 37, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-HOOAWZLFESO4/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-19', '2021-01-18', NULL, '2021-01-18 15:32:28', '2021-01-18 18:32:34', '2021-01-18 18:32:34', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(261, 'PAY-OYEJ5S1J1FZB', 1, NULL, 1, NULL, 12, 37, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-NPH0JQQ41E20/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-19', '2021-01-18', NULL, '2021-01-18 15:47:24', '2021-01-18 18:47:29', '2021-01-18 18:47:29', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(262, 'PAY-L2K7LARZMZHL', 1, NULL, 1, NULL, 12, 37, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-BOOTPRMD2EJU/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.90', '24.81', '0.00', '320.19', 1, '2021-01-19', '2021-01-18', NULL, '2021-01-18 15:50:43', '2021-01-18 18:50:49', '2021-01-18 18:50:49', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(263, 'PAY-ICQ2P54JHN0M', 1, NULL, 1, NULL, 12, 37, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-7VF8B1NOS2O6/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-20', '2021-01-19', NULL, '2021-01-19 18:33:21', '2021-01-19 21:33:27', '2021-01-19 21:33:27', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(264, 'PAY-D1AEKRL0GMFC', 1, NULL, 1, NULL, 12, 37, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '404.20', '345.00', '59.20', '0.00', '0.0299', NULL, '6.50', '25.67', '0.00', '353.83', 10, '2021-01-20', '2021-01-19', '2021-01-19 18:39:46', '2021-01-19 18:39:46', '2021-01-19 21:39:48', '2021-01-19 21:39:48', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(265, 'PAY-Q75OA9HA0JY6', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-LORDE3NR94JD/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-20', '2021-01-19', NULL, '2021-01-19 18:59:28', '2021-01-19 21:59:33', '2021-01-19 21:59:33', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(266, 'PAY-KZ5WRYG7K1UN', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-H4W0A0XB99PN/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 12:47:17', '2021-01-20 15:47:25', '2021-01-20 15:47:25', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(267, 'PAY-8NPCOLAG7O3P', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-ZT6ELV5DWMR9/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 12:51:36', '2021-01-20 15:51:40', '2021-01-20 15:51:40', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(268, 'PAY-NOPCW5VHP6WA', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-UG464HG41GX6/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 12:52:48', '2021-01-20 15:52:53', '2021-01-20 15:52:53', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(269, 'PAY-Q6H1ZVIXGTLD', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-JQ85RU1TCL5A/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 13:01:36', '2021-01-20 16:01:40', '2021-01-20 16:01:40', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(270, 'PAY-AXVM8HVDZDAZ', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-V5BS9VWJB94Q/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 15:01:42', '2021-01-20 18:01:48', '2021-01-20 18:01:48', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(271, 'PAY-KS368M0P6YN3', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-QKZHAW10J4XS/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 15:02:48', '2021-01-20 18:02:52', '2021-01-20 18:02:52', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(272, 'PAY-VVVLKQYYPIWA', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-VVWTK18BTUQ4/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 15:03:56', '2021-01-20 18:04:02', '2021-01-20 18:04:02', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(273, 'PAY-I2IEV1P2BGXR', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-7CPXMEVKKS44/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 15:33:53', '2021-01-20 18:33:57', '2021-01-20 18:33:57', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(274, 'PAY-6P7PF5NWV3VB', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-99ZV5MFKKQRS/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 15:43:21', '2021-01-20 18:43:25', '2021-01-20 18:43:25', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(275, 'PAY-QLCQWV6RY2FE', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-E90GJAYVZTVU/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 15:50:15', '2021-01-20 18:50:19', '2021-01-20 18:50:19', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(276, 'PAY-IVEU66WW9F25', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-QYRFIEUDOW88/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 15:52:07', '2021-01-20 18:52:11', '2021-01-20 18:52:11', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(277, 'PAY-1EFQ4S6RTYKG', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-9RHQU84QP3AJ/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 16:14:04', '2021-01-20 19:14:12', '2021-01-20 19:14:12', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(278, 'PAY-A2RPO2HUJWI3', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-B8AJW4QFAUMR/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 16:25:54', '2021-01-20 19:25:59', '2021-01-20 19:25:59', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(279, 'PAY-WTOFVRZ3H0BN', 1, NULL, 1, NULL, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-2J0H7KKG2ILA/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 16:44:53', '2021-01-20 19:44:58', '2021-01-20 19:44:58', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(280, 'PAY-63TQRYXCXGRC', 1, NULL, 1, 9, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-0GK88QOLABZQ/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 16:48:46', '2021-01-20 19:48:53', '2021-01-20 19:48:53', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(281, 'PAY-3GDKE5Y6HHU7', 1, NULL, 1, 10, 12, 40, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-5OD8XRSCW1VO/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '25.67', '0.00', '353.83', 1, '2021-01-21', '2021-01-20', NULL, '2021-01-20 18:13:26', '2021-01-20 21:13:30', '2021-01-20 21:13:30', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(282, 'PAY-PY9R7066578C', 1, NULL, 13, 0, 12, 40, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '393.04', '345.00', '48.04', NULL, '0.0299', NULL, '6.50', '25.67', '0.00', '353.83', 8, '2021-01-21', '2021-01-20', '2021-01-20 18:43:05', '2021-01-20 18:43:05', '2021-01-20 21:43:07', '2021-01-20 21:43:07', '', '', '', '', '', 0, 0, 11, '/5//3//12/', NULL, NULL),
(283, 'PAY-8HCJZTGAV6Q0', 1, NULL, 13, 0, 12, 40, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '393.04', '345.00', '48.04', NULL, '0.0299', NULL, '6.50', '25.67', '0.00', '353.83', 8, '2021-01-21', '2021-01-20', '2021-01-20 18:53:46', '2021-01-20 18:53:46', '2021-01-20 21:53:48', '2021-01-20 21:53:48', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(284, 'PAY-Q7NFAR4SKT9E', 1, NULL, 13, 0, 12, 40, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '393.04', '345.00', '48.04', NULL, '0.0299', NULL, '6.50', '25.67', '0.00', '353.83', 8, '2021-01-21', '2021-01-20', '2021-01-20 18:55:32', '2021-01-20 18:55:32', '2021-01-20 21:55:34', '2021-01-20 21:55:34', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(285, 'PAY-ONFBMGCX812X', 1, NULL, 32, 14, 12, 40, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '393.04', '345.00', '48.04', NULL, '0.0299', NULL, '6.50', '25.67', '0.00', '353.83', 8, '2021-01-21', '2021-01-20', '2021-01-20 18:57:14', '2021-01-20 18:57:14', '2021-01-20 21:57:16', '2021-01-20 21:57:16', '', '', '', '', '', 0, 0, 12, '/5//3//12/', NULL, NULL),
(286, 'PAY-FWPE88GIX5QP', 1, NULL, 32, 15, 12, 40, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '393.04', '345.00', '48.04', NULL, '0.0299', NULL, '6.50', '25.67', '0.00', '353.83', 8, '2021-01-21', '2021-01-20', '2021-01-20 18:58:13', '2021-01-20 18:58:13', '2021-01-20 21:58:15', '2021-01-20 21:58:15', '', '', '', '', '', 0, 0, 12, '/5//3//12/', NULL, NULL),
(287, 'PAY-71NDFYZX6ZIE', 1, NULL, 1, 16, 12, 40, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '393.04', '345.00', '48.04', NULL, '0.0299', NULL, '6.50', '25.67', '0.00', '353.83', 8, '2021-01-21', '2021-01-20', '2021-01-20 19:02:30', '2021-01-20 19:02:30', '2021-01-20 22:02:32', '2021-01-20 22:02:32', '', '', '', '', '', 0, 0, 12, '/5//3//12/', NULL, NULL),
(288, 'PAY-DWT5MSA38DZ5', 5, 8, 1, 17, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/C755A006', NULL, NULL, '211.10', '197.00', '14.10', NULL, '0.0299', NULL, '6.50', '13.81', '19.70', '163.49', 10, '2021-01-26', '2021-01-21', '2021-01-21 09:21:29', '2021-01-21 09:21:29', '2021-01-21 12:21:31', '2021-01-21 12:21:31', '', '', '', '', '', 0, 0, 13, '/5//3//12/', NULL, NULL),
(289, 'PAY-WHTV85YBFHJ6', 5, 13, 43, 18, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/C0CE93AD', 'https://sandbox.moip.com.br/v2/boleto/BOL-ZG19ZLMKJEDM/print', NULL, '297.00', '297.00', '0.00', '0.00', '0.0000', NULL, '6.50', '20.31', '0.00', '276.69', 1, '2021-01-26', '2021-01-21', NULL, '2021-01-21 11:09:04', '2021-01-21 14:09:09', '2021-01-21 14:09:09', '', '', '', '', '', 0, 0, 14, '/5//3//12/', NULL, NULL),
(290, 'PAY-TFJZYLNH3Y8G', 5, 13, 44, 19, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/C0CE93AD', 'https://sandbox.moip.com.br/v2/boleto/BOL-15O37KV1WCJZ/print', NULL, '297.00', '297.00', '0.00', '0.00', '0.0000', NULL, '6.50', '20.31', '0.00', '276.69', 1, '2021-01-26', '2021-01-21', NULL, '2021-01-21 11:21:50', '2021-01-21 14:21:53', '2021-01-21 14:21:54', '', '', '', '', '', 0, 0, 15, '/5//3//12/', NULL, NULL),
(291, 'PAY-C76WPWTUL38X', 5, 13, 45, 20, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/C0CE93AD', 'https://sandbox.moip.com.br/v2/boleto/BOL-527FTP4MY0PR/print', NULL, '297.00', '297.00', '0.00', '0.00', '0.0000', NULL, '6.50', '20.31', '0.00', '276.69', 1, '2021-01-26', '2021-01-21', NULL, '2021-01-21 11:26:20', '2021-01-21 14:26:23', '2021-01-21 14:26:23', '', '', '', '', '', 0, 0, 17, '/5//3//12/', NULL, NULL),
(292, 'PAY-2IISDMJXVWQO', 5, 13, 44, 21, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/C0CE93AD', 'https://sandbox.moip.com.br/v2/boleto/BOL-YW73GAD4RBMX/print', NULL, '297.00', '297.00', '0.00', '0.00', '0.0000', NULL, '6.50', '20.31', '0.00', '276.69', 1, '2021-01-26', '2021-01-21', NULL, '2021-01-21 12:04:03', '2021-01-21 15:04:07', '2021-01-21 15:04:07', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(293, 'PAY-DUE2JV8G36NY', 1, NULL, 44, 22, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-BXM179BEO492/print', NULL, '343.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-26', '2021-01-25', NULL, '2021-01-25 12:38:14', '2021-01-25 15:38:18', '2021-01-25 15:38:18', '', '', '', '', '', 0, 0, 18, '/5//3//12/', NULL, NULL),
(294, 'PAY-CWKRH2N9WFEE', 1, NULL, 44, 23, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 12:48:19', '2021-01-25 12:48:19', '2021-01-25 15:48:22', '2021-01-25 15:48:22', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(295, 'PAY-VVZ1JH6244L0', 1, NULL, 44, 24, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-P6TFF3YJTGDH/print', NULL, '343.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-26', '2021-01-25', NULL, '2021-01-25 12:50:19', '2021-01-25 15:50:24', '2021-01-25 15:50:24', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(296, 'PAY-D741S60HFWM8', 1, NULL, 44, 25, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-53SEQNVQT4D0/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-26', '2021-01-25', NULL, '2021-01-25 12:50:49', '2021-01-25 15:50:53', '2021-01-25 15:50:53', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(297, 'PAY-TB0YZCNKHR3B', 1, NULL, 44, 26, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '341.00', '345.00', '-4.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 12:51:38', '2021-01-25 12:51:38', '2021-01-25 15:51:40', '2021-01-25 15:51:40', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(298, 'PAY-EL1SSJQ7MH6Y', 1, NULL, 44, 27, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '413.68', '345.00', '68.68', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 12, '2021-01-26', '2021-01-25', '2021-01-25 12:57:22', '2021-01-25 12:57:22', '2021-01-25 15:57:24', '2021-01-25 15:57:25', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(299, 'PAY-893PV0M47CN7', 1, NULL, 44, 28, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 12:57:36', '2021-01-25 12:57:36', '2021-01-25 15:57:39', '2021-01-25 15:57:39', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(300, 'PAY-540F9TZMZP8E', 1, NULL, 44, 29, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 14:53:14', '2021-01-25 14:53:14', '2021-01-25 17:53:17', '2021-01-25 17:53:17', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(301, 'PAY-Z7WAC6D0EDKF', 1, NULL, 44, 30, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 15:01:26', '2021-01-25 15:01:26', '2021-01-25 18:01:29', '2021-01-25 18:01:29', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(302, 'PAY-LBNW879MBLHD', 1, NULL, 1, 31, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 15:05:30', '2021-01-25 15:05:30', '2021-01-25 18:05:32', '2021-01-25 18:05:33', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(303, 'PAY-NKV6BMPLB1CE', 1, NULL, 1, 32, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 15:08:33', '2021-01-25 15:08:33', '2021-01-25 18:08:36', '2021-01-25 18:08:36', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(304, 'PAY-55YWQKLIS6AL', 1, NULL, 1, 33, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 15:46:37', '2021-01-25 15:46:37', '2021-01-25 18:46:40', '2021-01-25 18:46:40', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(305, 'PAY-YB916NET3U8X', 1, NULL, 1, 34, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 15:49:20', '2021-01-25 15:49:20', '2021-01-25 18:49:23', '2021-01-25 18:49:23', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(306, 'PAY-1TKU7C9ZI6GT', 1, NULL, 1, 35, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-OYGFL8CBKHZ3/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-26', '2021-01-25', NULL, '2021-01-25 15:49:57', '2021-01-25 18:50:01', '2021-01-25 18:50:01', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(307, 'PAY-WRW7KYFQSW6Y', 1, NULL, 1, 36, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-CYNFIFPDFF8H/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-26', '2021-01-25', NULL, '2021-01-25 15:51:18', '2021-01-25 18:51:22', '2021-01-25 18:51:22', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(308, 'PAY-791DNWJGWW67', 1, NULL, 1, 37, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-SK51UO1KZAUZ/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-26', '2021-01-25', NULL, '2021-01-25 15:52:01', '2021-01-25 18:52:04', '2021-01-25 18:52:04', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(309, 'PAY-AYW3UJ029AZF', 1, NULL, 32, 38, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 15:57:20', '2021-01-25 15:57:20', '2021-01-25 18:57:22', '2021-01-25 18:57:22', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(310, 'PAY-SD6RSUWJTGZE', 1, NULL, 32, 39, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 15:59:29', '2021-01-25 15:59:29', '2021-01-25 18:59:32', '2021-01-25 18:59:32', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(311, 'PAY-G7UHHYAVT1LA', 1, NULL, 32, 40, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 16:00:29', '2021-01-25 16:00:29', '2021-01-25 19:00:32', '2021-01-25 19:00:32', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(312, 'PAY-Q1SZNFR6HOO1', 1, NULL, 13, 0, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 16:02:24', '2021-01-25 16:02:24', '2021-01-25 19:02:26', '2021-01-25 19:02:26', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(313, 'PAY-LF74L0BS3SCX', 1, NULL, 32, 42, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 16:04:47', '2021-01-25 16:04:47', '2021-01-25 19:04:48', '2021-01-25 19:04:48', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(314, 'PAY-KU65JJTIIIDL', 1, NULL, 32, 43, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 16:09:37', '2021-01-25 16:09:37', '2021-01-25 19:09:39', '2021-01-25 19:09:39', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(315, 'PAY-K94C2BVSC83V', 1, NULL, 32, 44, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '-2.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 16:10:23', '2021-01-25 16:10:23', '2021-01-25 19:10:25', '2021-01-25 19:10:25', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(316, 'PAY-V86ZM3QZG5HB', 1, NULL, 32, 45, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '343.00', '345.00', '0.00', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 1, '2021-01-26', '2021-01-25', '2021-01-25 16:11:12', '2021-01-25 16:11:12', '2021-01-25 19:11:14', '2021-01-25 19:11:14', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(317, 'PAY-NEDXXRV7TZ64', 1, NULL, 1, 46, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-TE5F9N0TG2FY/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-26', '2021-01-25', NULL, '2021-01-25 17:20:12', '2021-01-25 20:20:17', '2021-01-25 20:20:17', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(318, 'PAY-DE5AHDQ261EE', 1, NULL, 1, 47, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-O54F1ZT47DJL/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-26', '2021-01-25', NULL, '2021-01-25 17:48:09', '2021-01-25 20:48:14', '2021-01-25 20:48:14', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(319, 'PAY-TRGYKWL3JFC6', 1, NULL, 44, 48, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-Z8HAORMOE1PM/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 10:52:21', '2021-01-26 13:52:26', '2021-01-26 13:52:26', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(320, 'PAY-PYWTHCZ7WGM4', 1, NULL, 44, 49, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-YTSYV0AFLA9J/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 10:54:47', '2021-01-26 13:54:52', '2021-01-26 13:54:52', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(321, 'PAY-UCRBJLGA22FK', 1, NULL, 1, 50, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-DXK1F14UNRWX/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 10:59:29', '2021-01-26 13:59:34', '2021-01-26 13:59:34', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(322, 'PAY-XOYQBYZA3FDQ', 1, NULL, 1, 51, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-XF5YBTQSVVU1/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 11:25:14', '2021-01-26 14:25:20', '2021-01-26 14:25:20', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(323, 'PAY-V0YY5F9L17IR', 1, NULL, 13, 0, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-QJ031O349MA4/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 11:29:29', '2021-01-26 14:29:33', '2021-01-26 14:29:33', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(324, 'PAY-LK5T1CJHP9B8', 1, NULL, 13, 0, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-YA65WR122LPO/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 11:32:44', '2021-01-26 14:32:48', '2021-01-26 14:32:48', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(325, 'PAY-UXU4LOU2ZRT2', 1, NULL, 1, 54, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-K5IMZZXIED99/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 11:33:26', '2021-01-26 14:33:30', '2021-01-26 14:33:30', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(326, 'PAY-43B1O5P4U024', 1, NULL, 1, 55, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '402.20', '345.00', '57.20', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 10, '2021-01-27', '2021-01-26', '2021-01-26 11:51:03', '2021-01-26 11:51:03', '2021-01-26 14:51:05', '2021-01-26 14:51:05', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(327, 'PAY-VY60NE7PTR3G', 1, NULL, 1, 56, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-UMEO8I58CZQG/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 11:56:31', '2021-01-26 14:56:35', '2021-01-26 14:56:35', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(328, 'PAY-1PN7EX8FKWOV', 1, NULL, 1, 57, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '413.68', '345.00', '68.68', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 12, '2021-01-27', '2021-01-26', '2021-01-26 11:57:11', '2021-01-26 11:57:11', '2021-01-26 14:57:13', '2021-01-26 14:57:13', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(329, 'PAY-GYE38HDXCUY5', 1, NULL, 4, 58, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '413.68', '345.00', '68.68', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 12, '2021-01-27', '2021-01-26', '2021-01-26 12:02:41', '2021-01-26 12:02:41', '2021-01-26 15:02:43', '2021-01-26 15:02:43', '', '', '', '', '', 0, 0, 19, '/5//3//12/', NULL, NULL),
(330, 'PAY-J6L1AEL3H7C9', 1, NULL, 4, 59, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '413.68', '345.00', '68.68', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 12, '2021-01-27', '2021-01-26', '2021-01-26 12:03:49', '2021-01-26 12:03:49', '2021-01-26 15:03:51', '2021-01-26 15:03:51', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(331, 'PAY-1TJZTTNAAK2T', 1, NULL, 1, 60, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '402.20', '345.00', '57.20', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 10, '2021-01-27', '2021-01-26', '2021-01-26 12:09:28', '2021-01-26 12:09:28', '2021-01-26 15:09:33', '2021-01-26 15:09:33', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(332, 'PAY-77OVIJRUL1M1', 1, NULL, 1, 61, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '391.04', '345.00', '46.04', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 8, '2021-01-27', '2021-01-26', '2021-01-26 12:15:57', '2021-01-26 12:15:57', '2021-01-26 15:16:00', '2021-01-26 15:16:00', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(333, 'PAY-OKZY7X5A1N02', 1, NULL, 1, 62, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '396.61', '345.00', '51.61', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 9, '2021-01-27', '2021-01-26', '2021-01-26 12:17:26', '2021-01-26 12:17:26', '2021-01-26 15:17:28', '2021-01-26 15:17:28', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(334, 'PAY-SG7BJBZY1JR6', 1, NULL, 1, 63, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '413.68', '345.00', '68.68', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 12, '2021-01-27', '2021-01-26', '2021-01-26 12:20:05', '2021-01-26 12:20:05', '2021-01-26 15:20:07', '2021-01-26 15:20:07', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(335, 'PAY-JE44U7O1TUHJ', 1, NULL, 1, 64, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '413.68', '345.00', '68.68', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 12, '2021-01-27', '2021-01-26', '2021-01-26 12:25:55', '2021-01-26 12:25:55', '2021-01-26 15:25:57', '2021-01-26 15:25:57', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(336, 'PAY-GTFX07SRO3IW', 1, NULL, 32, 65, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '369.16', '345.00', '24.16', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 4, '2021-01-27', '2021-01-26', '2021-01-26 12:29:49', '2021-01-26 12:29:49', '2021-01-26 15:29:51', '2021-01-26 15:29:51', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(337, 'PAY-UQCNLB1G197R', 1, NULL, 32, 66, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-ABI6YXF7A0E9/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 12:30:19', '2021-01-26 15:30:26', '2021-01-26 15:30:26', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(338, 'PAY-YBY4Z834FTUW', 1, NULL, 32, 67, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '396.61', '345.00', '51.61', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 9, '2021-01-27', '2021-01-26', '2021-01-26 12:31:43', '2021-01-26 12:31:43', '2021-01-26 15:31:45', '2021-01-26 15:31:45', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(339, 'PAY-W996AVWHSC9S', 1, NULL, 32, 68, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-UP4IA9T1N90E/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 12:32:18', '2021-01-26 15:32:22', '2021-01-26 15:32:22', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(340, 'PAY-5B0EQ2F4V79M', 1, NULL, 1, 69, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-LX9SZ5Q0BD0U/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 12:37:11', '2021-01-26 15:37:14', '2021-01-26 15:37:14', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(341, 'PAY-TCEX13NK67DJ', 1, NULL, 32, 70, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '358.54', '345.00', '13.54', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 2, '2021-01-27', '2021-01-26', '2021-01-26 12:44:20', '2021-01-26 12:44:20', '2021-01-26 15:44:22', '2021-01-26 15:44:22', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(342, 'PAY-8498L1JKV3C6', 1, NULL, 32, 71, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-AKYFO5M1JZ87/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 12:45:02', '2021-01-26 15:45:06', '2021-01-26 15:45:06', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(343, 'PAY-CZ3YS9M490R8', 1, NULL, 46, 72, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-SB4F3NFTTBUX/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 16:20:02', '2021-01-26 19:20:07', '2021-01-26 19:20:07', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(344, 'PAY-KRV61WNVPH39', 1, NULL, 1, 73, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-3493LR02MYGJ/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 16:24:26', '2021-01-26 19:24:31', '2021-01-26 19:24:31', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(345, 'PAY-BXX88BPG4UC9', 1, NULL, 44, 74, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-T4R7E8QVAQHA/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 17:50:01', '2021-01-26 20:50:06', '2021-01-26 20:50:06', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(346, 'PAY-LHD0F4K9D83E', 1, NULL, 44, 75, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-NCRL3YBYFALK/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-27', '2021-01-26', NULL, '2021-01-26 17:52:12', '2021-01-26 20:52:17', '2021-01-26 20:52:17', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(347, 'PAY-O08LV38SQXRU', 1, NULL, 44, 76, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-5WTWPNP6BGHR/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-01', '2021-01-26', NULL, '2021-01-26 17:53:35', '2021-01-26 20:53:40', '2021-01-27 20:31:28', '', '', '', '', '', 0, 0, NULL, '/5//3//12/', NULL, NULL),
(348, 'PAY-2R1PGDYSV473', 1, NULL, 44, 77, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-PIPE0D7JXS7L/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-01', '2021-01-26', NULL, '2021-01-26 18:00:42', '2021-01-26 21:00:47', '2021-01-27 20:32:40', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(349, 'PAY-899T0AR39FIA', 1, NULL, 1, 78, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-PVZGDU7QS71C/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-01', '2021-01-27', NULL, '2021-01-27 11:19:56', '2021-01-27 14:20:05', '2021-01-27 20:30:27', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(350, 'PAY-VUHXDD5PH6CN', 1, NULL, 1, 79, 12, NULL, NULL, NULL, 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '413.68', '345.00', '68.68', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 12, '2021-01-28', '2021-01-27', '2021-01-27 11:21:55', '2021-01-27 11:21:55', '2021-01-27 14:21:57', '2021-01-27 14:21:57', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(351, 'PAY-094LIATODALL', 1, NULL, 1, 80, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-PQRHV51CX1NU/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-01', '2021-01-27', NULL, '2021-01-27 15:40:16', '2021-01-27 18:40:21', '2021-01-27 20:26:19', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(352, 'PAY-6VXHIHY6HUJY', 1, NULL, 1, 81, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-AX6K2NZUKE1J/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-01', '2021-01-27', NULL, '2021-01-27 15:50:50', '2021-01-27 18:50:54', '2021-01-27 20:19:52', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(353, 'PAY-2RHB9WKUQGPG', 1, NULL, 1, 82, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-X8BH1I5NWFGU/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-01', '2021-01-27', NULL, '2021-01-27 15:55:39', '2021-01-27 18:55:43', '2021-01-27 20:16:24', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(354, 'PAY-E2IWVBDBU559', 1, NULL, 1, 83, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-4IGD3S8G95LY/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-28', '2021-01-27', NULL, '2021-01-27 17:33:29', '2021-01-27 20:33:33', '2021-01-27 20:33:34', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(355, 'PAY-5ILI2DIXL2R1', 1, NULL, 1, 84, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-J2LTJAYGJZ5P/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-28', '2021-01-27', NULL, '2021-01-27 17:34:26', '2021-01-27 20:34:31', '2021-01-27 20:34:31', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL);
INSERT INTO `vendas` (`id`, `transacao`, `produto`, `plano`, `comprador`, `endereco`, `produtor`, `campanha`, `afiliado`, `comissao_afiliado`, `meio_pagamento`, `forma_pagamento`, `status_transacao`, `motivo`, `url_checkout`, `link_boleto`, `linha_digitavel`, `valor_bruto`, `valor_produto`, `valor_juros`, `valor_frete`, `taxa_juros`, `valor_taxa`, `taxa_octapay`, `valor_octapay`, `valor_desconto`, `valor_liquido`, `parcelas`, `data_vencimento`, `data_pedido`, `data_finalizada`, `data_ultimo_evento`, `created_at`, `updated_at`, `src`, `utm_source`, `utm_campaign`, `utm_medium`, `utm_content`, `st4rt`, `postback_st4rt`, `carrinho_abandonado`, `coprodutores`, `ip`, `coprodutor`) VALUES
(356, 'PAY-RT2ODL1G8NEZ', 1, NULL, 1, 85, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-FFK15XX5NGP5/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-28', '2021-01-27', NULL, '2021-01-27 18:07:46', '2021-01-27 21:07:51', '2021-01-27 21:07:51', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(357, 'PAY-XAQJMK2XV0F0', 1, NULL, 1, 86, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-9YQ4NZ9H8NMD/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-28', '2021-01-27', NULL, '2021-01-27 18:10:09', '2021-01-27 21:10:14', '2021-01-27 21:10:14', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(358, 'PAY-UEQ318VWNU8L', 1, NULL, 1, 87, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-KTQBCA2VO39Q/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-28', '2021-01-27', NULL, '2021-01-27 18:22:01', '2021-01-27 21:22:05', '2021-01-27 21:22:05', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(359, 'PAY-TDDVFM8KXRE0', 1, NULL, 1, 88, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-T9EVBUU9DI9V/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-29', '2021-01-28', NULL, '2021-01-28 10:07:19', '2021-01-28 13:07:25', '2021-01-28 13:07:25', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(360, 'PAY-ZGG4H28XPV6J', 1, NULL, 1, 89, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-BXK3MF7OHYBD/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-29', '2021-01-28', NULL, '2021-01-28 10:20:22', '2021-01-28 13:20:26', '2021-01-28 13:20:26', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(361, 'PAY-KAXW0GDOYE9F', 1, NULL, 1, 90, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-B42CWG3YLLFD/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-29', '2021-01-28', NULL, '2021-01-28 10:21:26', '2021-01-28 13:21:29', '2021-01-28 13:21:29', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(362, 'PAY-WRLV18742X9F', 1, NULL, 1, 91, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-JVA9Q5EK3Q6K/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-29', '2021-01-28', NULL, '2021-01-28 10:25:18', '2021-01-28 13:25:22', '2021-01-28 13:25:22', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(363, 'PAY-I7OVQ9T26BRK', 1, NULL, 1, 92, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-PSXI2TKL68OV/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-29', '2021-01-28', NULL, '2021-01-28 10:29:59', '2021-01-28 13:30:06', '2021-01-28 13:30:06', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(364, 'PAY-2R28NFZ9CR2T', 1, NULL, 1, 93, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-LV4FBYKUKY7A/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-29', '2021-01-28', NULL, '2021-01-28 10:31:28', '2021-01-28 13:31:33', '2021-01-28 13:31:33', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(365, 'PAY-YX1ABQN0JP9Z', 1, NULL, 1, 94, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-3RKJKURC35G1/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-01-29', '2021-01-28', NULL, '2021-01-28 10:57:09', '2021-01-28 13:57:13', '2021-01-28 13:57:13', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(366, 'PAY-IBO7U9Q7QPR8', 1, NULL, 1, 95, 12, NULL, 5, '117.30', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-52PAA8ZKKAXA/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-02', '2021-02-01', NULL, '2021-02-01 11:29:12', '2021-02-01 14:29:19', '2021-02-01 14:29:19', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(367, 'PAY-QZKNMD7VLA7M', 1, NULL, 1, 96, 12, NULL, 5, '117.30', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-L86F1NURNH9N/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-02', '2021-02-01', NULL, '2021-02-01 14:52:12', '2021-02-01 17:52:18', '2021-02-01 17:52:19', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(368, 'PAY-YT7W0J3SFQEH', 1, NULL, 1, 97, 12, NULL, 5, '117.30', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-Q7ORRJLTY2VD/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-02', '2021-02-01', NULL, '2021-02-01 15:23:09', '2021-02-01 18:23:14', '2021-02-01 18:23:14', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(369, 'PAY-MARSXYYUCRHN', 1, NULL, 1, 98, 12, NULL, 5, '117.30', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-21FFKK4GIWC4/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-02', '2021-02-01', NULL, '2021-02-01 15:27:45', '2021-02-01 18:27:50', '2021-02-01 18:27:50', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(370, 'PAY-GB47BVOM2G1D', 1, NULL, 1, 99, 12, NULL, 5, '117.30', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-QFAYP0MXOX2J/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-02', '2021-02-01', NULL, '2021-02-01 15:31:25', '2021-02-01 18:31:30', '2021-02-01 18:31:30', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(371, 'PAY-FU3AYICPZSOR', 1, NULL, 1, 100, 12, NULL, 5, '117.30', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-S9R1HXULWGS6/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-02', '2021-02-01', NULL, '2021-02-01 15:40:08', '2021-02-01 18:40:13', '2021-02-01 18:40:13', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(372, 'PAY-P3C7GGLX964J', 1, NULL, 1, 101, 12, NULL, 5, '117.30', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-LG35N991GBPV/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-02', '2021-02-01', NULL, '2021-02-01 16:21:01', '2021-02-01 19:21:05', '2021-02-01 19:21:05', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(373, 'PAY-JADA2N0SQ2QX', 1, NULL, 1, 102, 12, NULL, 5, '117.30', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-9KU5BM542IH3/print', NULL, '345.00', '345.00', '0.00', '0.00', '0.0000', NULL, '6.50', '23.43', '0.00', '321.57', 1, '2021-02-02', '2021-02-01', NULL, '2021-02-01 16:52:19', '2021-02-01 19:52:24', '2021-02-01 19:52:24', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(374, 'PAY-X30HX27ITM5S', 1, NULL, 1, 103, 12, NULL, 5, '117.30', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '413.68', '345.00', '68.68', NULL, '0.0299', NULL, '6.50', '23.43', '2.00', '319.57', 12, '2021-02-02', '2021-02-01', '2021-02-01 16:57:42', '2021-02-01 16:57:42', '2021-02-01 19:57:44', '2021-02-01 19:57:45', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(375, 'PAY-Z2OHYL6XCT1T', 1, NULL, 1, 104, 12, NULL, 5, '89.90', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '354.72', '264.42', '90.30', NULL, '0.0299', NULL, '6.50', '18.19', '0.00', '246.23', 12, '2021-02-03', '2021-02-02', '2021-02-02 11:36:04', '2021-02-02 11:36:04', '2021-02-02 14:36:06', '2021-02-02 14:36:06', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(376, 'PAY-CRXMR83XY4AD', 1, NULL, 1, 105, 12, NULL, 5, '89.90', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '294.42', '264.42', '30.00', NULL, '0.0299', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-03', '2021-02-02', '2021-02-02 11:38:13', '2021-02-02 11:38:13', '2021-02-02 14:38:15', '2021-02-02 14:38:15', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(377, 'PAY-A271E4PQHLXH', 1, NULL, 1, 106, 12, NULL, 5, '89.90', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '294.42', '264.42', '0.00', '30.00', '0.0299', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-03', '2021-02-02', '2021-02-02 11:43:54', '2021-02-02 11:43:54', '2021-02-02 14:43:56', '2021-02-02 14:43:56', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(378, 'PAY-FFEUSNCTXAUE', 1, NULL, 1, 107, 12, NULL, 5, '89.90', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '354.72', '264.42', '60.30', '30.00', '0.0299', NULL, '6.50', '20.14', '0.00', '246.23', 12, '2021-02-03', '2021-02-02', '2021-02-02 12:30:06', '2021-02-02 12:30:06', '2021-02-02 15:30:08', '2021-02-02 15:30:08', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(379, 'PAY-ZDIZAH3251WE', 1, NULL, 1, 108, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-TRD5KV5SNDKA/print', NULL, '264.42', '264.42', '0.00', '30.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-03', '2021-02-02', NULL, '2021-02-02 14:54:46', '2021-02-02 17:54:50', '2021-02-02 17:54:50', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(380, 'PAY-IKF9R11GP4ZC', 1, NULL, 1, 109, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-QYAWTQ1A60WE/print', NULL, '294.42', '264.42', '0.00', '30.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-03', '2021-02-02', NULL, '2021-02-02 14:56:24', '2021-02-02 17:56:29', '2021-02-02 17:56:29', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(381, 'PAY-955CWUD8PVG4', 1, NULL, 1, 110, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-GLIDBAP6J2K3/print', NULL, '294.42', '264.42', '0.00', '30.00', '0.0000', NULL, '6.50', '20.14', '0.00', '274.28', 1, '2021-02-03', '2021-02-02', NULL, '2021-02-02 15:13:29', '2021-02-02 18:13:34', '2021-02-02 18:13:34', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(382, 'PAY-7GDV3AO5S1DX', 1, NULL, 1, 111, 12, NULL, 5, '89.90', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '294.42', '264.42', '0.00', '30.00', '0.0299', NULL, '6.50', '20.14', '0.00', '274.28', 1, '2021-02-03', '2021-02-02', '2021-02-02 15:14:37', '2021-02-02 15:14:37', '2021-02-02 18:14:40', '2021-02-02 18:14:40', '', '', '', '', '', 0, 0, NULL, '/3//12/', NULL, NULL),
(383, 'PAY-COVYXYIJ3BVA', 1, NULL, 1, 112, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-JPYJPN5BCPAP/print', NULL, '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-03', '2021-02-02', NULL, '2021-02-02 17:05:57', '2021-02-02 20:06:01', '2021-02-02 20:06:01', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(384, 'PAY-82KM1RKEBAR0', 1, NULL, 1, 113, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-P7UYJAY0C78L/print', NULL, '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-03', '2021-02-02', NULL, '2021-02-02 18:55:34', '2021-02-02 21:55:38', '2021-02-02 21:55:38', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(385, 'PAY-VOB9NDG2UC4V', 1, NULL, 1, 114, 12, NULL, 5, '89.90', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '318.60', '264.42', '54.18', '0.00', '0.0299', NULL, '6.50', '18.19', '0.00', '246.23', 12, '2021-02-04', '2021-02-03', '2021-02-03 11:19:15', '2021-02-03 11:19:15', '2021-02-03 14:19:18', '2021-02-03 14:19:18', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(386, 'PAY-G5XW0M6H35HH', 1, NULL, 1, 115, 12, NULL, 5, '89.90', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '318.60', '264.42', '54.18', '0.00', '0.0299', NULL, '6.50', '18.19', '0.00', '246.23', 12, '2021-02-04', '2021-02-03', '2021-02-03 11:32:29', '2021-02-03 11:32:29', '2021-02-03 14:32:31', '2021-02-03 14:32:31', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(387, 'PAY-J00BO1FRJLJS', 1, NULL, 1, 116, 12, NULL, 5, '89.90', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '318.60', '264.42', '54.18', '0.00', '0.0299', NULL, '6.50', '18.19', '0.00', '246.23', 12, '2021-02-04', '2021-02-03', '2021-02-03 11:33:37', '2021-02-03 11:33:37', '2021-02-03 14:33:38', '2021-02-03 14:33:38', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(388, 'PAY-CRTWHZWXYPJN', 1, NULL, 1, 117, 12, NULL, 5, '89.90', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '318.60', '264.42', '54.18', '0.00', '0.0299', NULL, '6.50', '18.19', '0.00', '246.23', 12, '2021-02-04', '2021-02-03', '2021-02-03 11:36:31', '2021-02-03 11:36:31', '2021-02-03 14:36:34', '2021-02-03 14:36:34', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(389, 'PAY-A6I4MQWU46JZ', 1, NULL, 1, 118, 12, NULL, 5, '89.90', 'Moip', 1, 5, 'SALDO INSUFICIENTE', 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '318.60', '264.42', '54.18', '0.00', '0.0299', NULL, '6.50', '18.19', '0.00', '246.23', 12, '2021-02-04', '2021-02-03', NULL, '2021-02-03 11:38:22', '2021-02-03 14:38:26', '2021-02-09 14:45:35', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(390, 'PAY-WJKNXFWPUO4Q', 1, NULL, 1, 119, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-78WSJJTB7FLS/print', NULL, '294.42', '264.42', '0.00', '30.00', '0.0000', NULL, '6.50', '20.14', '0.00', '274.28', 1, '2021-02-04', '2021-02-03', NULL, '2021-02-03 12:23:38', '2021-02-03 15:23:42', '2021-02-03 15:23:42', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(391, 'PAY-LX4YGRWHXXV9', 1, NULL, 1, 120, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-6EFYMQXWM848/print', NULL, '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-04', '2021-02-03', NULL, '2021-02-03 12:25:14', '2021-02-03 15:25:22', '2021-02-03 15:25:22', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(392, 'PAY-Y31C186B47OP', 1, NULL, 1, 121, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-14PT2OVPAXQE/print', NULL, '294.42', '264.42', '0.00', '30.00', '0.0000', NULL, '6.50', '20.14', '0.00', '274.28', 1, '2021-02-04', '2021-02-03', NULL, '2021-02-03 12:27:51', '2021-02-03 15:27:56', '2021-02-03 15:27:56', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(393, 'PAY-KK100VZZR6X5', 1, NULL, 32, 122, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-QEYXLMGO8NGY/print', NULL, '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-04', '2021-02-03', NULL, '2021-02-03 17:05:47', '2021-02-03 20:05:52', '2021-02-03 20:05:52', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(394, 'PAY-U581ZOMAWQZF', 3, NULL, 1, 123, 3, NULL, 12, '46.80', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/81B2A2FF', 'https://sandbox.moip.com.br/v2/boleto/BOL-IQEDZDWCO4J4/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.50', '16.21', '0.00', '217.79', 1, '2021-02-10', '2021-02-05', NULL, '2021-02-05 10:11:13', '2021-02-05 13:11:18', '2021-02-05 13:11:18', '', '', '', '', '', 0, 0, 21, '', '127.0.0.1', NULL),
(395, 'PAY-ROSAM9WHQAJI', 1, NULL, 1, 124, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-9CS8RE7Z78KF/print', NULL, '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-06', '2021-02-05', NULL, '2021-02-05 10:12:18', '2021-02-05 13:12:21', '2021-02-05 13:12:22', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(396, 'PAY-HUX9JU8YPMWH', 1, NULL, 1, 125, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-EY39YOKD9AIR/print', NULL, '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-06', '2021-02-05', NULL, '2021-02-05 10:14:46', '2021-02-05 13:14:50', '2021-02-05 13:14:50', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(397, 'PAY-TJICID9NXLTZ', 1, NULL, 1, 126, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-QZH1PR7H7PPS/print', NULL, '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-06', '2021-02-05', NULL, '2021-02-05 10:23:50', '2021-02-05 13:23:54', '2021-02-05 13:23:54', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(398, 'PAY-3LOELH1QNTOQ', 1, NULL, 1, 127, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-0Z5ND1CYEZPS/print', NULL, '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-06', '2021-02-05', NULL, '2021-02-05 10:27:24', '2021-02-05 13:27:29', '2021-02-05 13:27:29', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(399, 'PAY-ZEC6YJQPXZD2', 1, NULL, 1, 128, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-3AXBD7CGT1OF/print', NULL, '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-06', '2021-02-05', NULL, '2021-02-05 10:34:40', '2021-02-05 13:34:44', '2021-02-05 13:34:44', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(400, 'PAY-WY1S5UCXB1XS', 1, NULL, 1, 129, 12, NULL, 5, '89.90', 'Moip', 1, 4, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '318.60', '264.42', '54.18', '0.00', '0.0299', NULL, '6.50', '18.19', '0.00', '246.23', 12, '2021-02-06', '2021-02-05', '2021-02-05 12:05:24', '2021-02-05 12:05:24', '2021-02-05 15:05:26', '2021-02-05 15:05:26', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(401, 'PAY-VLDY4USW34F0', 3, NULL, 1, 130, 3, NULL, 12, '46.80', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/81B2A2FF', 'https://sandbox.moip.com.br/v2/boleto/BOL-5CHR3KM6UX2K/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.50', '16.21', '0.00', '217.79', 1, '2021-02-16', '2021-02-11', NULL, '2021-02-11 16:14:06', '2021-02-11 19:14:11', '2021-02-11 19:14:11', '', '', '', '', '', 0, 0, NULL, '', '127.0.0.1', NULL),
(402, 'PAY-WX5469B0BR06', 3, NULL, 1, 131, 3, NULL, 12, '46.80', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/81B2A2FF', 'https://sandbox.moip.com.br/v2/boleto/BOL-RL3R4MWCNXP1/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.50', '16.21', '0.00', '217.79', 1, '2021-02-16', '2021-02-11', NULL, '2021-02-11 16:17:35', '2021-02-11 19:17:39', '2021-02-11 19:17:39', '', '', '', '', '', 0, 0, NULL, '', '127.0.0.1', NULL),
(403, 'PAY-ZY0KJGJYN1QI', 3, NULL, 1, 132, 3, NULL, 12, '46.80', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/81B2A2FF', 'https://sandbox.moip.com.br/v2/boleto/BOL-64MUX5QVIWUJ/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.50', '16.21', '0.00', '217.79', 1, '2021-02-16', '2021-02-11', NULL, '2021-02-11 16:26:57', '2021-02-11 19:27:01', '2021-02-11 19:27:01', '', '', '', '', '', 0, 0, NULL, '', '127.0.0.1', NULL),
(404, 'PAY-OLHA0HWCHUJJ', 3, NULL, 1, 133, 3, NULL, 12, '46.80', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/81B2A2FF', 'https://sandbox.moip.com.br/v2/boleto/BOL-1WCGRT24DJ8W/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.50', '16.21', '0.00', '217.79', 1, '2021-02-16', '2021-02-11', NULL, '2021-02-11 16:34:32', '2021-02-11 19:34:37', '2021-02-11 19:34:37', '', '', '', '', '', 0, 0, NULL, '', '127.0.0.1', NULL),
(405, 'PAY-FJSG6ITJMA3W', 3, NULL, 1, 134, 3, NULL, 12, '46.80', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/81B2A2FF', 'https://sandbox.moip.com.br/v2/boleto/BOL-XMTQI7PV88AT/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.50', '16.21', '0.00', '217.79', 1, '2021-02-16', '2021-02-11', NULL, '2021-02-11 16:36:02', '2021-02-11 19:36:06', '2021-02-11 19:36:06', '', '', '', '', '', 0, 0, NULL, '', '127.0.0.1', NULL),
(406, 'PAY-QBYWE28C8PNN', 3, NULL, 1, 135, 3, NULL, 12, '46.80', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/81B2A2FF', 'https://sandbox.moip.com.br/v2/boleto/BOL-MMUP2P274V4Y/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.50', '16.21', '0.00', '217.79', 1, '2021-02-16', '2021-02-11', NULL, '2021-02-11 16:38:56', '2021-02-11 19:38:59', '2021-02-11 19:38:59', '', '', '', '', '', 0, 0, NULL, '', '127.0.0.1', NULL),
(407, 'PAY-1B5IZNK82HY2', 3, NULL, 1, 136, 3, NULL, 12, '46.80', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/81B2A2FF', 'https://sandbox.moip.com.br/v2/boleto/BOL-TA8RH36ATCEF/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.50', '16.21', '0.00', '217.79', 1, '2021-02-16', '2021-02-11', NULL, '2021-02-11 16:42:02', '2021-02-11 19:42:06', '2021-02-11 19:42:06', '', '', '', '', '', 0, 0, NULL, '', '127.0.0.1', NULL),
(408, 'PAY-IUF2R8KU9V7N', 3, NULL, 1, 137, 3, NULL, 12, '46.80', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/B3105BE3', 'https://sandbox.moip.com.br/v2/boleto/BOL-11QK29DE0W4Q/print', NULL, '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.50', '16.21', '0.00', '217.79', 1, '2021-02-20', '2021-02-15', NULL, '2021-02-15 08:39:51', '2021-02-15 11:39:56', '2021-02-15 11:39:56', '', '', '', '', '', 0, 0, NULL, '', '127.0.0.1', NULL),
(409, 'PAY-1SL6JDD58YZ1', 1, 10, 1, 138, 12, NULL, 5, '12.58', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/4CEFE0AB', 'https://sandbox.moip.com.br/v2/boleto/BOL-I01QLC5OV6F2/print', NULL, '67.00', '37.00', '0.00', '30.00', '0.0000', NULL, '6.50', '5.36', '0.00', '61.64', 1, '2021-02-16', '2021-02-15', NULL, '2021-02-15 08:46:33', '2021-02-15 11:46:37', '2021-02-15 11:46:37', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(410, 'PAY-SRV98X36YZIW', 1, 10, 1, 139, 12, NULL, 5, '12.58', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/4CEFE0AB', 'https://sandbox.moip.com.br/v2/boleto/BOL-JA3IFXMWKQUN/print', NULL, '67.00', '37.00', '0.00', '30.00', '0.0000', NULL, '6.50', '5.36', '0.00', '61.64', 1, '2021-02-16', '2021-02-15', NULL, '2021-02-15 08:54:45', '2021-02-15 11:54:49', '2021-02-15 11:54:49', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(411, 'PAY-VIVRR5Q7IYMO', 1, NULL, 1, 140, 12, NULL, 5, '89.90', 'Moip', 1, 2, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '318.60', '264.42', '54.18', '0.00', '0.0299', NULL, '6.50', '18.19', '0.00', '246.23', 12, '2021-02-24', '2021-02-23', NULL, '2021-02-23 14:00:19', '2021-02-23 17:00:22', '2021-02-23 17:00:22', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(412, 'PAY-CE9NBC30XRFU', 1, NULL, 1, 141, 12, NULL, 5, '89.90', 'Moip', 1, 2, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '294.42', '264.42', '0.00', '30.00', '0.0299', NULL, '6.50', '20.14', '0.00', '274.28', 1, '2021-02-24', '2021-02-23', NULL, '2021-02-23 15:07:56', '2021-02-23 18:07:59', '2021-02-23 18:07:59', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(413, 'PAY-DMTC4XVN4W3T', 1, NULL, 1, 142, 12, NULL, 5, '89.90', 'Moip', 1, 2, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '294.42', '264.42', '0.00', '30.00', '0.0299', NULL, '6.50', '20.14', '0.00', '274.28', 1, '2021-02-24', '2021-02-23', NULL, '2021-02-23 15:11:49', '2021-02-23 18:11:52', '2021-02-23 18:11:52', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(414, 'PAY-5GS1XO2RMTCT', 1, NULL, 1, 143, 12, NULL, 5, '89.90', 'Moip', 1, 2, NULL, 'localhost/octapay/checkout/426A0EF5', NULL, NULL, '294.42', '264.42', '0.00', '30.00', '0.0299', NULL, '6.50', '20.14', '0.00', '274.28', 1, '2021-02-24', '2021-02-23', NULL, '2021-02-23 15:15:48', '2021-02-23 18:15:50', '2021-02-23 18:15:50', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(415, 'PAY-H3JI7SQDOWGK', 1, NULL, 1, 144, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-YHTRGHL6U00J/print', NULL, '294.42', '264.42', '0.00', '30.00', '0.0000', NULL, '6.50', '20.14', '0.00', '274.28', 1, '2021-02-24', '2021-02-23', NULL, '2021-02-23 15:18:13', '2021-02-23 18:18:17', '2021-02-23 18:18:17', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(416, 'PAY-W6HQ7HYUBA5L', 1, 10, 1, 145, 12, NULL, 5, '1.00', 'Moip', 1, 2, NULL, 'localhost/octapay/checkout/4CEFE0AB', NULL, NULL, '3.00', '3700.00', '0.00', '30.00', '0.0299', NULL, '6.50', '243.45', '0.00', '3486.55', 1, '2021-02-24', '2021-02-23', NULL, '2021-02-23 15:22:57', '2021-02-23 18:22:59', '2021-02-23 18:22:59', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(417, 'PAY-JYUAQWLDNJKW', 1, 10, 1, 146, 12, NULL, 5, '1.00', 'Moip', 1, 2, NULL, 'localhost/octapay/checkout/4CEFE0AB', NULL, NULL, '3.00', '3700.00', '0.00', '30.00', '0.0299', NULL, '6.50', '243.45', '0.00', '3486.55', 1, '2021-02-24', '2021-02-23', NULL, '2021-02-23 15:25:05', '2021-02-23 18:25:07', '2021-02-23 18:25:07', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(418, 'PAY-WQUD79C1JM2J', 1, 10, 1, 147, 12, NULL, 5, '1.00', 'Moip', 1, 2, NULL, 'localhost/octapay/checkout/4CEFE0AB', NULL, NULL, '3730.00', '3700.00', '0.00', '30.00', '0.0299', NULL, '6.50', '243.45', '0.00', '3486.55', 1, '2021-02-24', '2021-02-23', NULL, '2021-02-23 15:27:02', '2021-02-23 18:27:04', '2021-02-23 18:27:04', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(419, 'PAY-YX0AT5GXFDN8', 1, 10, 1, 148, 12, NULL, 5, '1.00', 'Moip', 1, 2, NULL, 'localhost/octapay/checkout/4CEFE0AB', NULL, NULL, '3730.00', '3700.00', '0.00', '30.00', '0.0299', NULL, '6.50', '243.45', '0.00', '3486.55', 1, '2021-02-24', '2021-02-23', NULL, '2021-02-23 15:29:39', '2021-02-23 18:29:44', '2021-02-23 18:29:44', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(420, 'PAY-966Z7A4U314I', 1, NULL, 1, 149, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-M0AZUUQUWCU4/print', NULL, '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-25', '2021-02-24', NULL, '2021-02-24 16:21:56', '2021-02-24 19:22:01', '2021-02-24 19:22:01', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(421, 'PAY-GX7EZ1LUJE5H', 1, NULL, 1, 150, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-RDA6EOFHJ8TI/print', NULL, '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-26', '2021-02-25', NULL, '2021-02-25 14:25:35', '2021-02-25 17:25:41', '2021-02-25 17:25:42', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(422, 'PAY-EDOE68WXNNDG', 1, NULL, 1, 151, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-3B80LYEROBUI/print', NULL, '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-26', '2021-02-25', NULL, '2021-02-25 14:27:58', '2021-02-25 17:28:02', '2021-02-25 17:28:03', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(423, 'PAY-5MRAXOERQ558', 1, NULL, 1, 152, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-B8GYRYAXZ1DV/print', '00190.00009 02625.444001 03457.905176 1 85430000026442', '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-02-26', '2021-02-25', NULL, '2021-02-25 14:29:13', '2021-02-25 17:29:17', '2021-02-25 17:29:17', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(424, 'PAY-S0NPACZ1Y50M', 1, NULL, 1, 153, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-VWMFFXJ9RKL4/print', '00190.00009 02625.444001 03462.294178 4 85440000029442', '294.42', '264.42', '0.00', '30.00', '0.0000', NULL, '6.50', '20.14', '0.00', '274.28', 1, '2021-02-27', '2021-02-26', NULL, '2021-02-26 16:02:14', '2021-02-26 19:02:19', '2021-02-26 19:02:19', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(425, 'PAY-YD4ATY6BRZP4', 1, NULL, 1, 154, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-3N1DMUS9UXR5/print', '00190.00009 02625.444001 03462.297171 3 85440000029442', '294.42', '264.42', '0.00', '30.00', '0.0000', NULL, '6.50', '20.14', '0.00', '274.28', 1, '2021-02-27', '2021-02-26', NULL, '2021-02-26 16:03:47', '2021-02-26 19:03:53', '2021-02-26 19:03:53', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(426, 'PAY-SMLBH0N6V1J0', 1, NULL, 1, 155, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-YDD5SKB5EUNY/print', '00190.00009 02625.444001 03462.303177 3 85440000029442', '294.42', '264.42', '0.00', '30.00', '0.0000', NULL, '6.50', '20.14', '0.00', '274.28', 1, '2021-02-27', '2021-02-26', NULL, '2021-02-26 16:05:53', '2021-02-26 19:05:57', '2021-02-26 19:05:57', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(427, 'PAY-CBP4NTD503W5', 1, NULL, 1, 156, 12, NULL, 5, '89.90', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-VX8AJ4I8NL1Q/print', '00190.00009 02625.444001 03462.304175 1 85440000029442', '294.42', '264.42', '0.00', '30.00', '0.0000', NULL, '6.50', '20.14', '0.00', '274.28', 1, '2021-02-27', '2021-02-26', NULL, '2021-02-26 16:09:04', '2021-02-26 19:09:10', '2021-02-26 19:09:10', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL),
(428, 'PAY-CNLM32XRNOGB', 3, NULL, 1, 157, 3, NULL, 12, '46.80', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/B3105BE3', 'https://sandbox.moip.com.br/v2/boleto/BOL-5F87SI8NU5CY/print', '34191.09032 47353.580195 61309.830000 3 85510000023400', '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.50', '16.21', '0.00', '217.79', 1, '2021-03-06', '2021-03-01', NULL, '2021-03-01 10:11:26', '2021-03-01 13:11:31', '2021-03-01 13:11:31', '', '', '', '', '', 0, 0, NULL, '', '127.0.0.1', NULL),
(429, 'PAY-GOCOA8JR4QY6', 3, NULL, 1, 158, 3, NULL, 12, '46.80', 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/B3105BE3', 'https://sandbox.moip.com.br/v2/boleto/BOL-MM6MMZQQ53OH/print', '34191.09032 47354.810195 61309.830000 8 85510000023400', '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.50', '16.21', '0.00', '217.79', 1, '2021-03-06', '2021-03-01', NULL, '2021-03-01 10:27:14', '2021-03-01 13:27:19', '2021-03-01 13:27:19', '', '', '', '', '', 0, 0, NULL, '', '127.0.0.1', NULL),
(430, 'PAY-4TSHTF03PC25', 3, NULL, 1, 159, 3, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/B3105BE3', 'https://sandbox.moip.com.br/v2/boleto/BOL-0Q7201E5CF38/print', '34191.09032 47355.720195 61309.830000 1 85510000023400', '234.00', '234.00', '0.00', '0.00', '0.0000', NULL, '6.50', '16.21', '0.00', '217.79', 1, '2021-03-06', '2021-03-01', NULL, '2021-03-01 10:53:54', '2021-03-01 13:53:59', '2021-03-01 13:53:59', '', '', '', '', '', 0, 0, NULL, '', '::1', NULL),
(431, 'PAY-ZM834GZMZK86', 3, NULL, 1, 160, 3, NULL, NULL, NULL, 'Moip', 1, 2, NULL, 'localhost/octapay/checkout/B3105BE3', NULL, NULL, '281.88', '234.00', '47.88', '0.00', '0.0299', NULL, '6.50', '16.21', '0.00', '217.79', 12, '2021-03-06', '2021-03-01', NULL, '2021-03-01 11:41:47', '2021-03-01 14:41:50', '2021-03-01 14:41:50', '', '', '', '', '', 0, 0, NULL, '', '::1', NULL),
(432, 'PAY-4QU0J4HFWGWX', 1, NULL, 1, 161, 12, NULL, NULL, NULL, 'Moip', 2, 1, NULL, 'localhost/octapay/checkout/426A0EF5', 'https://sandbox.moip.com.br/v2/boleto/BOL-23ADS4W6BTSE/print', '00190.00009 02625.444001 03476.476175 5 85470000026442', '264.42', '264.42', '0.00', '0.00', '0.0000', NULL, '6.50', '18.19', '0.00', '246.23', 1, '2021-03-02', '2021-03-01', NULL, '2021-03-01 17:51:09', '2021-03-01 20:51:13', '2021-03-01 20:51:13', '', '', '', '', '', 0, 0, NULL, '/3//12/', '127.0.0.1', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas_tmp`
--

CREATE TABLE `vendas_tmp` (
  `id` int(11) NOT NULL,
  `transacao` varchar(30) DEFAULT NULL,
  `produto` int(11) DEFAULT NULL,
  `nome_produto` varchar(100) DEFAULT NULL,
  `codigo_produto` varchar(20) DEFAULT NULL,
  `plano` int(11) DEFAULT NULL,
  `nome_plano` varchar(100) DEFAULT NULL,
  `codigo_plano` varchar(20) DEFAULT NULL,
  `produtor` int(11) DEFAULT NULL,
  `nome_produtor` varchar(100) DEFAULT NULL,
  `campanha` int(11) DEFAULT NULL,
  `nome_campanha` varchar(100) DEFAULT NULL,
  `afiliado` int(11) DEFAULT NULL,
  `nome_afiliado` varchar(100) DEFAULT NULL,
  `comissao_afiliado` decimal(10,2) DEFAULT NULL,
  `meio_pagamento` varchar(30) DEFAULT NULL,
  `forma_pagamento` tinyint(4) DEFAULT NULL,
  `status_transacao` tinyint(4) DEFAULT NULL,
  `url_checkout` varchar(200) DEFAULT NULL,
  `link_boleto` varchar(300) DEFAULT NULL,
  `valor_bruto` decimal(10,2) DEFAULT NULL,
  `valor_produto` decimal(10,2) DEFAULT NULL,
  `valor_frete` decimal(10,2) DEFAULT NULL,
  `taxa_juros` decimal(10,2) DEFAULT NULL,
  `taxa_octapay` decimal(10,2) DEFAULT NULL,
  `valor_octapay` decimal(10,2) DEFAULT NULL,
  `valor_desconto` decimal(10,2) DEFAULT NULL,
  `valor_liquido` decimal(10,2) DEFAULT NULL,
  `parcelas` int(11) DEFAULT NULL,
  `data_pedido` date DEFAULT NULL,
  `data_finalizada` datetime DEFAULT NULL,
  `data_ultimo_evento` datetime DEFAULT NULL,
  `src` varchar(100) DEFAULT NULL,
  `utm_source` varchar(100) DEFAULT NULL,
  `utm_campaign` varchar(100) DEFAULT NULL,
  `utm_medium` varchar(200) DEFAULT NULL,
  `utm_content` varchar(200) DEFAULT NULL,
  `st4rt` int(11) DEFAULT NULL,
  `postback_st4rt` int(11) DEFAULT NULL,
  `carrinho_abandonado` int(11) DEFAULT NULL,
  `coprodutores` varchar(200) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `comprador` int(11) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `tipo_doc` tinyint(4) DEFAULT NULL,
  `cpf_cnpj` varchar(16) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `pais` varchar(3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `afiliacao`
--
ALTER TABLE `afiliacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `afiliado` (`afiliado`),
  ADD KEY `produto` (`produto`);

--
-- Índices para tabela `antecipacao`
--
ALTER TABLE `antecipacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `usuario_ultima_alteracao` (`usuario_ultima_alteracao`);

--
-- Índices para tabela `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`);

--
-- Índices para tabela `campanhas`
--
ALTER TABLE `campanhas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pixel` (`pixel`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `produto` (`produto`);

--
-- Índices para tabela `carrinho_abandonado`
--
ALTER TABLE `carrinho_abandonado`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `produto` (`produto`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `plano` (`plano`);

--
-- Índices para tabela `comissao`
--
ALTER TABLE `comissao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto` (`produto`),
  ADD KEY `venda` (`venda`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `usuario_ultima_alteracao` (`usuario_ultima_alteracao`);

--
-- Índices para tabela `configuracao_checkout`
--
ALTER TABLE `configuracao_checkout`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `co_produtor`
--
ALTER TABLE `co_produtor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `co_produtor` (`co_produtor`);

--
-- Índices para tabela `denuncias_produto`
--
ALTER TABLE `denuncias_produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto` (`produto`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `usuario_ultima_alteracao` (`usuario_ultima_alteracao`);

--
-- Índices para tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `venda` (`venda`);

--
-- Índices para tabela `integracao_notazz`
--
ALTER TABLE `integracao_notazz`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `nota_fiscal`
--
ALTER TABLE `nota_fiscal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `venda` (`venda`);

--
-- Índices para tabela `notificacao`
--
ALTER TABLE `notificacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `venda` (`venda`);

--
-- Índices para tabela `notificacoes_inteligentes`
--
ALTER TABLE `notificacoes_inteligentes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permissao`
--
ALTER TABLE `permissao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `permissaomodulo`
--
ALTER TABLE `permissaomodulo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pixel`
--
ALTER TABLE `pixel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`);

--
-- Índices para tabela `planos`
--
ALTER TABLE `planos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_plano` (`codigo`),
  ADD KEY `produto` (`produto`),
  ADD KEY `usuario` (`usuario`);

--
-- Índices para tabela `postback`
--
ALTER TABLE `postback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto` (`produto`),
  ADD KEY `usuario` (`usuario`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `usuario_ultima_alteracao` (`usuario_ultima_alteracao`);

--
-- Índices para tabela `recuperar_senha`
--
ALTER TABLE `recuperar_senha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`);

--
-- Índices para tabela `saldo`
--
ALTER TABLE `saldo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`);

--
-- Índices para tabela `sessao`
--
ALTER TABLE `sessao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`);

--
-- Índices para tabela `taxas`
--
ALTER TABLE `taxas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_ultima_alteracao` (`usuario_ultima_alteracao`);

--
-- Índices para tabela `urls`
--
ALTER TABLE `urls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto` (`produto`),
  ADD KEY `usuario` (`usuario`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_dados` (`usuario_dados`);

--
-- Índices para tabela `usuario_dados`
--
ALTER TABLE `usuario_dados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf_cnpj` (`cpf_cnpj`),
  ADD KEY `usuario` (`usuario`);

--
-- Índices para tabela `usuario_premium`
--
ALTER TABLE `usuario_premium`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `indicado` (`indicado`),
  ADD KEY `usuario` (`usuario`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `afiliado` (`afiliado`),
  ADD KEY `comprador` (`comprador`),
  ADD KEY `plano` (`plano`),
  ADD KEY `produto` (`produto`),
  ADD KEY `produtor` (`produtor`),
  ADD KEY `campanha` (`campanha`);

--
-- Índices para tabela `vendas_tmp`
--
ALTER TABLE `vendas_tmp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `afiliacao`
--
ALTER TABLE `afiliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `antecipacao`
--
ALTER TABLE `antecipacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `api`
--
ALTER TABLE `api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `banco`
--
ALTER TABLE `banco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `campanhas`
--
ALTER TABLE `campanhas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `carrinho_abandonado`
--
ALTER TABLE `carrinho_abandonado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `comissao`
--
ALTER TABLE `comissao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=416;

--
-- AUTO_INCREMENT de tabela `configuracao_checkout`
--
ALTER TABLE `configuracao_checkout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `co_produtor`
--
ALTER TABLE `co_produtor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `denuncias_produto`
--
ALTER TABLE `denuncias_produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT de tabela `integracao_notazz`
--
ALTER TABLE `integracao_notazz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `nota_fiscal`
--
ALTER TABLE `nota_fiscal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `notificacao`
--
ALTER TABLE `notificacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=359;

--
-- AUTO_INCREMENT de tabela `notificacoes_inteligentes`
--
ALTER TABLE `notificacoes_inteligentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `permissao`
--
ALTER TABLE `permissao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `permissaomodulo`
--
ALTER TABLE `permissaomodulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pixel`
--
ALTER TABLE `pixel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `planos`
--
ALTER TABLE `planos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `postback`
--
ALTER TABLE `postback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `recuperar_senha`
--
ALTER TABLE `recuperar_senha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `saldo`
--
ALTER TABLE `saldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `sessao`
--
ALTER TABLE `sessao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de tabela `taxas`
--
ALTER TABLE `taxas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `urls`
--
ALTER TABLE `urls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `usuario_dados`
--
ALTER TABLE `usuario_dados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de tabela `usuario_premium`
--
ALTER TABLE `usuario_premium`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- AUTO_INCREMENT de tabela `vendas_tmp`
--
ALTER TABLE `vendas_tmp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `afiliacao`
--
ALTER TABLE `afiliacao`
  ADD CONSTRAINT `afiliacao_ibfk_1` FOREIGN KEY (`afiliado`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `afiliacao_ibfk_2` FOREIGN KEY (`produto`) REFERENCES `produto` (`id`);

--
-- Limitadores para a tabela `antecipacao`
--
ALTER TABLE `antecipacao`
  ADD CONSTRAINT `antecipacao_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `antecipacao_ibfk_2` FOREIGN KEY (`usuario_ultima_alteracao`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `banco`
--
ALTER TABLE `banco`
  ADD CONSTRAINT `banco_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `campanhas`
--
ALTER TABLE `campanhas`
  ADD CONSTRAINT `campanhas_ibfk_1` FOREIGN KEY (`pixel`) REFERENCES `pixel` (`id`),
  ADD CONSTRAINT `campanhas_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `campanhas_ibfk_3` FOREIGN KEY (`produto`) REFERENCES `produto` (`id`);

--
-- Limitadores para a tabela `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`produto`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `checkout_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `checkout_ibfk_3` FOREIGN KEY (`plano`) REFERENCES `planos` (`id`);

--
-- Limitadores para a tabela `comissao`
--
ALTER TABLE `comissao`
  ADD CONSTRAINT `comissao_ibfk_1` FOREIGN KEY (`produto`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `comissao_ibfk_2` FOREIGN KEY (`venda`) REFERENCES `vendas` (`id`),
  ADD CONSTRAINT `comissao_ibfk_3` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `comissao_ibfk_4` FOREIGN KEY (`usuario_ultima_alteracao`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `co_produtor`
--
ALTER TABLE `co_produtor`
  ADD CONSTRAINT `co_produtor_ibfk_1` FOREIGN KEY (`co_produtor`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `denuncias_produto`
--
ALTER TABLE `denuncias_produto`
  ADD CONSTRAINT `denuncias_produto_ibfk_1` FOREIGN KEY (`produto`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `denuncias_produto_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `denuncias_produto_ibfk_3` FOREIGN KEY (`usuario_ultima_alteracao`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `enderecos_ibfk_2` FOREIGN KEY (`venda`) REFERENCES `vendas` (`id`);

--
-- Limitadores para a tabela `nota_fiscal`
--
ALTER TABLE `nota_fiscal`
  ADD CONSTRAINT `nota_fiscal_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `nota_fiscal_ibfk_2` FOREIGN KEY (`venda`) REFERENCES `vendas` (`id`);

--
-- Limitadores para a tabela `notificacao`
--
ALTER TABLE `notificacao`
  ADD CONSTRAINT `notificacao_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `notificacao_ibfk_2` FOREIGN KEY (`venda`) REFERENCES `vendas` (`id`);

--
-- Limitadores para a tabela `pixel`
--
ALTER TABLE `pixel`
  ADD CONSTRAINT `pixel_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `planos`
--
ALTER TABLE `planos`
  ADD CONSTRAINT `planos_ibfk_1` FOREIGN KEY (`produto`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `planos_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `postback`
--
ALTER TABLE `postback`
  ADD CONSTRAINT `postback_ibfk_1` FOREIGN KEY (`produto`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `postback_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`usuario_ultima_alteracao`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `recuperar_senha`
--
ALTER TABLE `recuperar_senha`
  ADD CONSTRAINT `recuperar_senha_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `saldo`
--
ALTER TABLE `saldo`
  ADD CONSTRAINT `saldo_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `sessao`
--
ALTER TABLE `sessao`
  ADD CONSTRAINT `sessao_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `taxas`
--
ALTER TABLE `taxas`
  ADD CONSTRAINT `taxas_ibfk_1` FOREIGN KEY (`usuario_ultima_alteracao`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `urls`
--
ALTER TABLE `urls`
  ADD CONSTRAINT `urls_ibfk_1` FOREIGN KEY (`produto`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `urls_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`usuario_dados`) REFERENCES `usuario_dados` (`id`);

--
-- Limitadores para a tabela `usuario_dados`
--
ALTER TABLE `usuario_dados`
  ADD CONSTRAINT `usuario_dados_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `usuario_premium`
--
ALTER TABLE `usuario_premium`
  ADD CONSTRAINT `usuario_premium_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `usuario_premium_ibfk_2` FOREIGN KEY (`indicado`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`afiliado`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `vendas_ibfk_2` FOREIGN KEY (`comprador`) REFERENCES `usuario_dados` (`id`),
  ADD CONSTRAINT `vendas_ibfk_3` FOREIGN KEY (`plano`) REFERENCES `planos` (`id`),
  ADD CONSTRAINT `vendas_ibfk_4` FOREIGN KEY (`produto`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `vendas_ibfk_5` FOREIGN KEY (`produtor`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `vendas_ibfk_6` FOREIGN KEY (`campanha`) REFERENCES `campanhas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
