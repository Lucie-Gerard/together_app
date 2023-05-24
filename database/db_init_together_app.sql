-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 05, 2023 at 12:53 PM
-- Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `together_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_datetime` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `max_nb_participants` int(11) NOT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `orga_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `title`, `start_datetime`, `duration`, `description`, `max_nb_participants`, `location_id`, `created_at`, `updated_at`, `orga_id`, `category_id`) VALUES
(1, 'Randonnée à cheval', '2023-07-01 09:00:00', 5, 'Une randonnée à cheval dans les magnifiques paysages de Gouvy !', 8, 383, NULL, NULL, 6, 5),
(2, 'La Super Asymétrie', '2023-07-03 08:30:00', 6, 'Assistez à une conférence passionnante sur la super asymétrie, présentée par le Dr Sheldon Cooper, éminent physicien théoricien. La super asymétrie est un domaine fascinant de la physique qui explore les propriétés fondamentales de l\'univers et la façon dont les particules élémentaires interagissent. La conférence de Sheldon fournira une introduction approfondie à ce sujet complexe, abordant des questions telles que la brisure de symétrie, les particules supersymétriques et les modèles de physique des particules. Vous découvrirez comment les dernières avancées dans ce domaine peuvent aider à résoudre certains des problèmes les plus intrigants de la physique, tels que la nature de la matière noire. Rendez-vous dans l\'amphithéâtre du département de Physique de l\'ULiège !', 200, 17, NULL, NULL, 1, 7),
(3, 'Tournoi d\'arts martiaux', '2023-07-15 09:00:00', 2160, 'Goku organise un tournoi d\'arts martiaux où les participants s\'affrontent pour démontrer leur maîtrise des techniques de combat et leur discipline physique et mentale. Les combats se déroulent dans un ring, où les juges évaluent les compétences des combattants en fonction de critères tels que la précision des mouvements, la stratégie et l\'efficacité des attaques. C\'est une activité passionnante pour tous ceux qui s\'intéressent aux arts martiaux et à la culture japonaise.', 80, 215, NULL, NULL, 8, 12),
(4, 'Voyage spatial', '2023-09-09 15:00:00', 300, 'Préparez-vous à vivre une expérience unique en son genre ! J\'organise un voyage spatial qui vous emmènera en orbite autour de la Terre. Vous aurez la chance d\'observer notre planète sous un angle complètement différent et de voir les contours de nos villes et les paysages majestueux de l\'espace. Vous pourrez également en apprendre davantage sur les défis techniques que posent les voyages spatiaux et sur la vie dans l\'espace en général. Cette expérience dure 5 heures et les places sont limitées à 20 participants. Ne manquez pas cette occasion de vivre un moment inoubliable ! Inscrivez-vous dès maintenant.', 20, NULL, NULL, NULL, 7, 9),
(5, 'Grande picole', '2023-05-16 16:00:00', 720, 'Plongeons notre désarroi dans l\'alcool, oublions les examens et les projets, essayons de chasser de nos rêves toutes ces lignes SQL, relâchons la pression et oublions la vie', 30, 203, NULL, NULL, 18, 10);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Randonnée'),
(2, 'Vélo'),
(3, 'Moto'),
(4, 'Rallye'),
(5, 'Cheval'),
(6, 'Culture'),
(7, 'Conférences'),
(8, 'Nerd/Geek'),
(9, 'Voyage'),
(10, 'Resto/Bar'),
(11, 'LGBTQIA+'),
(12, 'Autre');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `iso_code` int(10) UNSIGNED NOT NULL,
  `name_fr` varchar(255) NOT NULL,
  `name_nl` varchar(255) NOT NULL,
  `name_de` varchar(255) NOT NULL,
  `name_lu` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`iso_code`, `name_fr`, `name_nl`, `name_de`, `name_lu`, `name_en`) VALUES
(31, 'Pays-Bas', 'Nederland', 'Niederlande', 'Nederland', 'Netherlands'),
(32, 'Belgique', 'België', 'Belgien', 'Belsch', 'Belgium'),
(33, 'France', 'Frankrijk', 'Frankreich', 'Frankräich', 'France'),
(49, 'Allemagne', 'Duitsland', 'Deutschland', 'Däitschland', 'Germany'),
(352, 'Luxembourg', 'Luxemburg', 'Luxemburg', 'Lëtzebuerg', 'Luxembourg');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follower_following`
--

CREATE TABLE `follower_following` (
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `following_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coord_x` double(8,2) DEFAULT NULL,
  `coord_y` double(8,2) DEFAULT NULL,
  `postal_code` int(10) UNSIGNED NOT NULL,
  `locality_fr` varchar(255) NOT NULL,
  `locality_nl` varchar(255) DEFAULT NULL,
  `locality_de` varchar(255) DEFAULT NULL,
  `locality_lu` varchar(255) DEFAULT NULL,
  `locality_en` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `coord_x`, `coord_y`, `postal_code`, `locality_fr`, `locality_nl`, `locality_de`, `locality_lu`, `locality_en`) VALUES
(17, 4.36, 50.85, 1000, 'Bruxelles', NULL, NULL, NULL, 'Brussels'),
(18, 4.35, 50.85, 1020, 'Laeken', NULL, NULL, NULL, 'Laken'),
(19, 4.35, 50.90, 1030, 'Schaerbeek', NULL, NULL, NULL, 'Schaarbeek'),
(20, 4.40, 50.89, 1040, 'Etterbeek', NULL, NULL, NULL, 'Etterbeek'),
(21, 4.37, 50.83, 1050, 'Ixelles', NULL, NULL, NULL, 'Elsene'),
(22, 4.34, 50.82, 1060, 'Saint-Gilles', NULL, NULL, NULL, 'Sint-Gillis'),
(23, 4.35, 50.84, 1070, 'Anderlecht', NULL, NULL, NULL, 'Anderlecht'),
(24, 4.33, 50.85, 1080, 'Molenbeek-Saint-Jean', NULL, NULL, NULL, 'Sint-Jans-Molenbeek'),
(25, 4.32, 50.84, 1081, 'Koekelberg', NULL, NULL, NULL, 'Koekelberg'),
(26, 4.31, 50.87, 1082, 'Berchem-Sainte-Agathe', NULL, NULL, NULL, 'Sint-Agatha-Berchem'),
(27, 4.30, 50.86, 1083, 'Ganshoren', NULL, NULL, NULL, 'Ganshoren'),
(28, 4.29, 50.84, 1090, 'Jette', NULL, NULL, NULL, 'Jette'),
(29, 4.37, 50.81, 1180, 'Uccle', NULL, NULL, NULL, 'Ukkel'),
(30, 4.40, 50.80, 1190, 'Forest', NULL, NULL, NULL, 'Vorst'),
(31, 4.42, 50.85, 1200, 'Woluwe-Saint-Lambert', NULL, NULL, NULL, 'Sint-Lambrechts-Woluwe'),
(32, 4.44, 50.83, 1210, 'Woluwe-Saint-Pierre', NULL, NULL, NULL, 'Sint-Pieters-Woluwe'),
(33, 4.39, 50.82, 1120, 'Neder-Over-Heembeek', 'Neder-Over-Heembeek', 'Neder-Over-Heembeek', 'Nidder-Ädder-Hiembeek', 'Neder-Over-Heembeek'),
(34, 3.23, 51.21, 2000, 'Anvers', 'Antwerpen', 'Antwerpen', 'Antwerpen', 'Antwerp'),
(35, 3.12, 50.88, 2800, 'Malines', 'Mechelen', 'Mecheln', 'Mechelen', 'Mechelen'),
(36, 3.44, 50.92, 1800, 'Vilvorde', 'Vilvoorde', 'Friedrichshafen', 'Vilvoorde', 'Vilvoorde'),
(37, 3.27, 50.82, 1600, 'Sint-Pieters-Leeuw', 'Sint-Pieters-Leeuw', 'Sint-Pieters-Leeuw', 'Sankt-Pieters-Leeuw', 'Sint-Pieters-Leeuw'),
(38, 4.07, 51.08, 3000, 'Louvain', 'Leuven', 'Löwen', 'Leuve', 'Leuven'),
(39, 4.45, 50.89, 3500, 'Hasselt', 'Hasselt', 'Hasselt', 'Hassel', 'Hasselt'),
(40, 3.12, 51.22, 2100, 'Deurne', 'Deurne', 'Deurne', 'Deire', 'Deurne'),
(41, 3.27, 50.99, 1980, 'Zemst', 'Zemst', 'Semet', 'Zemst', 'Zemst'),
(42, 4.40, 51.22, 3200, 'Aarschot', 'Aarschot', 'Aarschot', 'Aarschot', 'Aarschot'),
(43, 3.24, 51.34, 2950, 'Kapellen', 'Kapellen', 'Kapellen', 'Kapellen', 'Kapellen'),
(44, 3.18, 51.30, 2930, 'Brasschaat', 'Brasschaat', 'Brasschaat', 'Brasschaat', 'Brasschaat'),
(46, 4.04, 51.17, 3150, 'Wavre', 'Waver', 'Wavre', 'Wâwer', 'Wavre'),
(47, 3.76, 51.05, 3201, 'Langdorp', 'Langdorp', 'Langdorp', 'Langdorp', 'Langdorp'),
(48, 4.67, 50.97, 3980, 'Tessenderlo', 'Tessenderlo', 'Tessenderlo', 'Tessenderlo', 'Tessenderlo'),
(49, 4.52, 51.03, 2340, 'Beerse', 'Beerse', NULL, NULL, 'Beerse'),
(50, 4.43, 51.02, 2270, 'Herenthout', 'Herenthout', NULL, NULL, 'Herenthout'),
(51, 4.63, 50.93, 2400, 'Mol', 'Mol', NULL, NULL, 'Mol'),
(52, 4.42, 51.22, 2200, 'Herentals', 'Herentals', NULL, NULL, 'Herentals'),
(53, 4.88, 51.10, 2300, 'Turnhout', 'Turnhout', NULL, NULL, 'Turnhout'),
(54, 3.10, 50.78, 8620, 'Nieuport', 'Nieuwpoort', NULL, NULL, 'Nieuwpoort'),
(55, 4.97, 51.17, 2330, 'Merksplas', 'Merksplas', NULL, NULL, 'Merksplas'),
(56, 5.20, 51.28, 2440, 'Geel', 'Geel', NULL, NULL, 'Geel'),
(58, 4.77, 51.08, 2380, 'Ravels', 'Ravels', NULL, NULL, 'Ravels'),
(59, 4.48, 50.88, 8620, 'Dixmude', 'Diksmuide', NULL, NULL, 'Diksmuide'),
(60, 4.57, 51.03, 2260, 'Oevel', 'Oevel', NULL, NULL, 'Oevel'),
(61, 5.13, 51.15, 2360, 'Oud-Turnhout', 'Oud-Turnhout', NULL, NULL, 'Oud-Turnhout'),
(62, 4.38, 51.28, 2970, 'Schilde', 'Schilde', NULL, NULL, 'Schilde'),
(63, 4.17, 51.17, 3290, 'Diest', 'Diest', NULL, NULL, 'Diest'),
(64, 3.24, 51.21, 9770, 'Kruishoutem', 'Kruishoutem', 'Kruishoutem', 'Kruishoutem', 'Kruishoutem'),
(65, 4.63, 50.80, 3020, 'Herent', 'Herent', 'Herent', 'Herent', 'Herent'),
(66, 4.79, 51.19, 2430, 'Laakdal', 'Laakdal', 'Laakdal', 'Laakdal', 'Laakdal'),
(67, 5.13, 51.23, 3945, 'Ham', 'Ham', 'Ham', 'Ham', 'Ham'),
(68, 3.22, 50.94, 6680, 'Sainte-Ode', 'Sainte-Ode', 'Sainte-Ode', 'Sainte-Ode', 'Sainte-Ode'),
(69, 4.43, 51.14, 2520, 'Ranst', 'Ranst', 'Ranst', 'Ranst', 'Ranst'),
(70, 3.74, 51.00, 6920, 'Wellin', 'Wellin', 'Wellin', 'Wellin', 'Wellin'),
(71, 4.38, 50.88, 3390, 'Tielt-Winge', 'Tielt-Winge', 'Tielt-Winge', 'Tielt-Winge', 'Tielt-Winge'),
(72, 5.30, 50.91, 6671, 'Biesme-sous-Thuin', 'Biesme-sous-Thuin', 'Biesme-sous-Thuin', 'Biesme-sous-Thuin', 'Biesme-sous-Thuin'),
(73, 3.75, 50.88, 5580, 'Villers-le-Gambon', 'Villers-le-Gambon', 'Villers-le-Gambon', 'Villers-le-Gambon', 'Villers-le-Gambon'),
(74, 4.40, 50.97, 3294, 'Molenstede', 'Molenstede', 'Molenstede', 'Molenstede', 'Molenstede'),
(75, 3.61, 51.01, 5660, 'Mariembourg', 'Mariembourg', 'Mariembourg', 'Mariembourg', 'Mariembourg'),
(76, 5.04, 51.07, 2490, 'Balen', 'Balen', 'Balen', 'Balen', 'Balen'),
(77, 4.73, 50.70, 1370, 'Jodoigne', NULL, NULL, NULL, NULL),
(78, 4.42, 50.47, 1400, 'Nivelles', NULL, NULL, NULL, NULL),
(79, 4.34, 50.70, 1410, 'Waterloo', NULL, NULL, NULL, NULL),
(80, 4.68, 50.60, 1420, 'Braine-l\'Alleud', NULL, NULL, NULL, NULL),
(81, 5.22, 50.35, 1440, 'Wauthier-Braine', NULL, NULL, NULL, NULL),
(82, 4.57, 50.47, 1470, 'Genappe', NULL, NULL, NULL, NULL),
(83, 4.88, 50.58, 1490, 'Court-Saint-Etienne', NULL, NULL, NULL, NULL),
(84, 4.27, 50.65, 1495, 'Villers-la-Ville', NULL, NULL, NULL, NULL),
(85, 5.08, 50.58, 1500, 'Halle', NULL, NULL, NULL, NULL),
(86, 4.42, 50.60, 1501, 'Buizingen', NULL, NULL, NULL, NULL),
(87, 5.17, 50.60, 1520, 'Braine-le-Chateau', NULL, NULL, NULL, NULL),
(88, 4.25, 50.35, 1521, 'Haut-Ittre', NULL, NULL, NULL, NULL),
(89, 4.20, 50.55, 1522, 'Chasteaux', NULL, NULL, NULL, NULL),
(90, 4.60, 50.63, 1540, 'Herne', NULL, NULL, NULL, NULL),
(91, 4.30, 50.62, 1541, 'Sint-Pieters-Kapelle', NULL, NULL, NULL, NULL),
(92, 4.17, 50.62, 1547, 'Biévène', NULL, NULL, NULL, NULL),
(93, 4.93, 50.67, 1560, 'Hoeilaart', NULL, NULL, NULL, NULL),
(94, 4.33, 50.70, 1570, 'Tollembeek', NULL, NULL, NULL, NULL),
(95, 4.38, 50.73, 1601, 'Ruisbroek', NULL, NULL, NULL, NULL),
(96, 4.25, 50.60, 1602, 'Vlezenbeek', NULL, NULL, NULL, NULL),
(97, 4.50, 50.75, 1620, 'Drogenbos', NULL, NULL, NULL, NULL),
(98, 4.40, 50.72, 1630, 'Linkebeek', NULL, NULL, NULL, NULL),
(99, NULL, NULL, 4000, 'Liège', 'Luik', 'Lüttich', 'Lidje', 'Liège'),
(100, NULL, NULL, 4000, 'Glain', NULL, NULL, NULL, NULL),
(101, NULL, NULL, 4020, 'Jupille-sur-Meuse', NULL, NULL, NULL, NULL),
(102, NULL, NULL, 4030, 'Grivegnée', NULL, NULL, NULL, NULL),
(103, NULL, NULL, 4031, 'Angleur', NULL, NULL, NULL, NULL),
(104, NULL, NULL, 4100, 'Seraing', NULL, NULL, NULL, NULL),
(105, NULL, NULL, 4101, 'Jemeppe-sur-Meuse', NULL, NULL, NULL, NULL),
(106, NULL, NULL, 4102, 'Ougrée', NULL, NULL, NULL, NULL),
(107, NULL, NULL, 4120, 'Ehein', NULL, NULL, NULL, NULL),
(108, NULL, NULL, 4121, 'Neupré', NULL, NULL, NULL, NULL),
(109, NULL, NULL, 4122, 'Plainevaux', NULL, NULL, NULL, NULL),
(110, NULL, NULL, 4130, 'Esneux', NULL, NULL, NULL, NULL),
(111, NULL, NULL, 4140, 'Gomzé-Andoumont', NULL, NULL, NULL, NULL),
(112, NULL, NULL, 4141, 'Louveigné', NULL, NULL, NULL, NULL),
(113, NULL, NULL, 4160, 'Anthisnes', NULL, NULL, NULL, NULL),
(114, NULL, NULL, 4170, 'Comblain-au-Pont', NULL, NULL, NULL, NULL),
(115, NULL, NULL, 4171, 'Poulseur', NULL, NULL, NULL, NULL),
(116, NULL, NULL, 4180, 'Comblain-Fairon', NULL, NULL, NULL, NULL),
(117, NULL, NULL, 4181, 'Hamoir', NULL, NULL, NULL, NULL),
(118, NULL, NULL, 4190, 'Ferrières', NULL, NULL, NULL, NULL),
(119, NULL, NULL, 4210, 'Burdinne', NULL, NULL, NULL, NULL),
(120, NULL, NULL, 4217, 'Héron', NULL, NULL, NULL, NULL),
(122, NULL, NULL, 4250, 'Boëlhe', NULL, NULL, NULL, NULL),
(123, NULL, NULL, 4252, 'Geer', NULL, NULL, NULL, NULL),
(124, NULL, NULL, 4253, 'Darion', NULL, NULL, NULL, NULL),
(125, NULL, NULL, 4254, 'Ligney', NULL, NULL, NULL, NULL),
(126, NULL, NULL, 4257, 'Rosoux-Crenwick', NULL, NULL, NULL, NULL),
(127, NULL, NULL, 4260, 'Braives', NULL, NULL, NULL, NULL),
(128, NULL, NULL, 4261, 'Latinne', NULL, NULL, NULL, NULL),
(129, NULL, NULL, 4263, 'Tourinne', NULL, NULL, NULL, NULL),
(130, NULL, NULL, 4280, 'Avernas-le-Bauduin', NULL, NULL, NULL, NULL),
(131, 5.38, 50.47, 4287, 'Racour', NULL, NULL, NULL, NULL),
(132, 5.00, 50.54, 4300, 'Bettincourt', NULL, NULL, NULL, NULL),
(133, 5.05, 50.61, 4317, 'Aineffe', NULL, NULL, NULL, NULL),
(134, 5.08, 50.60, 4317, 'Borlez', NULL, NULL, NULL, NULL),
(135, 5.02, 50.60, 4317, 'Celles', NULL, NULL, NULL, NULL),
(136, 5.09, 50.58, 4317, 'Faimes', NULL, NULL, NULL, NULL),
(137, 5.07, 50.62, 4317, 'Les Waleffes', NULL, NULL, NULL, NULL),
(138, 5.09, 50.56, 4317, 'Viemme', NULL, NULL, NULL, NULL),
(139, 5.19, 50.56, 4340, 'Awans', NULL, 'Awans', NULL, NULL),
(140, 5.20, 50.57, 4342, 'Hognoul', NULL, 'Hognoul', NULL, NULL),
(141, 5.17, 50.58, 4347, 'Fexhe-le-Haut-Clocher', NULL, NULL, NULL, NULL),
(142, 5.18, 50.56, 4347, 'Freloux', NULL, NULL, NULL, NULL),
(143, 5.20, 50.59, 4350, 'Pousset', NULL, 'Pousset', NULL, NULL),
(144, 5.18, 50.61, 4350, 'Remicourt', NULL, 'Remicourt', NULL, NULL),
(145, 5.18, 50.63, 4350, 'Villers-l\'Evêque', NULL, 'Villers-l\'Evêque', NULL, NULL),
(146, 5.18, 50.64, 4351, 'Hodeige', NULL, 'Hodeige', NULL, NULL),
(147, 5.19, 50.65, 4357, 'Donceel', NULL, NULL, NULL, NULL),
(148, 5.15, 50.65, 4357, 'Haneffe', NULL, NULL, NULL, NULL),
(149, 5.20, 50.65, 4357, 'Jeneffe', NULL, NULL, NULL, NULL),
(150, 5.17, 50.65, 4357, 'Limont', NULL, NULL, NULL, NULL),
(152, 5.01, 50.47, 4360, 'Bergilers', NULL, NULL, NULL, NULL),
(153, NULL, NULL, 4360, 'Grandville', NULL, NULL, NULL, NULL),
(154, NULL, NULL, 4360, 'Lens-Saint-Remy', NULL, NULL, NULL, NULL),
(155, NULL, NULL, 4360, 'Otrange', NULL, NULL, NULL, NULL),
(156, NULL, NULL, 4367, 'Crisnée', NULL, NULL, NULL, NULL),
(157, NULL, NULL, 4367, 'Fize-le-Marsal', NULL, NULL, NULL, NULL),
(158, NULL, NULL, 4367, 'Kemexhe', NULL, NULL, NULL, NULL),
(159, NULL, NULL, 4367, 'Odeur', NULL, NULL, NULL, NULL),
(160, NULL, NULL, 4400, 'Awirs', NULL, NULL, NULL, NULL),
(161, NULL, NULL, 4400, 'Chokier', NULL, NULL, NULL, NULL),
(162, NULL, NULL, 4400, 'Flémalle-Haute', NULL, NULL, NULL, NULL),
(163, NULL, NULL, 4400, 'Flémalle-Grande', NULL, NULL, NULL, NULL),
(164, NULL, NULL, 4400, 'Gleixhe', NULL, NULL, NULL, NULL),
(165, NULL, NULL, 4400, 'Ivoz-Ramet', NULL, NULL, NULL, NULL),
(166, NULL, NULL, 4400, 'Mons-lez-Liège', NULL, NULL, NULL, NULL),
(167, NULL, NULL, 4400, 'Wandre', NULL, NULL, NULL, NULL),
(168, NULL, NULL, 4420, 'Montegnée', NULL, NULL, NULL, NULL),
(169, NULL, NULL, 4420, 'Saint-Nicolas', NULL, NULL, NULL, NULL),
(170, NULL, NULL, 4430, 'Ans', NULL, NULL, NULL, NULL),
(171, NULL, NULL, 4431, 'Loncin', NULL, NULL, NULL, NULL),
(172, NULL, NULL, 4432, 'Alleur', NULL, NULL, NULL, NULL),
(173, NULL, NULL, 4450, 'Juprelle', NULL, NULL, NULL, NULL),
(174, NULL, NULL, 4451, 'Voroux-lez-Liers', NULL, NULL, NULL, NULL),
(175, NULL, NULL, 4452, 'Paifve', NULL, NULL, NULL, NULL),
(176, NULL, NULL, 4452, 'Wihogne', NULL, NULL, NULL, NULL),
(177, NULL, NULL, 4453, 'Villers-Saint-Siméon', NULL, NULL, NULL, NULL),
(178, NULL, NULL, 4500, 'Ben-Ahin', NULL, NULL, NULL, NULL),
(179, NULL, NULL, 4500, 'Huy', NULL, NULL, NULL, NULL),
(180, NULL, NULL, 4500, 'Tihange', NULL, NULL, NULL, NULL),
(181, NULL, NULL, 4520, 'Antheit', NULL, NULL, NULL, NULL),
(182, NULL, NULL, 4520, 'Bas-Oha', NULL, NULL, NULL, NULL),
(183, NULL, NULL, 4520, 'Huccorgne', NULL, NULL, NULL, NULL),
(184, 5.14, 50.46, 4530, 'Villers-le-Bouillet', 'Villers-le-Bouillet', 'Villers-le-Bouillet', 'Villers-le-Bouillet', 'Villers-le-Bouillet'),
(185, 5.32, 50.69, 4537, 'Verlaine', 'Verlaine', 'Verlaine', 'Verlaine', 'Verlaine'),
(186, 5.33, 50.66, 4537, 'Seraing-le-Château', 'Seraing-le-Château', 'Seraing-le-Château', 'Seraing-le-Château', 'Seraing-le-Château'),
(187, 5.36, 50.48, 4540, 'Amay', 'Amay', 'Amay', 'Amay', 'Amay'),
(188, 5.40, 50.64, 4545, 'Jehay', 'Jehay', 'Jehay', 'Jehay', 'Jehay'),
(189, 5.48, 50.46, 4550, 'Nandrin', 'Nandrin', 'Nandrin', 'Nandrin', 'Nandrin'),
(190, 5.57, 50.44, 4557, 'Tinlot', 'Tinlot', 'Tinlot', 'Tinlot', 'Tinlot'),
(191, 5.26, 50.58, 4560, 'Clermont-sous-Huy', 'Clermont-sous-Huy', 'Clermont-sous-Huy', 'Clermont-sous-Huy', 'Clermont-sous-Huy'),
(192, 5.26, 50.55, 4560, 'Bois-et-Borsu', 'Bois-et-Borsu', 'Bois-et-Borsu', 'Bois-et-Borsu', 'Bois-et-Borsu'),
(193, 5.28, 50.59, 4560, 'Clavier', 'Clavier', 'Clavier', 'Clavier', 'Clavier'),
(194, 5.34, 50.55, 4570, 'Marchin', 'Marchin', 'Marchin', 'Marchin', 'Marchin'),
(195, 5.39, 50.49, 4577, 'Pepinster', 'Pepinster', 'Pepinster', 'Pepinster', 'Pepinster'),
(196, 5.54, 50.40, 4590, 'Ouffet', 'Ouffet', 'Ouffet', 'Ouffet', 'Ouffet'),
(197, 5.48, 50.57, 4600, 'Lanaye', 'Lanaye', 'Lanaye', 'Lanaye', 'Lanaye'),
(198, 5.55, 50.63, 4602, 'Cheratte', 'Cheratte', 'Cheratte', 'Tsheråte', 'Cheratte'),
(199, 5.32, 50.58, 4606, 'Saint-André', 'Sint-Andries', 'Sankt Andreas', 'St-André', 'Saint-André'),
(200, 5.60, 50.65, 4607, 'Dalhem', 'Dalhem', 'Dalhem', 'Dolm', 'Dalhem'),
(201, 5.33, 50.58, 4608, 'Warsage', 'Warsage', 'Warsage', 'Wårsåtche', 'Warsage'),
(202, 5.63, 50.60, 4609, 'Queue-du-Bois', 'Bois-le-Duc', 'Bois-le-Duc', 'Boas-d\'Bwès', 'Queue-du-Bois'),
(203, 5.43, 50.73, 4620, 'Fléron', 'Fléron', 'Fléron', 'Fléirot', 'Fléron'),
(204, 5.57, 50.58, 4621, 'Retinne', 'Retinne', 'Retinne', 'Retinne', 'Retinne'),
(205, 5.55, 50.62, 4623, 'Magnée', 'Magnée', 'Magnée', 'Mådgni', 'Magnée'),
(206, 5.65, 50.58, 4624, 'Romsée', 'Romsée', 'Romsée', 'Rommessêye', 'Romsée'),
(207, 5.65, 50.67, 4630, 'Soumagne', 'Soumagne', 'Sohmagne', 'Såmnî', 'Soumagne'),
(208, 5.60, 50.70, 4631, 'Evegnée', 'Evegnée', 'Evegnée', 'Åvniyî', 'Evegnée'),
(209, 5.70, 50.65, 4632, 'Cérexhe-Heuseux', 'Cérexhe-Heuseux', 'Cérexhe-Heuseux', 'Cérexhe-Håsso', 'Cérexhe-Heuseux'),
(210, 5.70, 50.63, 4633, 'Melen', 'Melen', 'Melen', 'Målen', 'Melen'),
(211, 5.68, 50.67, 4650, 'Chaineux', 'Chaineux', 'Chaineux', 'Tchinneû', 'Chaineux'),
(212, 50.66, 5.87, 4651, 'Battice', 'Battice', 'Battice', 'Battice', 'Battice'),
(213, 50.63, 5.56, 4652, 'Xhendelesse', 'Xhendelesse', 'Xhendelesse', 'Xhendelesse', 'Xhendelesse'),
(214, 50.74, 5.81, 4653, 'Bolland', 'Bolland', 'Bolland', 'Bolland', 'Bolland'),
(215, 50.67, 5.85, 4654, 'Charneux', 'Charneux', 'Charneux', 'Charneux', 'Charneux'),
(216, 50.63, 5.67, 4670, 'Blégny', 'Blégny', 'Blégny', 'Blégny', 'Blégny'),
(217, 50.63, 5.68, 4671, 'Barchon', 'Barchon', 'Barchon', 'Barchon', 'Barchon'),
(218, 50.65, 5.72, 4672, 'Saint-Remy', 'Saint-Remy', 'Saint-Remy', 'Saint-Remy', 'Saint-Remy'),
(219, 50.61, 5.71, 4680, 'Oupeye', 'Oupeye', 'Oupeye', 'Oupeye', 'Oupeye'),
(220, 50.68, 5.61, 4681, 'Hermalle-sous-Argenteau', 'Hermalle-sous-Argenteau', 'Hermalle-sous-Argenteau', 'Hermalle-sous-Argenteau', 'Hermalle-sous-Argenteau'),
(221, 50.69, 5.57, 4682, 'Heure-le-Romain', 'Heure-le-Romain', 'Heure-le-Romain', 'Heure-le-Romain', 'Heure-le-Romain'),
(222, 50.69, 5.54, 4683, 'Vivegnis', 'Vivegnis', 'Vivegnis', 'Vivegnis', 'Vivegnis'),
(223, 50.69, 5.62, 4684, 'Haccourt', 'Haccourt', 'Haccourt', 'Haccourt', 'Haccourt'),
(224, 50.72, 5.65, 4690, 'Boirs', 'Boirs', 'Boirs', 'Boirs', 'Boirs'),
(225, 50.72, 5.68, 4690, 'Eben-Emael', 'Eben-Emael', 'Eben-Emael', 'Eben-Emael', 'Eben-Emael'),
(226, 5.41, 50.68, 4690, 'Roclenge-sur-Geer', 'Rukkelingen-aan-de-Jeker', 'Rukkelingen an der Jeker', 'Rukkeleng an der Jekesch', NULL),
(227, 5.73, 50.65, 4700, 'Eupen', 'Eupen', 'Eupen', 'Ieppen', NULL),
(228, 5.71, 50.70, 4701, 'Kettenis', 'Kettenis', 'Kettenis', 'Kettenes', NULL),
(229, 5.73, 50.62, 4710, 'Lontzen', 'Lontzen', 'Lontzen', 'Lontzen', NULL),
(230, 5.79, 50.66, 4720, 'La Calamine', 'Kelmis', 'Kelmis', 'Kolmesch', NULL),
(231, 5.77, 50.70, 4721, 'Neu-Moresnet', 'Neu-Moresnet', 'Neu-Moresnet', 'Nei-Moressnet', NULL),
(232, 5.81, 50.71, 4728, 'Hergenrath', 'Hergenrath', 'Hergenrath', 'Hergenrath', NULL),
(233, 5.78, 50.58, 4730, 'Hauset', 'Hauset', 'Hauset', 'Hauset', NULL),
(234, 5.91, 50.67, 4750, 'Butgenbach', 'Bütgenbach', 'Bütgenbach', 'Bëtgenbach', NULL),
(235, 5.90, 50.63, 4760, 'Bullange', 'Bullingen', 'Bullingen', 'Bëlljen', NULL),
(236, 5.79, 50.58, 4770, 'Amel', 'Amblève', 'Amel', 'Aemel', NULL),
(237, 5.86, 50.66, 4780, 'Saint-Vith', 'Sankt Vith', 'Sankt Vith', 'Sënt Väit', NULL),
(238, 5.82, 50.68, 4782, 'Schoenberg', 'Schönberg', 'Schönberg', 'Schénebierg', NULL),
(239, 5.84, 50.70, 4783, 'Lommersweiler', 'Lommersweiler', 'Lommersweiler', 'Lummeswellere', NULL),
(240, 5.85, 50.72, 4784, 'Saint-Jean-Sart', 'Sankt Johann', 'Sankt Johann', 'Sënt-Johann', NULL),
(241, 5.85, 50.65, 4790, 'Burg-Reuland', 'Burg-Reuland', 'Burg-Reuland', 'Burg-Reiland', NULL),
(242, 6.21, 50.67, 4800, 'Verviers', 'Verviers', 'Verviers', 'Verviers', 'Verviers'),
(243, 6.23, 50.64, 4801, 'Stembert', 'Stembert', 'Stembert', 'Stembert', 'Stembert'),
(244, 6.08, 50.62, 4802, 'Heusy', 'Heusy', 'Heusy', 'Heusy', 'Heusy'),
(245, 6.13, 50.61, 4820, 'Dison', 'Dison', 'Dison', 'Dison', 'Dison'),
(246, 6.07, 50.58, 4830, 'Limbourg', 'Limbourg', 'Limburg', 'Lëtzebuergesch', 'Limburg'),
(247, 6.03, 50.58, 4831, 'Bilstain', 'Bilstain', 'Bilstain', 'Bilstain', 'Bilstain'),
(248, 6.03, 50.61, 4834, 'Goé', 'Goé', 'Goé', 'Goé', 'Goé'),
(249, 6.03, 50.63, 4837, 'Baelen', 'Baelen', 'Baelen', 'Baelen', 'Baelen'),
(250, 5.94, 50.47, 4840, 'Welkenraedt', 'Welkenraedt', 'Welkenraedt', 'Welkenraat', 'Welkenraedt'),
(251, 5.91, 50.46, 4841, 'Henri-Chapelle', 'Henri-Chapelle', 'Henri-Chapelle', 'Henri-Chapelle', 'Henri-Chapelle'),
(252, 5.96, 50.43, 4845, 'Sart-lez-Spa', 'Sart-lez-Spa', 'Sart-lez-Spa', 'Sart-lez-Spa', 'Sart-lez-Spa'),
(253, 5.95, 50.58, 4850, 'Montzen', 'Montzen', 'Montzen', 'Montzen', 'Montzen'),
(254, 5.85, 50.62, 4851, 'Gemmenich', 'Gemmenich', 'Gemmenich', 'Gemmenich', 'Gemmenich'),
(255, 5.93, 50.63, 4852, 'Hombourg', 'Hombourg', 'Homburg', 'Houboereg', 'Hombourg'),
(256, 5.90, 50.64, 4860, 'Pepinster', 'Pepinster', 'Pepinster', 'Pepinster', 'Pepinster'),
(257, 5.62, 50.59, 4860, 'Pepinster', 'Pepinster', 'Pepinster', 'Pepinster', NULL),
(258, 5.73, 50.48, 4910, 'La Reid', 'La Reid', 'La Reid', 'La Reid', NULL),
(259, 5.79, 50.44, 4920, 'Aywaille', 'Aywaille', 'Aywaille', 'Aywaille', NULL),
(260, 5.60, 50.42, 4950, 'Waimes', 'Weismes', 'Weismes', 'Weismes', NULL),
(261, 4.91, 50.34, 5000, 'Namur', 'Namen', 'Namur', 'Namoer', 'Namur'),
(262, 5.37, 50.48, 5020, 'Malonne', 'Malonne', 'Malonne', 'Malonne', NULL),
(263, 4.86, 50.42, 5030, 'Gembloux', 'Gembloux', 'Gembloux', 'Gemlou', 'Gembloux'),
(264, 5.02, 50.45, 5060, 'Auvelais', 'Auvelais', 'Auvelais', 'Auvelais', NULL),
(265, 5.37, 50.35, 5100, 'Naninne', 'Naninne', 'Naninne', 'Naninne', NULL),
(266, 5.10, 50.46, 5170, 'Bois-de-Villers', 'Bois-de-Villers', 'Bois-de-Villers', 'Bois-de-Villers', NULL),
(267, 5.02, 50.56, 5300, 'Thon', 'Thon', 'Thon', 'Thon', NULL),
(268, 5.08, 50.55, 5310, 'Eghezee', 'Eghezee', 'Eghezee', 'Echiz', 'Eghezee'),
(269, 4.95, 50.59, 5330, 'Assesse', 'Assesse', 'Assesse', 'Assesse', NULL),
(270, 5.10, 50.63, 5350, 'Ohey', 'Ohey', 'Ohey', 'Ohey', NULL),
(271, 4.95, 50.41, 5500, 'Furnaux', 'Furnaux', 'Furnaux', 'Furnaux', NULL),
(272, 4.79, 50.43, 5530, 'Dorinne', 'Dorinne', 'Dorinne', 'Dorinne', NULL),
(273, 5.06, 50.40, 5590, 'Braibant', 'Braibant', 'Braibant', 'Braibant', NULL),
(274, 5.04, 50.37, 5620, 'Corenne-Croisette', 'Corenne-Croisette', 'Corenne-Croisette', 'Corenne-Croisette', NULL),
(275, 5.05, 50.41, 5670, 'Dourbes', NULL, NULL, NULL, NULL),
(276, 5.00, 50.33, 5680, 'Matagne-la-Grande', NULL, NULL, NULL, NULL),
(277, 4.94, 50.33, 5680, 'Matagne-la-Petite', NULL, NULL, NULL, NULL),
(278, 5.05, 50.25, 5680, 'Vaucelles', NULL, NULL, NULL, NULL),
(279, 5.26, 50.47, 5680, 'Niverlée', NULL, NULL, NULL, NULL),
(280, 4.45, 50.13, 5680, 'Doische', NULL, NULL, NULL, NULL),
(281, 4.48, 50.18, 5680, 'Gimnée', NULL, NULL, NULL, NULL),
(282, 4.56, 50.13, 5680, 'Gochenée', NULL, NULL, NULL, NULL),
(283, 4.56, 50.19, 5680, 'Soulme', NULL, NULL, NULL, NULL),
(284, 4.49, 50.15, 5680, 'Vodelée', NULL, NULL, NULL, NULL),
(285, 4.69, 50.26, 5680, 'Nafraiture', NULL, NULL, NULL, NULL),
(286, 4.61, 50.19, 5680, 'Romedenne', NULL, NULL, NULL, NULL),
(287, 5.17, 50.30, 5680, 'Falaën', NULL, NULL, NULL, NULL),
(288, 5.24, 50.24, 5680, 'Givet', NULL, NULL, NULL, NULL),
(289, 4.80, 50.25, 5700, 'Buzenol', NULL, NULL, NULL, NULL),
(290, 4.79, 50.28, 5700, 'Vance', NULL, NULL, NULL, NULL),
(291, 4.71, 50.27, 5700, 'Messancy', NULL, NULL, NULL, NULL),
(292, 4.71, 50.26, 5700, 'Wolkrange', NULL, NULL, NULL, NULL),
(293, 4.74, 50.26, 5700, 'Habay-la-Neuve', NULL, NULL, NULL, NULL),
(294, 4.75, 50.29, 5710, 'Sensenruth', NULL, NULL, NULL, NULL),
(295, 4.86, 50.30, 5710, 'Montauban', NULL, NULL, NULL, NULL),
(296, 4.88, 50.33, 5710, 'Pont-à-Celles', NULL, NULL, NULL, NULL),
(297, 4.80, 50.31, 5710, 'Sugny', NULL, NULL, NULL, NULL),
(298, 4.85, 50.32, 5710, 'Viville', NULL, NULL, NULL, NULL),
(299, 4.80, 50.34, 5711, 'Montigny-le-Tilleul', NULL, NULL, NULL, NULL),
(300, 4.89, 50.34, 5711, 'Thy-le-Château', NULL, NULL, NULL, NULL),
(301, 4.87, 50.35, 5711, 'Villers-Poterie', NULL, NULL, NULL, NULL),
(302, 4.82, 50.31, 5711, 'Villers-Deux-Eglises', NULL, NULL, NULL, NULL),
(303, 4.81, 50.33, 5711, 'Sart-Custinne', NULL, NULL, NULL, NULL),
(304, 4.88, 50.35, 5711, 'Villeret', NULL, NULL, NULL, NULL),
(305, 4.80, 50.35, 5711, 'Landelies', NULL, NULL, NULL, NULL),
(306, 4.81, 50.35, 5711, 'Mont-Sainte-Geneviève', NULL, NULL, NULL, NULL),
(307, 4.82, 50.35, 5711, 'Sambreville', NULL, NULL, NULL, NULL),
(308, 4.81, 50.35, 5711, 'Villerot', NULL, NULL, NULL, NULL),
(309, 5.33, 50.23, 5800, 'Villers-le-Temple', NULL, NULL, NULL, NULL),
(310, 5.37, 50.24, 5800, 'Acoz', NULL, NULL, NULL, NULL),
(311, 5.29, 50.31, 5800, 'Soye (Nam.)', NULL, NULL, NULL, NULL),
(312, 5.30, 50.29, 5800, 'Vezin', NULL, NULL, NULL, NULL),
(313, 5.27, 50.29, 5800, 'Fernelmont', NULL, NULL, NULL, NULL),
(314, 5.28, 50.30, 5800, 'Bothey', NULL, NULL, NULL, NULL),
(315, 5.22, 50.24, 5801, 'Hotton', NULL, NULL, NULL, NULL),
(316, 5.21, 50.23, 5802, 'Corroy-le-Château', NULL, NULL, NULL, NULL),
(317, 5.31, 50.19, 5820, 'Montignies-sur-Roc', NULL, NULL, NULL, NULL),
(318, 5.31, 50.17, 5820, 'Clairefontaine', NULL, NULL, NULL, NULL),
(319, 5.29, 50.18, 5820, 'Antheit', NULL, NULL, NULL, NULL),
(320, 5.23, 50.17, 5821, 'Leeuw-Saint-Pierre', NULL, NULL, NULL, NULL),
(321, 5.25, 50.19, 5822, 'Molenbaix', NULL, NULL, NULL, NULL),
(322, 5.16, 50.19, 5823, 'Gibecq', NULL, NULL, NULL, NULL),
(323, 5.14, 50.22, 5824, 'Maulde', NULL, NULL, NULL, NULL),
(324, 5.21, 50.18, 5830, 'Villers-la-Ville', NULL, NULL, NULL, NULL),
(325, 5.19, 50.17, 5831, 'Houtain-le-Val', NULL, NULL, NULL, NULL),
(326, 5.21, 50.15, 5832, 'Rixensart', NULL, NULL, NULL, NULL),
(327, 5.16, 50.16, 5840, 'Forchies-la-Marche', NULL, NULL, NULL, NULL),
(328, 5.14, 50.16, 5841, 'Hollain', NULL, NULL, NULL, NULL),
(329, 5.69, 50.47, 5900, 'Rongy', NULL, NULL, NULL, NULL),
(330, 5.73, 50.46, 5900, 'Luingne', NULL, NULL, NULL, NULL),
(331, 5.74, 50.46, 5900, 'Le Bizet', NULL, NULL, NULL, NULL),
(332, 4.44, 50.45, 6000, 'Charleroi', 'Charleroi', 'Charleroi', 'Schaarbeek', 'Charleroi'),
(333, 4.36, 50.41, 6040, 'Jumet', 'Jumet', 'Jumet', 'Jumet', 'Jumet'),
(334, 4.39, 50.41, 6041, 'Gosselies', 'Gosselies', 'Gosselies', 'Gosselies', 'Gosselies'),
(335, 4.42, 50.39, 6042, 'Lodelinsart', 'Lodelinsart', 'Lodelinsart', 'Lodelingsart', 'Lodelinsart'),
(336, 4.48, 50.46, 6060, 'Gilly', 'Gilly', 'Gilly', 'Gilly', 'Gilly'),
(337, 4.42, 50.42, 6061, 'Montignies-sur-Sambre', 'Montignies-sur-Sambre', 'Montignies-sur-Sambre', 'Montignies-sur-Sambre', 'Montignies-sur-Sambre'),
(338, 4.53, 50.48, 6110, 'Montigny-le-Tilleul', 'Montigny-le-Tilleul', 'Montigny-le-Tilleul', 'Montigny-le-Tilleul', 'Montigny-le-Tilleul'),
(339, 4.51, 50.45, 6111, 'Landelies', 'Landelies', 'Landelies', 'Landelies', 'Landelies'),
(340, 4.53, 50.44, 6120, 'Nalinnes', 'Nalinnes', 'Nalinnes', 'Nalinnes', 'Nalinnes'),
(341, 4.55, 50.43, 6140, 'Fontaine-l\'Évêque', 'Fontaine-l\'Évêque', 'Fontaine-l\'Évêque', 'Fontaine-l\'Évêque', 'Fontaine-l\'Évêque'),
(342, 4.46, 50.39, 6141, 'Forchies-la-Marche', 'Forchies-la-Marche', 'Forchies-la-Marche', 'Forchies-la-Marche', 'Forchies-la-Marche'),
(343, 4.47, 50.41, 6142, 'Leernes', 'Leernes', 'Leernes', 'Leernes', 'Leernes'),
(345, 50.41, 3.88, 6010, 'Couillet', 'Couillet', 'Couillet', 'Koleit', 'Couillet'),
(346, 4.44, 50.52, 6181, 'Courcelles', 'Courcelles', 'Kurzelles', 'Kuerzel', 'Courcelles'),
(347, 4.45, 50.53, 6182, 'Souvret', 'Souvret', 'Souvereit', 'Souvert', 'Souvret'),
(348, 4.46, 50.53, 6183, 'Trazegnies', 'Trazegnies', 'Trasignies', 'Trasingen', 'Trazegnies'),
(349, 4.59, 50.44, 6200, 'Châtelet', 'Châtelet', 'Châtelet', 'Schatelet', 'Chatelet'),
(350, 4.58, 50.43, 6200, 'Bouffioulx', 'Bouffioulx', 'Bouffioulx', 'Boefel', 'Bouffioulx'),
(351, 4.60, 50.46, 6200, 'Châtelineau', 'Châtelineau', 'Châtelineau', 'Schättenau', 'Chatelineau'),
(352, 4.58, 50.46, 6210, 'Frasnes-lez-Gosselies', 'Frasnes-lez-Gosselies', 'Frasnes-lez-Gosselies', 'Frasnes-bij-Charleroi', 'Frasnes-lez-Gosselies'),
(353, 4.57, 50.46, 6210, 'Les Bons Villers', 'Les Bons Villers', 'Les Bons Villers', 'De Goede Buren', 'Les Bons Villers'),
(354, 4.55, 50.44, 6210, 'Rèves', 'Rèves', 'Rêves', 'Reve', 'Rèves'),
(355, 4.59, 50.44, 6211, 'Mellet', 'Mellet', 'Mellet', 'Mellet', 'Mellet'),
(356, 4.59, 50.47, 6220, 'Fleurus', 'Fleurus', 'Fleurus', 'Fléiwer', 'Fleurus'),
(357, 4.60, 50.48, 6220, 'Wangenies', 'Wangenies', 'Wangenies', 'Waneche', 'Wangenies'),
(358, 4.62, 50.46, 6220, 'Heppignies', 'Heppignies', 'Heppignies', 'Heppenche', 'Heppignies'),
(359, 4.63, 50.47, 6221, 'Saint-Amand', 'Saint-Amand', 'Sint-Amands', 'Sankt Amand', 'Saint-Amand'),
(360, 4.55, 50.40, 6222, 'Brye', 'Brye', 'Brye', 'Brie', 'Brye'),
(361, 4.56, 50.42, 6223, 'Wagnelée', 'Wagnelée', 'Wagnelée', 'Wagnelée', 'Wagnelée'),
(362, 4.63, 50.45, 6224, 'Wanfercée-Baulet', 'Wanfercée-Baulet', 'Wanfercée-Baulet', 'Wanfercee-Baulet', 'Wanfercée-Baulet'),
(363, 4.64, 50.44, 6230, 'Obaix', 'Obaix', 'Obaix', 'Obaix', 'Obaix'),
(364, 5.40, 50.41, 6300, 'Wasseiges', 'Wasseiges', 'Wasseiges', 'Wasseiges', 'Wasseiges'),
(365, 5.42, 50.44, 6310, 'Anderlues', 'Anderlues', 'Anderlues', 'Anderlues', 'Anderlues'),
(366, 5.52, 50.44, 6320, 'Aubechies', 'Aubechies', 'Aubechies', 'Aubechies', 'Aubechies'),
(367, 5.54, 50.45, 6330, 'Boussu-en-Fagne', 'Boussu-en-Fagne', 'Boussu-en-Fagne', 'Boussu-en-Fagne', 'Boussu-en-Fagne'),
(368, 5.56, 50.47, 6340, 'Frasnes-lez-Gosselies', 'Frasnes-lez-Gosselies', 'Frasnes-lez-Gosselies', 'Frasnes-lez-Gosselies', 'Frasnes-lez-Gosselies'),
(369, 5.52, 50.48, 6350, 'Selvigny', 'Selvigny', 'Selvigny', 'Selvigny', 'Selvigny'),
(370, 5.50, 50.46, 6360, 'Forchies-la-Marche', 'Forchies-la-Marche', 'Forchies-la-Marche', 'Forchies-la-Marche', 'Forchies-la-Marche'),
(371, 5.31, 50.40, 6500, 'Leuze-en-Hainaut', 'Leuze-en-Hainaut', 'Leuze-en-Hainaut', 'Leuze-en-Hainaut', 'Leuze-en-Hainaut'),
(372, 5.47, 50.39, 6530, 'Thuin', 'Thuin', 'Thuin', 'Thuin', 'Thuin'),
(373, 5.53, 50.39, 6531, 'Biesme-sous-Thuin', 'Biesme-sous-Thuin', 'Biesme-sous-Thuin', 'Biesme-sous-Thuin', 'Biesme-sous-Thuin'),
(374, 5.37, 49.91, 6600, 'Bastogne', 'Bastenaken', 'Bastenaken', 'Bastogne', 'Bastogne'),
(375, 5.47, 50.15, 6630, 'Martelange', 'Martelingen', 'Martelingen', 'Martelange', 'Martelange'),
(376, 5.74, 50.11, 6637, 'Fauvillers', 'Fauvillers', 'Fauvillers', 'Fauvillers', 'Fauvillers'),
(377, 5.61, 50.13, 6640, 'Vaux-sur-Sûre', 'Vaux-sur-Sûre', 'Vaux-sur-Sûre', 'Vaux-sur-Sûre', 'Vaux-sur-Sûre'),
(378, 5.64, 50.18, 6642, 'Juseret', 'Juseret', 'Juseret', 'Juseret', 'Juseret'),
(379, 5.70, 50.11, 6660, 'Houffalize', 'Houffalize', 'Houffalize', 'Houffalize', 'Houffalize'),
(380, 5.73, 49.99, 6661, 'Mont', 'Mont', 'Mont', 'Mont', 'Mont'),
(381, 5.56, 50.04, 6663, 'Mabompré', 'Mabompré', 'Mabompré', 'Mabompré', 'Mabompré'),
(382, 5.83, 50.16, 6666, 'Wibrin', 'Wibrin', 'Wibrin', 'Wibrin', 'Wibrin'),
(383, 5.77, 50.13, 6670, 'Gouvy', 'Gouvy', 'Gouvy', 'Gouvy', 'Gouvy'),
(384, 5.77, 50.16, 6671, 'Bovigny', 'Bovigny', 'Bovigny', 'Bovigny', 'Bovigny'),
(385, 5.86, 50.18, 6672, 'Beho', 'Beho', 'Beho', 'Beho', 'Beho'),
(386, 5.83, 50.13, 6674, 'Montleban', 'Montleban', 'Montleban', 'Montleban', 'Montleban'),
(387, 5.76, 49.72, 6700, 'Arlon', 'Aarlen', 'Arel', 'Arlon', 'Arlon'),
(388, 5.80, 49.67, 6717, 'Attert', 'Attert', 'Attert', 'Attert', 'Attert'),
(389, 5.63, 49.93, 6720, 'Habay', 'Habay', 'Habay', 'Habich', 'Habay'),
(390, 5.71, 49.68, 6723, 'Habay-la-Neuve', 'Nieuw Habay', 'Neuhäusel', 'Habich-Neuve', 'Habay-la-Neuve'),
(391, 5.75, 49.64, 6724, 'Houdemont', 'Houdemont', 'Houdemont', 'Houdemont', 'Houdemont'),
(392, 5.78, 49.65, 6724, 'Rulles', 'Rulles', 'Rulles', 'Rulles', 'Rulles'),
(393, 5.63, 49.79, 6724, 'Vlessart', 'Vlessart', 'Vlessart', 'Vlessart', 'Vlessart'),
(394, 5.63, 49.69, 6740, 'Etalle', 'Etalle', 'Etalle', 'Etel', 'Etalle'),
(395, 5.64, 49.71, 6740, 'Sainte-Marie-sur-Semois', 'Sint-Maria-Semois', 'Sankt Maria an der Semoy', 'Sankt Maria an der Semois', 'Sainte-Marie-sur-Semois'),
(396, 5.66, 49.70, 6741, 'Vance', 'Vance', 'Vance', 'Vance', 'Vance'),
(397, 5.69, 49.77, 6742, 'Chantemelle', 'Chantemelle', 'Kanthemel', 'Chantemelle', 'Chantemelle'),
(398, 5.72, 49.80, 6743, 'Buzenol', 'Buzenol', 'Buzenol', 'Buzenol', 'Buzenol'),
(399, 5.73, 49.82, 6747, 'Châtillon', 'Chatillon', 'Châtillon', 'Chatillon', 'Châtillon'),
(400, 5.80, 49.59, 6750, 'Musson', 'Musson', 'Musson', 'Musson', 'Musson'),
(401, 5.74, 49.54, 6760, 'Bleid', 'Bleid', 'Bleid', 'Bleid', 'Bleid'),
(402, 5.76, 49.55, 6760, 'Ethe', 'Ethe', 'Ethe', 'Ethe', 'Ethe'),
(403, 5.59, 49.86, 6800, 'Libramont-Chevigny', 'Libramont-Chevigny', 'Léiberech', 'Libramont-Chevigny', 'Libramont-Chevigny'),
(404, 5.55, 49.88, 6810, 'Chiny', 'Chiny', 'Scheni', 'Chiny', 'Chiny'),
(405, 5.54, 49.74, 6811, 'Les Bulles', 'Les Bulles', 'De Bull', 'Les Bulles', 'Les Bulles'),
(406, 5.40, 49.72, 6820, 'Florenville', 'Florenville', 'Flourenville', 'Flourenville', 'Florenville'),
(407, 5.40, 49.69, 6821, 'Lacuisine', 'Lacuisine', 'Lakischinn', 'Lacuisine', 'Lacuisine'),
(408, 5.36, 49.68, 6830, 'Bouillon', 'Bouillon', 'Bullong', 'Bouillon', 'Bouillon'),
(409, 5.39, 49.61, 6831, 'Noirefontaine', 'Noirefontaine', 'Schwaarzenhaaf', 'Noirefontaine', 'Noirefontaine'),
(410, 5.32, 49.77, 6832, 'Sensenruth', 'Sensenruth', 'Sensenruth', 'Sensenruth', 'Sensenruth'),
(411, 5.31, 49.70, 6833, 'Ucimont', 'Ucimont', 'Uschemont', 'Utschent', 'Ucimont'),
(412, 5.32, 49.66, 6834, 'Bellevaux', 'Bellevaux', 'Bellefau', 'Bellefau', 'Bellevaux'),
(413, 50.20, 5.81, 6900, 'Marche-en-Famenne', 'Marche-en-Famenne', 'Marche-en-Famenne', 'Mäertchen', 'Marche-en-Famenne'),
(414, 50.20, 5.82, 6900, 'On', 'On', 'On', 'Oun', 'On'),
(415, 50.21, 5.79, 6900, 'Waha', 'Waha', 'Waha', 'Wolz', 'Waha'),
(416, 50.27, 5.62, 6920, 'Sohier', 'Sohier', 'Sohier', 'Sohier', 'Sohier'),
(417, 50.20, 5.56, 6921, 'Chanly', 'Chanly', 'Chanly', 'Schanle', 'Chanly'),
(418, 50.22, 5.67, 6922, 'Haut-Fays', 'Haut-Fays', 'Haut-Fays', 'Héicht-Faas', 'Haut-Fays'),
(419, 50.25, 5.63, 6924, 'Lomprez', 'Lomprez', 'Lomprez', 'Lomprez', 'Lomprez'),
(420, 50.22, 5.70, 6927, 'Bure', 'Bure', 'Bure', 'Bier', 'Bure'),
(421, 50.22, 5.73, 6927, 'Grupont', 'Grupont', 'Grupont', 'Gréipend', 'Grupont'),
(422, 50.22, 5.67, 6927, 'Resteigne', 'Resteigne', 'Resteigne', 'Reschteng', 'Resteigne'),
(423, 50.21, 5.68, 6927, 'Tellin', 'Tellin', 'Tellin', 'Telle(n)', 'Tellin'),
(424, 50.18, 5.70, 6929, 'Gembes', 'Gembes', 'Gembes', 'Gempen', 'Gembes'),
(425, 50.12, 5.37, 6940, 'Barvaux-sur-Ourthe', 'Barvaux-sur-Ourthe', 'Barvaux-sur-Ourthe', 'Bierveau-Zur-Our', 'Barvaux-sur-Ourthe'),
(426, 50.26, 5.57, 6941, 'Bomal-sur-Ourthe', 'Bomal-sur-Ourthe', 'Bomal-sur-Ourthe', 'Boemel', 'Bomal-sur-Ourthe'),
(427, 50.13, 5.42, 6941, 'Bonsin', 'Bonsin', 'Bonsin', 'Bonsin', 'Bonsin'),
(428, 50.11, 5.46, 6941, 'Heyd', 'Heyd', 'Heyd', 'Hei', 'Heyd'),
(429, 4.42, 50.46, 7000, 'Mons', 'Bergen', 'Mons', 'Mons', 'Mons'),
(430, 4.31, 50.42, 7011, 'Ghlin', 'Ghlin', 'Ghlin', 'Ghlin', 'Ghlin'),
(431, 4.26, 50.46, 7012, 'Flénu', 'Flénu', 'Flénu', 'Flénu', 'Flénu'),
(432, 4.22, 50.43, 7020, 'Maisières', 'Maisières', 'Maisières', 'Maisières', 'Maisières'),
(433, 4.05, 50.46, 7021, 'Havré', 'Havré', 'Havré', 'Havré', 'Havré'),
(434, 3.99, 50.45, 7022, 'Harveng', 'Harveng', 'Harveng', 'Harveng', 'Harveng'),
(435, 3.95, 50.46, 7024, 'Ciply', 'Ciply', 'Ciply', 'Ciply', 'Ciply'),
(436, 3.96, 50.49, 7030, 'Saint-Symphorien', 'Saint-Symphorien', 'Saint-Symphorien', 'Saint-Symphorien', 'Saint-Symphorien'),
(437, 4.06, 50.43, 7031, 'Villers-Saint-Ghislain', 'Villers-Saint-Ghislain', 'Villers-Saint-Ghislain', 'Villers-Saint-Ghislain', 'Villers-Saint-Ghislain'),
(438, 4.03, 50.41, 7032, 'Spiennes', 'Spiennes', 'Spiennes', 'Spiennes', 'Spiennes'),
(439, 4.06, 50.46, 7033, 'Cuesmes', 'Cuesmes', 'Cuesmes', 'Cuesmes', 'Cuesmes'),
(440, 3.97, 50.41, 7034, 'Obourg', 'Obourg', 'Obourg', 'Obourg', 'Obourg'),
(441, 3.99, 50.43, 7040, 'Quévy-le-Grand', 'Quévy-le-Grand', 'Quévy-le-Grand', 'Quévy-le-Grand', 'Quévy-le-Grand'),
(442, 3.94, 50.40, 7041, 'Givry', 'Givry', 'Givry', 'Givry', 'Givry'),
(443, 3.99, 50.41, 7042, 'Quévy', 'Quévy', 'Quévy', 'Quévy', 'Quévy'),
(444, 4.13, 50.44, 7100, 'La Louvière', 'La Louvière', 'La Louvière', 'La Louvière', 'La Louvière'),
(445, 4.11, 50.44, 7100, 'Trivières', 'Trivières', 'Trivières', 'Trivières', 'Trivières'),
(446, 4.12, 50.42, 7100, 'Saint-Vaast', 'Saint-Vaast', 'Saint-Vaast', 'Saint-Vaast', 'Saint-Vaast'),
(447, 4.10, 50.45, 7100, 'Haine-Saint-Paul', 'Haine-Saint-Paul', 'Haine-Saint-Paul', 'Haine-Saint-Paul', 'Haine-Saint-Paul'),
(448, 4.14, 50.45, 7100, 'Haine-Saint-Pierre', 'Haine-Saint-Pierre', 'Haine-Saint-Pierre', 'Haine-Saint-Pierre', 'Haine-Saint-Pierre'),
(449, 4.13, 50.45, 7100, 'Strépy-Bracquegnies', 'Strépy-Bracquegnies', 'Strépy-Bracquegnies', 'Strépy-Bracquegnies', 'Strépy-Bracquegnies'),
(450, 4.28, 50.42, 7110, 'Houdeng-Aimeries', 'Houdeng-Aimeries', 'Houdeng-Aimeries', 'Houdeng-Aimeries', 'Houdeng-Aimeries'),
(451, 4.29, 50.41, 7120, 'Estinnes', 'Estinnes', 'Estinnes', 'Estinnes', 'Estinnes'),
(452, 4.26, 50.44, 7130, 'Binche', 'Binche', 'Binche', 'Binche', 'Binche'),
(453, 4.21, 50.45, 7140, 'Morlanwelz', 'Morlanwelz', 'Morlanwelz', 'Morlanwelz', 'Morlanwelz'),
(454, 4.24, 50.38, 7170, 'Manage', 'Manage', 'Manage', 'Manage', 'Manage'),
(455, 4.27, 50.39, 7180, 'Seneffe', 'Seneffe', 'Seneffe', 'Seneffe', 'Seneffe'),
(456, 4.22, 50.47, 7190, 'Ecaussinnes', 'Ecaussinnes', 'Ecaussinnes', 'Ecaussinnes', 'Ecaussinnes'),
(457, 4.26, 50.45, 7200, 'Pommeroeul', 'Pommeroeul', 'Pommeroeul', 'Pommeroeul', 'Pommeroeul'),
(458, 4.26, 50.44, 7201, 'Havré', 'Havré', 'Havré', 'Havré', 'Havré'),
(459, 4.23, 50.46, 7300, 'Boussu', 'Boussu', 'Boussu', 'Boussu', 'Boussu'),
(460, 4.15, 50.47, 7330, 'Saint-Ghislain', 'Saint-Ghislain', 'Saint-Ghislain', 'Saint-Ghislain', 'Saint-Ghislain'),
(461, 4.04, 50.47, 7340, 'Colfontaine', 'Colfontaine', 'Colfontaine', 'Colfontaine', 'Colfontaine'),
(462, 3.92, 50.44, 7350, 'Hainin', 'Hainin', 'Hainin', 'Hainin', 'Hainin'),
(463, 4.04, 50.39, 7370, 'Dour', 'Dour', 'Dour', 'Dour', 'Dour'),
(464, 4.06, 50.41, 7380, 'Quiévrain', 'Quiévrain', 'Quiévrain', 'Quiévrain', 'Quiévrain'),
(465, 4.02, 50.39, 7390, 'Quaregnon', 'Quaregnon', 'Quaregnon', 'Quaregnon', 'Quaregnon'),
(466, 4.27, 50.50, 7500, 'Tournai', 'Doornik', 'Tournai', 'Tournai', 'Tournai'),
(467, 4.27, 50.48, 7520, 'Ramegnies-Chin', 'Ramegnies-Chin', 'Ramegnies-Chin', 'Ramegnies-Chin', 'Ramegnies-Chin'),
(468, 4.31, 50.48, 7530, 'Gaurain-Ramecroix', 'Gaurain-Ramecroix', 'Gaurain-Ramecroix', 'Gaurain-Ramecroix', 'Gaurain-Ramecroix'),
(469, 4.30, 50.52, 7540, 'Kain', 'Kain', 'Kain', 'Kain', 'Kain'),
(470, 4.17, 50.51, 7542, 'Mont-Saint-Aubert', 'Mont-Saint-Aubert', 'Mont-Saint-Aubert', 'Mont-Saint-Aubert', 'Mont-Saint-Aubert'),
(471, 3.51, 50.69, 7600, 'Péruwelz', 'Péruwelz', 'Péruwelz', 'Péruwelz', 'Péruwelz'),
(472, 3.51, 50.68, 7610, 'Rumes', 'Rumes', 'Rumes', 'Rumes', 'Rumes'),
(473, 3.41, 50.71, 7620, 'Bléharies', 'Bléharies', 'Bléharies', 'Bléharies', 'Bléharies'),
(474, 3.47, 50.64, 7640, 'Antoing', 'Antoing', 'Antoing', 'Antoing', 'Antoing'),
(475, 3.45, 50.65, 7642, 'Calonne', 'Calonne', 'Calonne', 'Calonne', 'Calonne'),
(476, 3.43, 50.68, 7643, 'Fontenoy', 'Fontenoy', 'Fontenoy', 'Fontenoy', 'Fontenoy'),
(477, 3.56, 50.73, 7700, 'Mouscron', 'Moescroen', 'Mouscron', 'Mouscron', 'Mouscron'),
(478, 3.60, 50.74, 7711, 'Dottignies', 'Dottenijs', 'Dottignies', 'Dottignies', 'Dottignies'),
(479, 3.23, 50.71, 7730, 'Estaimpuis', 'Estaimpuis', 'Estaimpuis', 'Estaimpuis', 'Estaimpuis'),
(480, 3.27, 50.71, 7731, 'Herseaux', 'Herseaux', 'Herseaux', 'Herseaux', 'Herseaux'),
(481, 3.26, 50.71, 7740, 'Pecq', 'Pecq', 'Pecq', 'Pecq', 'Pecq'),
(482, 3.34, 50.58, 7742, 'Villers-Saint-Amand', 'Villers-Saint-Amand', 'Villers-Saint-Amand', 'Villers-Saint-Amand', 'Villers-Saint-Amand'),
(483, 3.23, 51.19, 8000, 'Bruges', 'Brugge', 'Brügge', 'Brugge', 'Bruges'),
(484, 3.25, 51.18, 8020, 'Hertsberge', 'Hertsberge', 'Hertsberge', 'Hertsberge', 'Hertsberge'),
(485, 3.27, 51.20, 8200, 'Sint-Andries', 'Sint-Andries', 'Sint-Andries', 'Sint-Andries', 'Sint-Andries'),
(486, 3.26, 51.21, 8210, 'Zedelgem', 'Zedelgem', 'Zedelgem', 'Zedelgem', 'Zedelgem'),
(487, 3.17, 51.25, 8300, 'Knokke-Heist', 'Knokke-Heist', 'Knokke-Heist', 'Knokke-Heist', 'Knokke-Heist'),
(488, 3.22, 51.27, 8310, 'Sint-Kruis', 'Sint-Kruis', 'Sint-Kruis', 'Sint-Kruis', 'Sint-Kruis'),
(489, 3.31, 51.27, 8340, 'Sijsele', 'Sijsele', 'Sijsele', 'Sijsele', 'Sijsele'),
(490, 3.39, 51.22, 8370, 'Uitkerke', 'Uitkerke', 'Uitkerke', 'Uitkerke', 'Uitkerke'),
(491, 3.12, 51.21, 8380, 'Dudzele', 'Dudzele', 'Dudzele', 'Dudzele', 'Dudzele'),
(492, 3.14, 51.22, 8390, 'Blankenberge', 'Blankenberge', 'Blankenberge', 'Blankenberge', 'Blankenberge'),
(493, 3.14, 51.15, 8400, 'Oostende', 'Oostende', 'Ostende', 'Oostende', 'Ostend'),
(494, 3.16, 51.20, 8420, 'Wenduine', 'Wenduine', 'Wenduine', 'Wenduine', 'Wenduine'),
(495, 3.09, 51.20, 8421, 'De Haan', 'De Haan', 'De Haan', 'De Haan', 'De Haan'),
(496, 3.01, 51.20, 8430, 'Middelkerke', 'Middelkerke', 'Middelkerke', 'Middelkerke', 'Middelkerke'),
(497, 3.74, 51.06, 9000, 'Gand', 'Gent', 'Gent', 'Gand', 'Ghent'),
(498, 3.73, 51.06, 9030, 'Mariakerke (Gand)', 'Mariakerke (Gent)', 'Mariakerke (Gent)', 'Mariakerke (Gand)', 'Mariakerke (Ghent)'),
(499, 3.73, 51.02, 9040, 'Sint-Amandsberg (Gand)', 'Sint-Amandsberg (Gent)', 'Sint-Amandsberg (Gent)', 'Sint-Amandsberg (Gand)', 'Sint-Amandsberg (Ghent)'),
(500, 3.70, 51.03, 9050, 'Ledeberg (Gand)', 'Ledeberg (Gent)', 'Ledeberg (Gent)', 'Ledeberg (Gand)', 'Ledeberg (Ghent)'),
(501, 3.68, 51.07, 9100, 'Sint-Niklaas-Waas', 'Sint-Niklaas-Waas', 'Sint-Niklaas-Waas', 'Sint-Niklaas-Waas', 'Sint-Niklaas-Waas'),
(502, 4.10, 51.05, 9110, 'Sint-Niklaas', 'Sint-Niklaas', 'Sint-Niklaas', 'Sint-Niklaas', 'Sint-Niklaas'),
(503, 3.72, 51.06, 9120, 'Beveren-Waas', 'Beveren-Waas', 'Beveren-Waas', 'Beveren-Waas', 'Beveren-Waas'),
(504, 4.25, 51.15, 9130, 'Kallo', 'Kallo', 'Kallo', 'Kallo', 'Kallo'),
(505, 4.12, 51.22, 9140, 'Temse', 'Temse', 'Temse', 'Temse', 'Temse'),
(506, 4.18, 51.22, 9150, 'Kruibeke', 'Kruibeke', 'Kruibeke', 'Kruibeke', 'Kruibeke'),
(507, 4.24, 51.22, 9160, 'Lokeren', 'Lokeren', 'Lokeren', 'Lokeren', 'Lokeren'),
(508, 3.98, 51.15, 9170, 'Sint-Gillis-Waas', 'Sint-Gillis-Waas', 'Sint-Gillis-Waas', 'Sint-Gillis-Waas', 'Sint-Gillis-Waas'),
(509, 3.98, 51.17, 9180, 'Moerbeke-Waas', 'Moerbeke-Waas', 'Moerbeke-Waas', 'Moerbeke-Waas', 'Moerbeke-Waas'),
(510, 3.76, 51.05, 9190, 'Stekene', 'Stekene', 'Stekene', 'Stekene', 'Stekene');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_06_29_121126_create_locations_table', 1),
(2, '2013_07_29_121141_create_countries_table', 1),
(3, '2013_08_29_121235_create_categories_table', 1),
(4, '2013_09_12_000000_create_users_table', 1),
(5, '2013_11_29_121219_create_follower_following_table', 1),
(6, '2013_12_29_121253_create_user_category_table', 1),
(7, '2014_01_29_121308_create_activities_table', 1),
(8, '2014_02_29_121323_create_participant_activity_table', 1),
(9, '2014_03_29_121332_create_photos_table', 1),
(10, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(11, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(12, '2019_08_19_000000_create_failed_jobs_table', 1),
(13, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(14, '2023_03_28_082131_create_sessions_table', 1),
(15, '2023_04_29_104700_add_remember_token_to_users', 1);

-- --------------------------------------------------------

--
-- Table structure for table `participant_activity`
--

CREATE TABLE `participant_activity` (
  `participant_id` bigint(20) UNSIGNED NOT NULL,
  `activity_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `activity_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `name`, `activity_id`) VALUES
(1, 'acti_cheval_1.jpeg', 1),
(2, 'acti_cheval_1b.jpeg', 1),
(3, 'acti_cheval_1c.jpeg', 1),
(4, 'acti_sheldon_2.jpg', 2),
(5, 'acti_goku_3.jpg', 3),
(6, 'acti_goku_3b.jpg', 3),
(7, 'acti_raj_4.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `rater_id` bigint(20) UNSIGNED NOT NULL,
  `ratee_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `long_description` longtext NOT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `profile_photo_path`, `birthdate`, `short_description`, `long_description`, `location_id`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 'DrCooper', 'sheldon.cooper@gmail.com', NULL, 'mot_de_passe1', NULL, NULL, NULL, NULL, 'photos/dr_cooper.jpg', '1980-02-26', 'Physicien théoricien', 'Bonjour, je suis Sheldon Cooper, physicien théoricien et fan de trains. J\'enseigne la physique à l\'Université de Caltech et j\'adore jouer à des jeux de société avec mes amis.', 29, 31, NULL, NULL),
(2, 'AmyFF', 'amy.farrah.fowler@hotmail.com', NULL, 'mot_de_passe2', NULL, NULL, NULL, NULL, 'photos/amy_ff.jpg', '1979-11-17', 'Neurobiologiste', 'Bonjour, je suis Amy Farrah Fowler, neurobiologiste et grande fan de Star Trek. J\'ai étudié à Harvard et je suis actuellement chercheuse à l\'Université de Caltech. J\'adore passer du temps avec Sheldon et mes autres amis scientifiques.', 29, 31, NULL, NULL),
(3, 'Howie_Rock', 'howie_rock@example.com', NULL, 'password123', NULL, NULL, NULL, NULL, '/images/howard.jpg', '1981-03-04', 'Je suis un astronaute ingénieur et je suis marié à la belle Bernadette. J\'aime la science-fiction, les jeux vidéo et jouer de la guitare.', 'Salut, je m\'appelle Howard Wolowitz. J\'ai un doctorat en ingénierie aérospatiale et j\'ai travaillé sur la Station spatiale internationale. J\'ai rencontré Bernadette au restaurant Cheesecake Factory et on s\'est marié depuis. On a deux enfants et j\'aime passer du temps avec eux. Ah oui, j\'aime aussi les ceintures spéciales.', 33, 31, NULL, NULL),
(4, 'BernaSansDette', 'berna_sans_dette@example.com', NULL, 'password456', NULL, NULL, NULL, NULL, '/images/bernadette.jpg', '1984-02-10', 'Je suis une mère et une scientifique. J\'ai une carrière très réussie et j\'ai épousé Howard. J\'aime cuisiner, le shopping et les chats.', 'Salut, je m\'appelle Bernadette Rostenkowski-Wolowitz. J\'ai un doctorat en microbiologie et je travaille pour une grande entreprise pharmaceutique. J\'ai rencontré Howard lors d\'un blind date organisé par Penny et nous nous sommes mariés peu de temps après. Nous avons deux enfants et nous aimons passer du temps en famille. J\'aime aussi cuisiner, faire du shopping et prendre soin de nos chats.', 33, 31, NULL, NULL),
(5, 'Leonard_le_Grand', 'leonard.legrand@example.com', NULL, '$2y$10$hfEoPImUq5i4Lm1W7lwCHezbgZc/TW02qB1cIi6NtxrqBQdmq8J46', NULL, NULL, NULL, NULL, 'images/profiles/leonard.jpg', '1980-05-17', 'Je suis Léonard, marié à Penny et papa d\'un petit garçon. Je travaille comme physicien et j\'adore jouer à des jeux de société avec mes amis.', 'Bonjour, je suis Léonard Hofstadter. Je suis marié à ma belle Penny et nous avons un fils ensemble. Je suis passionné par la physique et je travaille comme physicien expérimental à l\'université de Caltech. Quand je ne suis pas en train de travailler, j\'aime jouer à des jeux de société avec mes amis Sheldon, Howard et Raj. J\'ai également une fascination pour la culture geek et je suis fan de Star Trek et de Star Wars.', 79, 31, NULL, NULL),
(6, 'Penny_sans_Souci', 'penny.sanssouci@example.com', NULL, '$2y$10$QzJe/JtD9j5jJQaNYk2RJuIvjy2cZMXegymUE9N.H6u24iQff6nx6', NULL, NULL, NULL, NULL, 'images/profiles/penny.jpg', '1985-12-02', 'Bonjour, je suis Penny, l\'épouse de Léonard et la maman de notre fils. J\'adore chanter et danser.', 'Bonjour, je suis Penny. Je suis l\'épouse de Léonard et la mère de notre fils. J\'aime chanter et danser, et j\'ai travaillé pendant de nombreuses années comme serveuse au Cheesecake Factory. J\'aime également passer du temps avec mes amis et regarder des séries télévisées. Depuis que je suis mariée à Léonard, j\'ai également découvert la culture geek et je suis devenue une fan de Star Wars et de la bande dessinée. Je suis heureuse de faire partie de la famille des geeks !', 79, 31, NULL, NULL),
(7, 'Raj_the_Lover', 'raj.lover@example.com', NULL, 'MonSuperPassword!123', NULL, NULL, NULL, NULL, '/profiles/raj.jpg', '1986-10-06', 'Astrophysicien professionnel et grand romantique', 'Je suis un grand amoureux de la vie et de la science. Je passe mon temps libre à observer les étoiles et à chercher l\'amour. J\'aimerais rencontrer une femme avec qui partager ma passion pour la vie et les mystères de l\'univers.', 17, 31, NULL, NULL),
(8, 'Goku_Z', 'goku.z@example.com', NULL, '$2y$10$DQcW.kVdvnN5vXHLLSDS/uH81R4uP0cSH6I0Gft6ypd/3lZrXdLRW', NULL, NULL, NULL, NULL, '/photos/goku_z.jpg', '1984-04-16', 'Saiyan', 'Le plus grand guerrier de tous les temps !', 370, 31, NULL, NULL),
(9, 'Total_Chichi', 'total.chichi@example.com', NULL, '$2y$10$8RHQrqKXEH7wqV4SClJQdeyyi9dAP9TtQVv.EyybL2kQqBdLjJI/q', NULL, NULL, NULL, NULL, '/photos/total_chichi.jpg', '1986-05-14', 'Maman poule', 'Je suis la femme la plus chanceuse d\'avoir un mari comme Goku et deux enfants adorables, Gohan et Goten.', 370, 31, NULL, NULL),
(10, 'Savant_Gohan', 'savant.gohan@example.com', NULL, '$2y$10$szRQUpPCJ3EoYJ7tzmI9vugTHJYPV6VHhuln7YfvQ6/oFXv2pk.KG', NULL, NULL, NULL, NULL, '/photos/savant_gohan.jpg', '1995-05-18', 'Saiyan', 'Je suis Gohan, le fils aîné de Goku et Chichi. Je suis un savant, mais j\'ai aussi hérité de la force de mon père.', 370, 31, NULL, NULL),
(11, 'Goten_Z', 'goten.z@example.com', NULL, '$2y$10$yv3L2wogLrKWb/h6XWJ0ZulG3tf5nKrdDyAJEjX3.Bgn/XdHszEO2', NULL, NULL, NULL, NULL, '/photos/goten_z.jpg', '2000-03-12', 'Saiyan', 'Je suis Goten, le fils cadet de Goku et Chichi. Mon frère Gohan est un génie, mais je suis un guerrier en herbe qui apprend de mon père.', 370, 31, NULL, NULL),
(12, 'Kame_Sennin', 'kame_sennin@example.com', NULL, 'S3cur3Pwd!', NULL, NULL, NULL, NULL, '/photos/kame_sennin.jpg', '1945-01-01', 'Maitre des arts martiaux', 'Je suis le célèbre Kame Sennin, un maître des arts martiaux et un collectionneur de magazines coquins.', 495, 31, NULL, NULL),
(13, 'Krilin_Z', 'krilin_z@example.com', NULL, 'P@ssw0rd!', NULL, NULL, NULL, NULL, '/photos/krilin.jpg', '1974-12-17', 'Guerrier Z', 'Je suis Krilin, un ancien moine Shaolin et un membre de l\'équipe des guerriers Z.', 405, 31, NULL, NULL),
(14, 'C18', 'c18@example.com', NULL, 'G0ld3nPwd!', NULL, NULL, NULL, NULL, '/photos/c18.jpg', '1988-02-14', 'Androïde', 'Je suis C-18, une ancienne criminelle qui a été transformée en cyborg par le Dr Gero.', 405, 31, NULL, NULL),
(15, 'Yamyam', 'yamyam@example.com', NULL, 'C0mpl3xPwd!', NULL, NULL, NULL, NULL, '/photos/yamcha.jpg', '1980-03-20', 'Bandit', 'Je suis Yamcha, un ancien bandit du désert qui a rejoint l\'équipe de Goku et est devenu un guerrier Z.', 99, 31, NULL, NULL),
(16, 'Piccolo', 'piccolo@mail.com', NULL, 'PiccoloPass123!', NULL, NULL, NULL, NULL, 'piccolo.jpg', '1970-05-09', 'Warrior from Namek', 'I am the protector of Earth. I will use my powers to defeat all the evil forces that threaten the planet.', 232, 31, NULL, NULL),
(17, 'Prince_Sayen', 'vegeta@mail.com', NULL, 'VegetaPass123!', NULL, NULL, NULL, NULL, 'vegeta.jpg', '1975-01-27', 'Prince of the Saiyans', 'I am Vegeta, the prince of all Saiyans. I am determined to surpass Kakarot and become the strongest warrior in the universe.', 79, 31, NULL, NULL),
(18, 'Genius_Bulma', 'bulma@mail.com', NULL, 'BulmaPass123!', NULL, NULL, NULL, NULL, 'bulma.jpg', '1980-08-18', 'Scientist and inventor', 'Hi, I am Bulma. I am a genius inventor and scientist. I have created many useful machines, including the Dragon Radar that helped us find the Dragon Balls.', 79, 31, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_category`
--

CREATE TABLE `user_category` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_category`
--

INSERT INTO `user_category` (`user_id`, `category_id`) VALUES
(1, 6),
(1, 7),
(1, 8),
(2, 5),
(2, 6),
(2, 7),
(2, 10),
(3, 3),
(3, 8),
(3, 9),
(3, 10),
(4, 6),
(4, 7),
(4, 10),
(5, 6),
(5, 7),
(5, 8),
(6, 1),
(6, 5),
(6, 9),
(6, 10),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(2, 11),
(8, 1),
(8, 2),
(8, 9),
(8, 10),
(8, 12),
(9, 10),
(10, 1),
(10, 6),
(10, 7),
(11, 2),
(11, 5),
(11, 9),
(11, 12),
(12, 9),
(12, 10),
(12, 12),
(13, 1),
(13, 9),
(13, 10),
(14, 9),
(14, 2),
(14, 4),
(14, 10),
(15, 2),
(15, 3),
(15, 4),
(15, 9),
(16, 12),
(17, 12),
(18, 3),
(18, 8),
(18, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_orga_id_foreign` (`orga_id`),
  ADD KEY `activities_location_id_foreign` (`location_id`),
  ADD KEY `activities_category_id_foreign` (`category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`iso_code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `follower_following`
--
ALTER TABLE `follower_following`
  ADD KEY `follower_following_follower_id_foreign` (`follower_id`),
  ADD KEY `follower_following_following_id_foreign` (`following_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant_activity`
--
ALTER TABLE `participant_activity`
  ADD KEY `participant_activity_participant_id_foreign` (`participant_id`),
  ADD KEY `participant_activity_activity_id_foreign` (`activity_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_activity_id_foreign` (`activity_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rater_id` (`rater_id`),
  ADD KEY `ratee_id` (`ratee_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_location_id_foreign` (`location_id`),
  ADD KEY `users_country_id_foreign` (`country_id`);

--
-- Indexes for table `user_category`
--
ALTER TABLE `user_category`
  ADD KEY `user_category_user_id_foreign` (`user_id`),
  ADD KEY `user_category_category_id_foreign` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `activities_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `activities_orga_id_foreign` FOREIGN KEY (`orga_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follower_following`
--
ALTER TABLE `follower_following`
  ADD CONSTRAINT `follower_following_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `follower_following_following_id_foreign` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participant_activity`
--
ALTER TABLE `participant_activity`
  ADD CONSTRAINT `participant_activity_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participant_activity_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`rater_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`ratee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`iso_code`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `users_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `user_category`
--
ALTER TABLE `user_category`
  ADD CONSTRAINT `user_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_category_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
