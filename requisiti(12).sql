-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 19, 2016 at 12:00 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `requisiti`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `id_actor` int(11) NOT NULL,
  `description` text NOT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`id_actor`, `description`, `parent`) VALUES
(3, 'Utente', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `argument`
--

CREATE TABLE `argument` (
  `id_argument` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `type` varchar(128) NOT NULL,
  `direction` enum('in','out') NOT NULL DEFAULT 'in',
  `id_method` int(11) NOT NULL,
  `description` text NOT NULL,
  `order` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `argument`
--

INSERT INTO `argument` (`id_argument`, `name`, `type`, `direction`, `id_method`, `description`, `order`) VALUES
(1, 'filename', 'String', 'in', 2, 'Name of the file', 0),
(2, 'columns', 'list', 'in', 2, 'List of columns to put in the dataset', 0),
(3, 'labels', 'tuple', 'in', 2, 'Tuple of two file names, the first contains data and the second the labels', 0),
(4, 'filename', 'String', 'in', 3, 'Name of the file', 0),
(5, 'columns', 'list', 'in', 3, 'List of columns to put in the dataset', 0),
(6, 'filename', 'String', 'in', 5, 'Name of the file', 0),
(7, 'columns', 'list', 'in', 5, 'List of columns to put in the dataset', 0),
(8, 'filename', 'String', 'in', 4, 'Name of the file', 0),
(9, 'accuracy_score', 'list', 'in', 8, 'List of accuracy scores', 0),
(10, 'precision_score', 'list', 'in', 8, 'List of precision scores', 0),
(11, 'recall_score', 'list', 'in', 8, 'List of recall scores', 0),
(12, 'roc_auc_score', 'list', 'in', 8, 'List of ROC AUC scores', 0),
(13, 'netflow_matrix', 'numpy.ndarray', 'in', 11, 'NetFlow matrix', 0),
(14, 'labels_matrix', 'numpy.ndarray', 'in', 12, 'Labels vector', 0),
(15, 'dataset', 'Dataset', 'in', 14, 'Dataset the algorithm will use', 0),
(16, 'features', 'dict', 'in', 14, 'Dictionary with samples as keys and another dictionary as values which has features as keys and values', 0),
(17, 'features', 'dict', 'in', 16, 'Dictionary with samples as keys and another dictionary as values which has features as keys and values', 0),
(18, 'folds', 'unsigned int', 'in', 17, 'Number of folds', 0),
(19, 'sigma', 'float', 'in', 42, 'Standard deviation of a normal distribution that needs to discriminate servers from clients based on the number of incoming connections', 0),
(21, 'labels_matrix', 'numpy.ndarray', 'in', 45, 'Labels vector', 0),
(22, 'netflow_matrix', 'numpy.ndarray', 'in', 12, 'NetFlow matrix', 0),
(23, 'netflow_matrix', 'numpy.ndarray', 'in', 45, 'NetFlow matrix', 0),
(24, 'sigma', 'float', 'in', 12, 'Standard deviation of a normal distribution that needs to discriminate servers from clients based on the number of incoming connections', 0),
(25, 'labels_matrix', 'numpy.ndarray', 'in', 50, 'Labels vector', 0),
(26, 'netflow_matrix', 'numpy.ndarray', 'in', 50, 'NetFlow matrix', 0),
(27, 'dataset', 'ServerFlagLabeledDataset', 'in', 21, 'Dataset the algorithm will use', 0),
(28, 'features', 'dict', 'in', 21, 'Dictionary with samples as keys and another dictionary as values which has features as keys and values', 0),
(29, 'dataset', 'IpLabeledDataset', 'in', 35, 'Dataset the algorithm will use', 0),
(30, 'features', 'dict', 'in', 35, 'Dictionary with samples as keys and another dictionary as values which has features as keys and values', 0),
(31, 'x', 'numpy.ndarray', 'in', 61, 'Training matrix', 0),
(32, 'y', 'numpy.ndarray', 'in', 61, 'Labels vector', 0),
(33, 'best', 'boolean', 'in', 17, 'Whether the function have to build the best classifier based on data', 0),
(34, 'filename', 'str', 'in', 62, 'File where save data into', 0),
(35, 'y_tests', 'ndarray', 'in', 62, 'Tests labels', 0),
(36, 'y_predictions', 'ndarray', 'in', 62, 'Predictions labels', 0),
(37, 'y_labels', 'ndarray', 'in', 62, 'Labels of samples', 0),
(38, 'which', 'iterable', 'in', 62, 'Which metrics save into the file', 0),
(39, 'bots', 'iterable', 'in', 62, 'Which botnets save into the file', 0),
(40, 'sort_keys', 'bool', 'in', 62, 'If JSON should have sorted keys', 0),
(41, 'indent', 'uint', 'in', 62, 'Indent of the JSON file', 0),
(42, 'filename', 'str', 'in', 63, 'File where save data into', 0),
(43, 'features', 'dict', 'in', 63, 'Features of each sample', 0),
(44, 'which', 'iterable', 'in', 63, 'Which features save into the file', 0),
(45, 'bots', 'iterable', 'in', 63, 'Which samples save into the file', 0),
(46, 'sort_keys', 'bool', 'in', 63, 'If JSON should have sorted keys', 0),
(47, 'indent', 'uint', 'in', 63, 'Indent of the JSON file', 0),
(48, 'filename_tests', 'str', 'in', 64, 'File where save tests labels into', 0),
(49, 'filename_predictions', 'str', 'in', 64, 'File where save predictions labels into', 0),
(50, 'filename_labels', 'str', 'in', 64, 'File where save labels of samples into', 0),
(51, 'y_tests', 'ndarray', 'in', 64, 'Many test labels vectors', 0),
(52, 'y_predictions', 'ndarray', 'in', 64, 'Many prediction labels vectors', 0),
(53, 'y_labels', 'ndarray', 'in', 64, 'Many labels vectors', 0),
(54, 'bots', 'iterable', 'in', 64, 'Which botnets save into the file', 0),
(55, 'indent', 'uint', 'in', 64, 'Indent of the JSON file', 0),
(56, 'n', 'uint', 'in', 65, 'Range of colours generation', 0),
(57, 'filename', 'str', 'in', 66, 'File where save data into', 0),
(58, 'y_tests', 'ndarray', 'in', 66, 'Tests labels', 0),
(59, 'y_predictions', 'ndarray', 'in', 66, 'Predictions labels', 0),
(60, 'y_labels', 'ndarray', 'in', 66, 'Labels of samples', 0),
(61, 'which', 'iterable', 'in', 66, 'Which are metrics to plot', 0),
(62, 'bots', 'iterable', 'in', 66, 'Which are botnets to plot', 0),
(63, 'bar_width', 'float', 'in', 66, 'How wide plot the bars', 0),
(64, 'xlabels', 'str', 'in', 66, 'Labels of X axis', 0),
(65, 'ylabel', 'str', 'in', 66, 'Label of the Y axis', 0),
(66, 'xlabel', 'str', 'in', 66, 'Label of the X axis', 0),
(67, 'color', 'str', 'in', 66, 'Bars colour', 0),
(68, 'filename', 'str', 'in', 67, 'File where save data into', 0),
(69, 'y_tests', 'ndarray', 'in', 67, 'Tests labels', 0),
(70, 'y_predictions', 'ndarray', 'in', 67, 'Predictions labels', 0),
(71, 'y_labels', 'ndarray', 'in', 67, 'Labels of samples', 0),
(72, 'which', 'iterable', 'in', 67, 'Which are metrics to plot', 0),
(74, 'bar_width', 'float', 'in', 67, 'How wide plot the bars', 0),
(75, 'xlabels', 'str', 'in', 67, 'Labels of X axis', 0),
(76, 'ylabel', 'str', 'in', 67, 'Label of the Y axis', 0),
(77, 'xlabel', 'str', 'in', 67, 'Label of the X axis', 0),
(78, 'color', 'str', 'in', 67, 'Bars colour', 0),
(79, 'y_tests', 'ndarray', 'in', 68, 'Many test labels vectors', 0),
(80, 'y_predictions', 'ndarray', 'in', 68, 'Many prediction labels vectors', 0),
(81, 'y_tests', 'ndarray', 'in', 69, 'Many test labels vectors', 0),
(82, 'y_predictions', 'ndarray', 'in', 69, 'Many prediction labels vectors', 0),
(83, 'y_tests', 'ndarray', 'in', 70, 'Many test labels vectors', 0),
(84, 'y_predictions', 'ndarray', 'in', 70, 'Many prediction labels vectors', 0),
(85, 'y_tests', 'ndarray', 'in', 71, 'Many test labels vectors', 0),
(86, 'y_predictions', 'ndarray', 'in', 71, 'Many prediction labels vectors', 0),
(87, 'app_dir', 'str', 'in', 74, 'The location of the application', 0),
(88, 'netflow', 'ndarray', 'in', 78, 'Netflow matrix', 0),
(89, 'netflow', 'ndarray', 'in', 79, 'Netflow matrix', 0),
(90, 'labels', 'ndarray', 'in', 79, 'Labels matrix', 0),
(91, 'netflow', 'ndarray', 'in', 80, 'Netflow matrix', 0),
(92, 'labels', 'ndarray', 'in', 80, 'Labels matrix', 0),
(93, '**kwargs', 'kwargs', 'in', 80, 'Other keyword arguments', 0),
(94, 'netflow', 'ndarray', 'in', 81, 'Netflow matrix', 0),
(95, 'labels', 'ndarray', 'in', 81, 'Labels matrix', 0),
(96, '**kwargs', 'kwargs', 'in', 81, 'Other keyword arguments', 0),
(97, 'ips', 'iterable', 'in', 82, 'IPs', 0),
(98, 'netflow', 'ndarray', 'in', 83, 'Netflow matrix', 0),
(99, 'labels', 'ndarray', 'in', 83, 'Labels matrix', 0),
(100, 'labels', 'ndarray', 'in', 84, 'Labels matrix', 0),
(101, 'netflow', 'ndarray', 'in', 84, 'Netflow matrix', 0),
(102, '**kwargs', 'kwargs', 'in', 84, 'Other keyword arguments', 0),
(103, 'sigma', 'float', 'in', 83, 'Standard deviation', 0),
(104, 'filename', 'str', 'in', 85, 'File to load netflow from', 0),
(105, 'columns', 'iterable', 'in', 85, 'Columns of the netflow', 0),
(106, '**kwargs', 'kwargs', 'in', 85, 'Other keyword arguments', 0),
(107, 'columns', 'iterable', 'in', 86, 'Columns of the netflow', 0),
(108, '**kwargs', 'kwargs', 'in', 86, 'Other keyword arguments', 0),
(109, 'filename', 'str', 'in', 87, 'File to load netflow from', 0),
(110, 'columns', 'iterable', 'in', 87, 'Columns of the netflow', 0),
(111, 'netflow', 'ndarray', 'in', 88, 'Netflow matrix', 0),
(112, 'columns', 'iterable', 'in', 88, 'Columns of the netflow', 0),
(113, '**kwargs', 'kwargs', 'in', 88, 'Other keyword arguments', 0),
(114, 'netflow', 'ndarray', 'in', 90, 'Netflow matrix', 0),
(115, 'columns', 'iterable', 'in', 90, 'Columns of the netflow', 0),
(116, '**kwargs', 'kwargs', 'in', 90, 'Other keyword arguments', 0),
(117, 'columns', 'iterable', 'in', 93, 'Columns of the netflow', 0),
(118, 'netflow', 'ndarray', 'in', 93, 'Netflow matrix', 0),
(119, '**kwargs', 'kwargs', 'in', 93, 'Other keyword arguments', 0),
(120, 'dataset', 'AbstractDataset', 'in', 94, 'Dataset which extract features from', 0),
(121, '**kwargs', 'kwargs', 'in', 94, 'Other keyword arguments', 0),
(122, 'extractor', 'str', 'in', 95, 'Which extractor to build', 0),
(123, 'dataset', 'AbstractDataset', 'in', 97, 'Dataset which extract features from', 0),
(124, '**kwargs', 'kwargs', 'in', 97, 'Other keyword arguments', 0),
(125, 'filename', 'str', 'in', 100, 'File to load netflow from', 0),
(126, '**kwargs', 'kwargs', 'in', 100, 'Other keyword arguments', 0),
(127, 'extractor', 'str', 'in', 102, 'Which dataset builder to build', 0),
(128, 'dataset', 'BotTrackDataset', 'in', 99, 'Dataset which extract features from', 0),
(129, 'dataset', 'DisclosureDataset', 'in', 98, 'Dataset which extract features from', 0),
(130, 'hits_max_iter', 'uint', 'in', 99, 'Maximum number of iterations of HITS function', 0),
(131, 'autocorrelation', 'uint', 'in', 98, 'Number of time series for computing autocorrelation features', 0),
(132, 'unmatched', 'uint', 'in', 98, 'Number of time series for computing unmatched flow features', 0),
(133, 'dataset', 'DisclosureDataset', 'in', 103, 'Dataset which extract features from', 0),
(134, 'q', 'multiprocessing.Queue', 'in', 104, 'Queue where put result in', 0),
(135, 'flows_by_server', 'dict', 'in', 104, 'Easy to iterate data structure with flows', 0),
(136, 'q', 'multiprocessing.Queue', 'in', 105, 'Queue where put result in', 0),
(137, 'flows_by_server', 'dict', 'in', 105, 'Easy to iterate data structure with flows', 0),
(138, 'q', 'multiprocessing.Queue', 'in', 106, 'Queue where put result in', 0),
(139, 'flows_by_server', 'dict', 'in', 106, 'Easy to iterate data structure with flows', 0),
(140, 'q', 'multiprocessing.Queue', 'in', 108, 'Queue where put result in', 0),
(141, 'flows_by_server', 'dict', 'in', 108, 'Easy to iterate data structure with flows', 0),
(142, 'q', 'multiprocessing.Queue', 'in', 109, 'Queue where put result in', 0),
(143, 'flows_by_server', 'dict', 'in', 109, 'Easy to iterate data structure with flows', 0),
(144, 'dataset', 'DisclosureDataset', 'in', 105, 'Dataset which extract features from', 0),
(145, 'autocorrelation', 'uint', 'in', 105, 'Number of time series for computing autocorrelation features', 0),
(146, 'dataset', 'DisclosureDataset', 'in', 109, 'Dataset which extract features from', 0),
(147, 'unmatched', 'uint', 'in', 109, 'Number of time series for computing unmatched flow features', 0),
(148, 'flow_sizes', 'ndarray', 'in', 107, 'Vector of flow sizes', 0);

-- --------------------------------------------------------

--
-- Table structure for table `association`
--

CREATE TABLE `association` (
  `id_association` int(11) NOT NULL,
  `aggregation_from` enum('none','aggregate','composite') NOT NULL,
  `class_from` int(11) NOT NULL,
  `aggregation_to` enum('none','aggregate','composite') NOT NULL,
  `class_to` int(11) NOT NULL,
  `id_attribute` int(11) NOT NULL,
  `multiplicity` enum('*','0..1','0..*','1..*','1') DEFAULT '*'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `id_attribute` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `type` varchar(128) NOT NULL,
  `const` tinyint(1) NOT NULL DEFAULT '0',
  `static` tinyint(1) NOT NULL DEFAULT '0',
  `access` enum('private','public','protected') NOT NULL DEFAULT 'private',
  `id_class` int(11) NOT NULL,
  `description` text NOT NULL,
  `getter` tinyint(1) NOT NULL,
  `setter` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id_attribute`, `name`, `type`, `const`, `static`, `access`, `id_class`, `description`, `getter`, `setter`) VALUES
(2, 'netflow_matrix', 'numpy.ndarray', 0, 0, 'private', 20, 'NetFlow matrix', 0, 0),
(3, 'labels_matrix', 'numpy.ndarray', 0, 0, 'private', 21, 'Labels vector', 0, 0),
(4, 'dataset', 'Dataset', 0, 0, 'protected', 22, 'Dataset to use', 0, 0),
(5, 'features', 'dict', 0, 0, 'protected', 22, 'Dictionary with samples as keys and another dictionary as values which has features as keys and values', 0, 0),
(6, 'classifier', 'Object', 0, 0, 'protected', 22, 'The classifier of the algorithm', 0, 0),
(7, 'state', 'enum', 0, 0, 'protected', 22, 'The state of the algorithm (either initialized or features extracted or fitted classifier)', 0, 0),
(8, 'dataset', 'ServerFlagLabeledDataset', 0, 0, 'protected', 23, 'Dataset to use', 0, 0),
(9, 'features', 'dict', 0, 0, 'protected', 23, 'Dictionary with samples as keys and another dictionary as values which has features as keys and values', 0, 0),
(10, 'classifier', 'Object', 0, 0, 'protected', 23, 'The classifier of the algorithm', 0, 0),
(11, 'state', 'enum', 0, 0, 'protected', 23, 'The state of the algorithm (either initialized or features extracted or fitted classifier)', 0, 0),
(20, 'labeled_ip', 'dict', 0, 0, 'protected', 26, 'Dictionary with IPs as keys and labels as values', 0, 0),
(21, 'labeled_ip', 'dict', 0, 0, 'protected', 25, 'Dictionary with IPs as keys and labels as values', 0, 0),
(22, 'app_dir', 'str', 0, 0, 'private', 31, 'The location of the application', 0, 0),
(23, 'netflow', 'ndarray', 0, 0, 'private', 36, 'Netflow matrix', 0, 0),
(24, 'labels', 'ndarray', 0, 0, 'private', 37, 'Labels matrix', 0, 0),
(25, 'labeled_ip', 'dict', 0, 0, 'private', 38, 'Labels for each samples', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `user` varchar(64) NOT NULL,
  `content` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id_class` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `id_package` int(11) NOT NULL,
  `description` text NOT NULL,
  `usage` text NOT NULL,
  `qobject` tinyint(1) NOT NULL DEFAULT '0',
  `include` text NOT NULL,
  `type` enum('class','abstract','interface') NOT NULL DEFAULT 'class',
  `extra_declaration` text,
  `library` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id_class`, `name`, `id_package`, `description`, `usage`, `qobject`, `include`, `type`, `extra_declaration`, `library`) VALUES
(17, 'DataAccess', 19, 'This class provides a parsing method and it builds data structures from data files', '', 0, '', 'class', '', 0),
(18, 'Main', 20, 'This class contains the main program', '', 0, '', 'class', '', 0),
(19, 'Dataset', 21, 'This class is the abstract base class for every kind of dataset', '', 0, '', 'class', '', 0),
(20, 'UnlabeledDataset', 21, 'This class represents an unlabeled dataset', '', 0, '', 'class', '', 0),
(21, 'LabledDataset', 21, 'This class represents a labeled dataset', '', 0, '', 'class', '', 0),
(22, 'BaseAlgorithm', 22, 'This class is the abstract base class for every kind of implemented algorithm', '', 0, '', 'class', '', 0),
(23, 'DisclosureAlgorithm', 23, 'This class implements DISCLOSURE algorithm', '', 0, '', 'class', '', 0),
(24, 'BotTrackAlgorithm', 24, 'This class implements BotTrack algorithm', '', 0, '', 'class', '', 0),
(25, 'ServerFlagLabeledDataset', 23, 'This class adds functions to a IpLabeledDataset in order to discriminate servers from clients', '', 0, '', 'class', '', 0),
(26, 'IpLabeledDataset', 22, 'This class adapts and adds functions to a LabeledDataset in order to associate labels to IPs properly', '', 0, '', 'class', '', 0),
(27, 'NodeLabeledDataset', 24, 'This class adapt a IpLabeledDataset in order to work with BotTrackAlgorithm', '', 0, '', 'class', '', 0),
(28, 'Save', 38, 'This class contains the build-in methods to save outputs into files', '', 0, '', 'class', '', 0),
(29, 'Plot', 38, 'This class contains the build-in methods to save plots into files', '', 0, '', 'class', '', 0),
(30, 'Metrics', 29, 'This class contains the build-in methods to compute evaluation metrics', '', 0, '', 'class', '', 0),
(31, 'App', 28, 'This class is the main class of the application', '', 0, '', 'class', '', 0),
(32, 'AbstractDataset', 26, 'This class is the abstract base class for each dataset', '', 0, '', 'abstract', '', 0),
(33, 'UnlabeledDatasetInterface', 26, 'This is the interface for each unlabeled dataset', '', 0, '', 'interface', '', 0),
(34, 'LabeledDatasetInterface', 26, 'This is the interface for each labeled dataset', '', 0, '', 'interface', '', 0),
(35, 'IpLabeledDatasetInterface', 26, 'This is the interface for each IP-labeled dataset', '', 0, '', 'interface', '', 0),
(36, 'UnlabeledDataset', 26, 'This class represents an unlabeled dataset', '', 0, '', 'class', '', 0),
(37, 'LabeledDataset', 26, 'This class represents a labeled dataset', '', 0, '', 'class', '', 0),
(38, 'IpLabeledDataset', 26, 'This class is an abstract base class for each IP-labeled dataset', '', 0, '', 'abstract', '', 0),
(39, 'DisclosureDataset', 36, 'This class represents a Disclosure dataset', '', 0, '', 'class', '', 0),
(40, 'BotTrackDataset', 37, 'This class represents a BotTrack dataset', '', 0, '', 'class', '', 0),
(41, 'DatasetBuilderInterface', 26, 'This is the interface for each dataset builder', '', 0, '', 'interface', '', 0),
(42, 'AbstractDatasetBuilder', 26, 'This class represents an abstract base class for each dataset builder', '', 0, '', 'abstract', '', 0),
(43, 'DisclosureDatasetBuilder', 36, 'This class provides a builder for Disclosure datasets', '', 0, '', 'class', '', 0),
(44, 'BotTrackDatasetBuilder', 37, 'This class provides a builder for BotTrack datasets', '', 0, '', 'class', '', 0),
(45, 'ExtractorInterface', 27, 'This is the interface for each extractor', '', 0, '', 'interface', '', 0),
(46, 'Extractor', 27, 'This class binds to many features extractors depending on parameters', '', 0, '', 'class', '', 0),
(47, 'DisclosureExtractor', 34, 'This class is a features extractor for Disclosure algorithm', '', 0, '', 'class', '', 0),
(48, 'BotTrackExtractor', 35, 'This class is a features extractor for BotTrack algorithm', '', 0, '', 'class', '', 0),
(49, 'DatasetBuilder', 26, 'This class binds to many dataset builders depending on parameters', '', 0, '', 'class', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `class_requirement`
--

CREATE TABLE `class_requirement` (
  `id_requirement` int(11) NOT NULL,
  `id_class` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `connect`
--

CREATE TABLE `connect` (
  `signal` int(11) NOT NULL,
  `slot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dependency`
--

CREATE TABLE `dependency` (
  `id_dependency` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` text,
  `id_from` int(11) NOT NULL,
  `id_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_category`
--

CREATE TABLE `event_category` (
  `id_category` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event_category`
--

INSERT INTO `event_category` (`id_category`, `name`) VALUES
(1, 'Flusso principale'),
(2, 'Scenari Alternativi'),
(3, 'Estensione'),
(4, 'Inclusione');

-- --------------------------------------------------------

--
-- Table structure for table `external_source`
--

CREATE TABLE `external_source` (
  `id_source` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inherit`
--

CREATE TABLE `inherit` (
  `child` int(11) NOT NULL,
  `parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inherit`
--

INSERT INTO `inherit` (`child`, `parent`) VALUES
(20, 19),
(21, 20),
(23, 22),
(24, 22),
(25, 26),
(26, 21),
(27, 26),
(34, 33),
(35, 34),
(36, 32),
(36, 33),
(37, 34),
(37, 36),
(38, 35),
(38, 37),
(39, 38),
(40, 38),
(42, 41),
(43, 42),
(44, 42),
(46, 45),
(47, 45),
(48, 45),
(49, 41);

-- --------------------------------------------------------

--
-- Table structure for table `integration_test`
--

CREATE TABLE `integration_test` (
  `id_test` int(11) NOT NULL,
  `id_package` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `method`
--

CREATE TABLE `method` (
  `id_method` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `pre` text,
  `post` text,
  `description` text NOT NULL,
  `return` varchar(128) DEFAULT NULL,
  `access` enum('public','protected','private','signal') DEFAULT 'public',
  `virtual` tinyint(1) NOT NULL DEFAULT '0',
  `override` tinyint(1) NOT NULL DEFAULT '0',
  `final` tinyint(1) NOT NULL DEFAULT '0',
  `static` tinyint(1) NOT NULL DEFAULT '0',
  `const` tinyint(1) NOT NULL DEFAULT '0',
  `nothrow` tinyint(1) NOT NULL DEFAULT '0',
  `id_class` int(11) NOT NULL,
  `abstract` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `method`
--

INSERT INTO `method` (`id_method`, `name`, `pre`, `post`, `description`, `return`, `access`, `virtual`, `override`, `final`, `static`, `const`, `nothrow`, `id_class`, `abstract`) VALUES
(1, '__init__', '', '', 'This function is the constructor method', '', 'public', 0, 0, 0, 0, 0, 0, 17, 0),
(2, 'build_LabledDataset', '', '', 'This function builds a LabledDataset with selected columns from a given filename if it contains both data and labels, or from two separate files given as a tuple with data in the first and labels in the second', 'LabledDataset', 'public', 0, 0, 0, 1, 0, 0, 17, 0),
(3, 'build_UnlabledDataset', '', '', 'This function builds a UnlabledDataset with selected columns from a given filename', 'UnlabledDataset', 'public', 0, 0, 0, 1, 0, 0, 17, 0),
(4, 'file_to_labels_matrix', '', '', 'This function builds a vector of labels from a file', 'numpy.ndarray', 'private', 0, 0, 0, 1, 0, 0, 17, 0),
(5, 'file_to_netflow_matrix', '', '', 'This function builds a matrix with data with selected column from a file', 'numpy.ndarray', 'public', 0, 0, 0, 1, 0, 0, 17, 0),
(6, 'parse', '', '', 'This function provides to parse the string of arguments given when the program starts', 'dict', 'public', 0, 0, 0, 1, 0, 0, 17, 0),
(7, 'main', '', '', 'This function is the main method', 'void', 'public', 0, 0, 0, 1, 0, 0, 18, 0),
(8, 'print_accuracy_precision_recall_roc', '', '', 'This function prints in the standard output accuracy scores, precision scores, recall scores and ROC AUC scores lists and for each of them it prints the mean and the standard deviation', 'void', 'private', 0, 0, 0, 1, 0, 0, 18, 0),
(9, 'netflow_matrix', '', '', 'This function gets the data matrix of the NetFlow', 'numpy.ndarray', 'public', 1, 0, 0, 0, 0, 0, 19, 0),
(10, 'netflow_matrix', '', '', 'This function gets the data matrix of the dataset', 'numpy.ndarray', 'public', 0, 0, 0, 0, 0, 0, 20, 0),
(11, '__init__', '', '', 'This function is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 20, 0),
(12, '__init__', '', '', 'This function is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 25, 0),
(14, '__init__', '', '', 'This function is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 22, 0),
(15, 'build_matrices', '', '', 'This function builds the training matrix, with samples and features and the labels vector for classification', '(numpy.ndarray, numpy.ndarray)', 'protected', 0, 0, 0, 0, 0, 0, 22, 0),
(16, 'evaluate', '', '', 'This function performs evaluation on given features using the current fitted classifier', '(list, list, list, list)', 'public', 1, 0, 0, 0, 0, 0, 22, 0),
(17, 'stratified_k_fold', '', '', 'This function performs a stratified K-Folds evaluation on the features', '(list, list, list, list)', 'public', 0, 0, 0, 0, 0, 0, 22, 0),
(18, 'classifier', '', '', 'This function gets the classifier, if the features have not been extracted yet it also extracts them first, if the classifier has not been fitted yet it also provides to do it first', 'Object', 'public', 1, 0, 0, 0, 0, 0, 22, 0),
(19, 'columns', '', '', 'This function gets the list of columns the algorithm require', 'list', 'public', 1, 0, 0, 0, 0, 0, 22, 0),
(20, 'features', '', '', 'This function gets the features, if the features have not been extracted yet it also extracts them first', 'dict', 'public', 1, 0, 0, 0, 0, 0, 22, 0),
(21, '__init__', '', '', 'This function is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 23, 0),
(22, 'build_matrices', '', '', 'This function builds the training matrix, with samples and features and the labels vector for classification', '(numpy.ndarray, numpy.ndarray)', 'protected', 0, 0, 0, 0, 0, 0, 23, 0),
(23, 'evaluate', '', '', 'This function performs evaluation on given features using the current fitted classifier', '(list, list, list, list)', 'public', 0, 0, 0, 0, 0, 0, 23, 0),
(25, 'classifier', '', '', 'This function gets the classifier, if the features have not been extracted yet it also extracts them first, if the classifier has not been fitted yet it also provides to do it first', 'Object', 'public', 0, 0, 0, 0, 0, 0, 23, 0),
(26, 'columns', '', '', 'This function gets list of columns the algorithm require', 'list', 'public', 0, 0, 0, 1, 0, 0, 23, 0),
(27, 'features', '', '', 'This function gets the features, if the features have not been extracted yet it also extracts them first', 'dict', 'public', 0, 0, 0, 0, 0, 0, 23, 0),
(35, '__init__', '', '', 'This function is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 24, 0),
(36, 'build_matrices', '', '', 'This function builds the training matrix, with samples and features and the labels vector for classification', '(numpy.ndarray, numpy.ndarray)', 'protected', 0, 0, 0, 0, 0, 0, 24, 0),
(37, 'evaluate', '', '', 'This function performs evaluation on given features using the current fitted classifier', '(list, list, list, list)', 'public', 0, 0, 0, 0, 0, 0, 24, 0),
(39, 'classifier', '', '', 'This function gets the classifier, if the features have not been extracted yet it also extracts them first, if the classifier has not been fitted yet it also provides to do it first', 'Object', 'public', 0, 0, 0, 0, 0, 0, 24, 0),
(40, 'columns', '', '', 'This function gets the list of columns the algorithm require', 'list', 'public', 0, 0, 0, 1, 0, 0, 24, 0),
(41, 'features', '', '', 'This function gets the features, if the features have not been extracted yet it also extracts them first', 'dict', 'public', 0, 0, 0, 0, 0, 0, 24, 0),
(42, 'apply_heuristic', '', 'The return is a map with servers as keys and labels as values which are all set to false', 'This function applies an heuristic in order to discriminate whether IPs are servers or clients; in particular it flags servers IPs with at least a certain number of incoming connections using a standard deviation on a normal distribution', 'dict', 'private', 0, 0, 0, 0, 0, 0, 25, 0),
(45, '__init__', '', '', 'This function is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 21, 0),
(47, 'labels_matrix', '', '', 'This function gets the label vector of the dataset', 'numpy.ndarray', 'public', 0, 0, 0, 0, 0, 0, 21, 0),
(48, '__init__', '', '', 'This function is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 19, 0),
(50, '__init__', '', '', 'This function is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 26, 0),
(51, 'labeled_ip', '', '', 'This function gets labeled_ip dictionary', 'dict', 'protected', 0, 0, 0, 0, 0, 0, 26, 0),
(52, 'associate_labels', '', '', 'This function extracts unique IPs and it associates labels to them', 'dict', 'protected', 0, 0, 0, 0, 0, 0, 26, 0),
(53, 'build_classifier', '', '', 'This function builds the classifier for the algorithm', 'Object', 'protected', 1, 0, 0, 0, 0, 0, 22, 0),
(54, 'predict', '', '', 'This function uses the classifier in order to predict samples', 'numpy.ndarray', 'protected', 1, 0, 0, 0, 0, 0, 22, 0),
(55, 'predict', '', '', 'This function uses the classifier in order to predict samples', 'numpy.ndarray', 'protected', 0, 0, 0, 1, 0, 0, 23, 0),
(56, 'predict', '', '', 'This function uses the classifier in order to predict samples', 'numpy.ndarray', 'protected', 0, 0, 0, 1, 0, 0, 24, 0),
(57, 'build_classifier', '', '', 'This function builds the classifier for the algorithm', 'Object', 'protected', 0, 0, 0, 0, 0, 0, 23, 0),
(58, 'build_classifier', '', '', 'This function builds the classifier for the algorithm', 'Object', 'protected', 0, 0, 0, 0, 0, 0, 24, 0),
(59, 'labeled_ip', '', '', 'This function gets labeled_ip dictionary', 'dict', 'protected', 0, 0, 0, 0, 0, 0, 25, 0),
(60, '__init__', '', '', 'This function is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 27, 0),
(61, 'build_best_classifier', '', '', 'This function builds the best classifier for the algorithm depending on data', 'Object', 'protected', 0, 0, 0, 0, 0, 0, 22, 0),
(62, 'metrics', '', '', 'This method save evaluation metrics into a JSON file', 'void', 'public', 0, 0, 0, 1, 0, 0, 28, 0),
(63, 'features', '', '', 'This method save extracted features into a JSON file', 'void', 'public', 0, 0, 0, 1, 0, 0, 28, 0),
(64, 'predictions', '', '', 'This method save predictions into a JSON file', 'void', 'public', 0, 0, 0, 1, 0, 0, 28, 0),
(65, 'get_colours_map', '', '', 'This method get a function to generate colours in a range', 'function', 'private', 0, 0, 0, 1, 0, 0, 29, 0),
(66, 'metrics_bars', '', '', 'This method plots a bar chart with metrics for each detected botnet', 'void', 'public', 0, 0, 0, 1, 0, 0, 29, 0),
(67, 'total_metrics_bar', '', '', 'This method plots a bar chart with metrics of total detected botnets', 'void', 'public', 0, 0, 0, 1, 0, 0, 29, 0),
(68, 'accuracy', '', '', 'This method performs accuracy score metric', 'tuple', 'public', 0, 0, 0, 1, 0, 0, 30, 0),
(69, 'precision', '', '', 'This method performs precision score metric', 'tuple', 'public', 0, 0, 0, 1, 0, 0, 30, 0),
(70, 'recall', '', '', 'This method performs recall score metric', 'tuple', 'public', 0, 0, 0, 1, 0, 0, 30, 0),
(71, 'roc_auc', '', '', 'This method performs ROC AUC score metric', 'tuple', 'public', 0, 0, 0, 1, 0, 0, 30, 0),
(72, 'main', '', '', 'This method is the main method of the application', 'void', 'public', 0, 0, 0, 0, 0, 0, 31, 0),
(73, 'parse', '', '', 'This method provide to parse the command line input', 'object', 'private', 0, 0, 0, 1, 0, 0, 31, 0),
(74, '__init__', '', '', 'This method is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 31, 0),
(75, 'netflow', '', '', 'This method gets the netflow matrix', 'ndarray', 'public', 0, 0, 0, 0, 0, 0, 33, 0),
(76, 'labels', '', '', 'This method gets the labels matrix', 'ndarray', 'public', 0, 0, 0, 0, 0, 0, 34, 0),
(77, 'labeled_ips', '', '', 'This method gets labels for each samples', 'dict', 'public', 0, 0, 0, 0, 0, 0, 35, 0),
(78, '__init__', '', '', 'This method is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 36, 0),
(79, '__init__', '', '', 'This method is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 37, 0),
(80, '__init__', '', '', 'This method is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 38, 0),
(81, 'extract_ips', '', '', 'This method extracts IPs', 'set', 'protected', 1, 0, 0, 0, 0, 0, 38, 0),
(82, 'associate_labels', '', '', 'This method associates labels to each IP', 'dict', 'protected', 0, 0, 0, 0, 0, 0, 38, 0),
(83, 'extract_ips', '', '', 'This method extracts server IPs which are nodes with number of incoming connections around a certain standard deviation from the maximum', 'set', 'protected', 0, 0, 0, 0, 0, 0, 39, 0),
(84, 'extract_ips', '', '', 'This method extracts every unique IP', 'set', 'public', 0, 0, 0, 0, 0, 0, 40, 0),
(85, 'build', '', '', 'This method build the dataset', 'AbstractDataset', 'public', 1, 0, 0, 0, 0, 0, 41, 0),
(86, 'pre_build', '', '', 'This method performs operations before build method call', '(list, kwargs)', 'protected', 0, 0, 0, 0, 0, 0, 42, 0),
(87, 'load', '', '', 'This method loads the netflow from file', 'ndarray', 'protected', 0, 0, 0, 0, 0, 0, 42, 0),
(88, 'build', '', '', 'This method build the dataset and it is accessed from build public method', 'AbstractDataset', 'protected', 1, 0, 0, 0, 0, 0, 42, 0),
(89, 'columns', '', '', 'This method gets the columns to extract from the netflow', '', 'public', 1, 0, 0, 0, 0, 0, 42, 0),
(90, 'build', '', '', 'This method build the dataset and it is accessed from build public method', 'DisclosureDataset', 'protected', 1, 0, 0, 0, 0, 0, 43, 0),
(91, 'columns', '', '', 'This method gets the columns to extract from the netflow', '', 'public', 1, 0, 0, 0, 0, 0, 43, 0),
(92, 'columns', '', '', 'This method gets the columns to extract from the netflow', '', 'public', 1, 0, 0, 0, 0, 0, 44, 0),
(93, 'build', '', '', 'This method build the dataset and it is accessed from build public method', 'BotTrackDataset', 'protected', 1, 0, 0, 0, 0, 0, 44, 0),
(94, 'extract', '', '', 'This method provides to extract features from the dataset', 'dict', 'public', 0, 0, 0, 0, 0, 0, 45, 0),
(95, '__init__', '', '', 'This method is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 46, 0),
(96, 'extractors_map', '', '', 'This method provides a map to bind a string to an extractor', 'dict', 'private', 0, 0, 0, 0, 0, 0, 46, 0),
(97, 'extract', '', '', 'This method provides to extract features from the dataset', 'dict', 'public', 0, 0, 0, 0, 0, 0, 46, 0),
(98, 'extract', '', '', 'This method provides to extract features from the dataset', 'dict', 'public', 0, 0, 0, 0, 0, 0, 47, 0),
(99, 'extract', '', '', 'This method provides to extract features from the dataset', 'dict', 'public', 0, 0, 0, 0, 0, 0, 48, 0),
(100, 'build', '', '', 'This method build the dataset', 'AbstractDataset', 'public', 0, 0, 0, 0, 0, 0, 49, 0),
(101, 'dataset_builders_map', '', '', 'This method provides a map to bind a string to a dataset builder', 'dict', 'private', 0, 0, 0, 0, 0, 0, 49, 0),
(102, '__init__', '', '', 'This method is the constructor of the class', '', 'public', 0, 0, 0, 0, 0, 0, 49, 0),
(103, 'extract_flows', '', '', 'This method provide to create of an easy to iterate data structure from the dataset', 'dict', 'private', 0, 0, 0, 0, 0, 0, 47, 0),
(104, 'extract_statistical_features', '', '', 'This method extracts statistical features', 'dict', 'private', 0, 0, 0, 1, 0, 0, 47, 0),
(105, 'extract_autocorrelation_features', '', '', 'This method extracts autocorrelation features', 'dict', 'private', 0, 0, 0, 1, 0, 0, 47, 0),
(106, 'extract_unique_flow_sizes_features', '', '', 'This method extracts unique flow sizes features', 'dict', 'private', 0, 0, 0, 1, 0, 0, 47, 0),
(107, 'extract_kurtosis_and_entropy', '', '', 'This method extracts kurtosis of given flow sizes and entropy on unique flow size', 'dict', 'private', 0, 0, 0, 1, 0, 0, 47, 0),
(108, 'regular_access_patterns_features', '', '', 'This method extracts regular access patterns features', 'dict', 'private', 0, 0, 0, 1, 0, 0, 47, 0),
(109, 'unmatched_flow_density_features', '', '', 'This method extracts unmatched flow density features', 'dict', 'private', 0, 0, 0, 1, 0, 0, 47, 0);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id_package` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `virtual` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id_package`, `name`, `parent`, `description`, `virtual`) VALUES
(19, 'dataAccess', NULL, 'This package provides classes to give a simple way to data access', 0),
(20, 'mainOOLD', NULL, 'This package contains the main program', 0),
(21, 'datasss', NULL, 'This package provides classes to handle datasets', 0),
(22, 'dataProcessing', NULL, 'This package provides classes to process datasets', 0),
(23, 'disclosure', 22, 'This package provides classes to implement DISCLOSURE algorithm', 0),
(24, 'botTrack', 22, 'This package provides classes to implement BotTrack algorithm', 0),
(25, 'algorithms', NULL, 'This package provides classes to implement detector algorithms', 0),
(26, 'datasets', NULL, 'This package provides classes to handle with datasets', 0),
(27, 'extractors', NULL, 'This package provides classes to implement features extractors', 0),
(28, 'main', NULL, 'This package contains the main program', 0),
(29, 'metrics', NULL, 'This package provides classes to compute evaluation metrics', 0),
(30, 'outputs', NULL, 'This package provides classes to handle with outputs', 0),
(32, 'disclosure', 25, 'This package provides classes to implement Disclosure detector algorithm', 0),
(33, 'bottrack', 25, 'This package provides classes to implement BotTrack detector algorithm', 0),
(34, 'disclosure', 27, 'This package provides classes to implement Disclosure features extractor algorithm', 0),
(35, 'bottrack', 27, 'This package provides classes to implement BotTrack features extractor algorithm', 0),
(36, 'disclosure', 26, 'This package provides classes to handle with Disclosure datasets', 0),
(37, 'bottrack', 26, 'This package provides classes to handle with BotTrack datasets', 0),
(38, 'save', 30, 'This package provides classes to save outputs into files', 0),
(39, 'plot', 30, 'This package provides classes to save plots into files', 0);

-- --------------------------------------------------------

--
-- Table structure for table `package_requirement`
--

CREATE TABLE `package_requirement` (
  `id_requirement` int(11) NOT NULL,
  `id_package` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requirement`
--

CREATE TABLE `requirement` (
  `id_requirement` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `apported` tinyint(1) NOT NULL DEFAULT '0',
  `validation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requirement_category`
--

CREATE TABLE `requirement_category` (
  `id_category` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `latex_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requirement_category`
--

INSERT INTO `requirement_category` (`id_category`, `name`, `latex_name`) VALUES
(1, 'Funzionale', 'Funzionale'),
(2, 'Qualità', 'Qualitativo'),
(3, 'Prestazionali', 'Prestazionale'),
(4, 'Vincolo', 'Vincolo');

-- --------------------------------------------------------

--
-- Table structure for table `requirement_priority`
--

CREATE TABLE `requirement_priority` (
  `id_priority` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requirement_priority`
--

INSERT INTO `requirement_priority` (`id_priority`, `name`) VALUES
(1, 'Obbligatorio'),
(2, 'Opzionale'),
(3, 'Desiderabile');

-- --------------------------------------------------------

--
-- Table structure for table `requirement_validation`
--

CREATE TABLE `requirement_validation` (
  `id_validation` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `secondary_actors`
--

CREATE TABLE `secondary_actors` (
  `id_event` int(11) NOT NULL,
  `id_actor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id_source` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `source_requirement`
--

CREATE TABLE `source_requirement` (
  `id_source` int(11) NOT NULL,
  `id_requirement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `system_test`
--

CREATE TABLE `system_test` (
  `id_test` int(11) NOT NULL,
  `id_requirement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id_test` int(11) NOT NULL,
  `status` enum('unimplemented','failed','success') NOT NULL DEFAULT 'unimplemented',
  `description` text NOT NULL,
  `jenkins_id` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unit_test`
--

CREATE TABLE `unit_test` (
  `id_test` int(11) NOT NULL,
  `id_method` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `use_case`
--

CREATE TABLE `use_case` (
  `id_use_case` int(11) NOT NULL,
  `title` text NOT NULL,
  `actors` text NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `gparent` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `pre` text NOT NULL,
  `post` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `use_case_event`
--

CREATE TABLE `use_case_event` (
  `id_event` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `use_case` int(11) NOT NULL,
  `description` text NOT NULL,
  `refers_to` int(11) DEFAULT NULL,
  `primary_actor` int(11) DEFAULT NULL,
  `order` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `validation_test`
--

CREATE TABLE `validation_test` (
  `id_test` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `id_requirement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id_actor`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `argument`
--
ALTER TABLE `argument`
  ADD PRIMARY KEY (`id_argument`),
  ADD KEY `fk_argument_method1` (`id_method`);

--
-- Indexes for table `association`
--
ALTER TABLE `association`
  ADD PRIMARY KEY (`id_association`),
  ADD KEY `fk_association_class1` (`class_from`),
  ADD KEY `fk_association_class2` (`class_to`),
  ADD KEY `fk_association_attribute1` (`id_attribute`);

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id_attribute`),
  ADD KEY `fk_attribute_method1` (`id_class`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id_class`),
  ADD KEY `id_package` (`id_package`);

--
-- Indexes for table `class_requirement`
--
ALTER TABLE `class_requirement`
  ADD PRIMARY KEY (`id_requirement`,`id_class`),
  ADD KEY `fk_requirement_has_class_class1` (`id_class`),
  ADD KEY `fk_requirement_has_class_requirement1` (`id_requirement`);

--
-- Indexes for table `connect`
--
ALTER TABLE `connect`
  ADD PRIMARY KEY (`signal`,`slot`),
  ADD KEY `fk_method_has_method_method2` (`slot`),
  ADD KEY `fk_method_has_method_method1` (`signal`);

--
-- Indexes for table `dependency`
--
ALTER TABLE `dependency`
  ADD PRIMARY KEY (`id_dependency`),
  ADD KEY `fk_dependency_class1` (`id_from`),
  ADD KEY `fk_dependency_class2` (`id_to`);

--
-- Indexes for table `event_category`
--
ALTER TABLE `event_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `external_source`
--
ALTER TABLE `external_source`
  ADD PRIMARY KEY (`id_source`),
  ADD KEY `fk_external_source_source1` (`id_source`);

--
-- Indexes for table `inherit`
--
ALTER TABLE `inherit`
  ADD PRIMARY KEY (`child`,`parent`),
  ADD KEY `fk_class_has_class_class2` (`parent`),
  ADD KEY `fk_class_has_class_class1` (`child`);

--
-- Indexes for table `integration_test`
--
ALTER TABLE `integration_test`
  ADD PRIMARY KEY (`id_test`),
  ADD KEY `fk_test_has_package_package1` (`id_package`),
  ADD KEY `fk_test_has_package_test1` (`id_test`);

--
-- Indexes for table `method`
--
ALTER TABLE `method`
  ADD PRIMARY KEY (`id_method`),
  ADD KEY `fk_method_class1` (`id_class`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id_package`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `package_requirement`
--
ALTER TABLE `package_requirement`
  ADD PRIMARY KEY (`id_requirement`,`id_package`),
  ADD KEY `id_package` (`id_package`);

--
-- Indexes for table `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`id_requirement`),
  ADD KEY `fk_requirement_requirement_category1` (`category`),
  ADD KEY `fk_requirement_requirement1` (`parent`),
  ADD KEY `fk_requirement_1` (`priority`),
  ADD KEY `validation` (`validation`);

--
-- Indexes for table `requirement_category`
--
ALTER TABLE `requirement_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `requirement_priority`
--
ALTER TABLE `requirement_priority`
  ADD PRIMARY KEY (`id_priority`);

--
-- Indexes for table `requirement_validation`
--
ALTER TABLE `requirement_validation`
  ADD PRIMARY KEY (`id_validation`);

--
-- Indexes for table `secondary_actors`
--
ALTER TABLE `secondary_actors`
  ADD PRIMARY KEY (`id_event`,`id_actor`),
  ADD KEY `fk_use_case_has_actor_actor1` (`id_actor`),
  ADD KEY `fk_use_case_has_actor_use_case1` (`id_event`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id_source`);

--
-- Indexes for table `source_requirement`
--
ALTER TABLE `source_requirement`
  ADD PRIMARY KEY (`id_source`,`id_requirement`),
  ADD KEY `fk_source_has_requirement_requirement1` (`id_requirement`),
  ADD KEY `fk_source_has_requirement_source1` (`id_source`);

--
-- Indexes for table `system_test`
--
ALTER TABLE `system_test`
  ADD PRIMARY KEY (`id_test`),
  ADD KEY `fk_test_has_requirement_requirement1` (`id_requirement`),
  ADD KEY `fk_test_has_requirement_test1` (`id_test`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id_test`);

--
-- Indexes for table `unit_test`
--
ALTER TABLE `unit_test`
  ADD PRIMARY KEY (`id_test`),
  ADD KEY `fk_test_has_method_method1` (`id_method`),
  ADD KEY `fk_test_has_method_test1` (`id_test`);

--
-- Indexes for table `use_case`
--
ALTER TABLE `use_case`
  ADD PRIMARY KEY (`id_use_case`),
  ADD KEY `fk_parent` (`parent`),
  ADD KEY `fk_use_case_1` (`id_use_case`);

--
-- Indexes for table `use_case_event`
--
ALTER TABLE `use_case_event`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `fk_use_case_event_use_case1` (`use_case`),
  ADD KEY `fk_use_case_event_actor1` (`primary_actor`),
  ADD KEY `category` (`category`),
  ADD KEY `refers_to` (`refers_to`);

--
-- Indexes for table `validation_test`
--
ALTER TABLE `validation_test`
  ADD PRIMARY KEY (`id_test`),
  ADD KEY `fk_validation_test_1` (`id_test`),
  ADD KEY `fk_validation_test_validation_test1` (`parent`),
  ADD KEY `fk_validation_test_requirement1` (`id_requirement`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actor`
--
ALTER TABLE `actor`
  MODIFY `id_actor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `argument`
--
ALTER TABLE `argument`
  MODIFY `id_argument` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;
--
-- AUTO_INCREMENT for table `association`
--
ALTER TABLE `association`
  MODIFY `id_association` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id_attribute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id_class` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `dependency`
--
ALTER TABLE `dependency`
  MODIFY `id_dependency` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `method`
--
ALTER TABLE `method`
  MODIFY `id_method` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id_package` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `requirement`
--
ALTER TABLE `requirement`
  MODIFY `id_requirement` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `requirement_category`
--
ALTER TABLE `requirement_category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `requirement_priority`
--
ALTER TABLE `requirement_priority`
  MODIFY `id_priority` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `requirement_validation`
--
ALTER TABLE `requirement_validation`
  MODIFY `id_validation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id_source` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id_test` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `use_case`
--
ALTER TABLE `use_case`
  MODIFY `id_use_case` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `use_case_event`
--
ALTER TABLE `use_case_event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `actor`
--
ALTER TABLE `actor`
  ADD CONSTRAINT `actor_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `actor` (`id_actor`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `argument`
--
ALTER TABLE `argument`
  ADD CONSTRAINT `argument_ibfk_1` FOREIGN KEY (`id_method`) REFERENCES `method` (`id_method`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `association`
--
ALTER TABLE `association`
  ADD CONSTRAINT `association_ibfk_1` FOREIGN KEY (`class_from`) REFERENCES `class` (`id_class`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `association_ibfk_2` FOREIGN KEY (`class_to`) REFERENCES `class` (`id_class`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `association_ibfk_3` FOREIGN KEY (`id_attribute`) REFERENCES `attribute` (`id_attribute`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `attribute`
--
ALTER TABLE `attribute`
  ADD CONSTRAINT `fk_attribute_method1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`id_package`) REFERENCES `package` (`id_package`);

--
-- Constraints for table `class_requirement`
--
ALTER TABLE `class_requirement`
  ADD CONSTRAINT `fk_requirement_has_class_class1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requirement_has_class_requirement1` FOREIGN KEY (`id_requirement`) REFERENCES `requirement` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `connect`
--
ALTER TABLE `connect`
  ADD CONSTRAINT `fk_method_has_method_method1` FOREIGN KEY (`signal`) REFERENCES `method` (`id_method`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_method_has_method_method2` FOREIGN KEY (`slot`) REFERENCES `method` (`id_method`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dependency`
--
ALTER TABLE `dependency`
  ADD CONSTRAINT `fk_dependency_class1` FOREIGN KEY (`id_from`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dependency_class2` FOREIGN KEY (`id_to`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `external_source`
--
ALTER TABLE `external_source`
  ADD CONSTRAINT `fk_external_source_source1` FOREIGN KEY (`id_source`) REFERENCES `source` (`id_source`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `inherit`
--
ALTER TABLE `inherit`
  ADD CONSTRAINT `fk_class_has_class_class1` FOREIGN KEY (`child`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_class_has_class_class2` FOREIGN KEY (`parent`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `integration_test`
--
ALTER TABLE `integration_test`
  ADD CONSTRAINT `fk_test_has_package_package1` FOREIGN KEY (`id_package`) REFERENCES `package` (`id_package`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_test_has_package_test1` FOREIGN KEY (`id_test`) REFERENCES `test` (`id_test`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `method`
--
ALTER TABLE `method`
  ADD CONSTRAINT `fk_method_class1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `package` (`id_package`);

--
-- Constraints for table `package_requirement`
--
ALTER TABLE `package_requirement`
  ADD CONSTRAINT `package_requirement_ibfk_1` FOREIGN KEY (`id_requirement`) REFERENCES `requirement` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `package_requirement_ibfk_2` FOREIGN KEY (`id_package`) REFERENCES `package` (`id_package`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `requirement`
--
ALTER TABLE `requirement`
  ADD CONSTRAINT `fk_requirement_1` FOREIGN KEY (`priority`) REFERENCES `requirement_priority` (`id_priority`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requirement_requirement1` FOREIGN KEY (`parent`) REFERENCES `requirement` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requirement_requirement_category1` FOREIGN KEY (`category`) REFERENCES `requirement_category` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`validation`) REFERENCES `requirement_validation` (`id_validation`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `secondary_actors`
--
ALTER TABLE `secondary_actors`
  ADD CONSTRAINT `fk_use_case_has_actor_actor1` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id_actor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_use_case_has_actor_use_case1` FOREIGN KEY (`id_event`) REFERENCES `use_case_event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `source_requirement`
--
ALTER TABLE `source_requirement`
  ADD CONSTRAINT `fk_source_has_requirement_requirement1` FOREIGN KEY (`id_requirement`) REFERENCES `requirement` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_source_has_requirement_source1` FOREIGN KEY (`id_source`) REFERENCES `source` (`id_source`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `system_test`
--
ALTER TABLE `system_test`
  ADD CONSTRAINT `fk_test_has_requirement_requirement1` FOREIGN KEY (`id_requirement`) REFERENCES `requirement` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_test_has_requirement_test1` FOREIGN KEY (`id_test`) REFERENCES `test` (`id_test`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `unit_test`
--
ALTER TABLE `unit_test`
  ADD CONSTRAINT `fk_test_has_method_method1` FOREIGN KEY (`id_method`) REFERENCES `method` (`id_method`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_test_has_method_test1` FOREIGN KEY (`id_test`) REFERENCES `test` (`id_test`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
