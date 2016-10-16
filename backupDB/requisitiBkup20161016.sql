-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Ott 16, 2016 alle 20:17
-- Versione del server: 10.1.16-MariaDB
-- Versione PHP: 5.6.24

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
-- Struttura della tabella `actor`
--

CREATE TABLE `actor` (
  `id_actor` int(11) NOT NULL,
  `description` text NOT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `actor`
--

INSERT INTO `actor` (`id_actor`, `description`, `parent`) VALUES
(3, 'Utente', NULL),
(4, 'Utente con privilegi di lettura', NULL),
(5, 'Utente con privilegi di scrittura', 4),
(6, 'Utente con privilegi di amministratore', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `argument`
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

-- --------------------------------------------------------

--
-- Struttura della tabella `association`
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
-- Struttura della tabella `attribute`
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

-- --------------------------------------------------------

--
-- Struttura della tabella `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `user` varchar(64) NOT NULL,
  `content` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `class`
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

-- --------------------------------------------------------

--
-- Struttura della tabella `class_requirement`
--

CREATE TABLE `class_requirement` (
  `id_requirement` int(11) NOT NULL,
  `id_class` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `connect`
--

CREATE TABLE `connect` (
  `signal` int(11) NOT NULL,
  `slot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `dependency`
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
-- Struttura della tabella `event_category`
--

CREATE TABLE `event_category` (
  `id_category` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `event_category`
--

INSERT INTO `event_category` (`id_category`, `name`) VALUES
(1, 'Flusso principale'),
(2, 'Scenari Alternativi'),
(3, 'Estensione'),
(4, 'Inclusione');

-- --------------------------------------------------------

--
-- Struttura della tabella `external_source`
--

CREATE TABLE `external_source` (
  `id_source` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `inherit`
--

CREATE TABLE `inherit` (
  `child` int(11) NOT NULL,
  `parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `integration_test`
--

CREATE TABLE `integration_test` (
  `id_test` int(11) NOT NULL,
  `id_package` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `method`
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

-- --------------------------------------------------------

--
-- Struttura della tabella `package`
--

CREATE TABLE `package` (
  `id_package` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `virtual` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `package_requirement`
--

CREATE TABLE `package_requirement` (
  `id_requirement` int(11) NOT NULL,
  `id_package` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `requirement`
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
-- Struttura della tabella `requirement_category`
--

CREATE TABLE `requirement_category` (
  `id_category` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `latex_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `requirement_category`
--

INSERT INTO `requirement_category` (`id_category`, `name`, `latex_name`) VALUES
(1, 'Funzionale', 'Funzionale'),
(2, 'Qualità', 'Qualitativo'),
(3, 'Prestazionali', 'Prestazionale'),
(4, 'Vincolo', 'Vincolo');

-- --------------------------------------------------------

--
-- Struttura della tabella `requirement_priority`
--

CREATE TABLE `requirement_priority` (
  `id_priority` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `requirement_priority`
--

INSERT INTO `requirement_priority` (`id_priority`, `name`) VALUES
(1, 'Obbligatorio'),
(2, 'Opzionale'),
(3, 'Desiderabile');

-- --------------------------------------------------------

--
-- Struttura della tabella `requirement_validation`
--

CREATE TABLE `requirement_validation` (
  `id_validation` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `secondary_actors`
--

CREATE TABLE `secondary_actors` (
  `id_event` int(11) NOT NULL,
  `id_actor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `source`
--

CREATE TABLE `source` (
  `id_source` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `source`
--

INSERT INTO `source` (`id_source`) VALUES
(120),
(121),
(122),
(123),
(124),
(125),
(126),
(127),
(128),
(129),
(130),
(131),
(132),
(133),
(134),
(135),
(136),
(137),
(138),
(139),
(140),
(141),
(142),
(143),
(144),
(145),
(146),
(147),
(148),
(149),
(150),
(151),
(152),
(153),
(154),
(155),
(156),
(157),
(158),
(159);

-- --------------------------------------------------------

--
-- Struttura della tabella `source_requirement`
--

CREATE TABLE `source_requirement` (
  `id_source` int(11) NOT NULL,
  `id_requirement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `system_test`
--

CREATE TABLE `system_test` (
  `id_test` int(11) NOT NULL,
  `id_requirement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `test`
--

CREATE TABLE `test` (
  `id_test` int(11) NOT NULL,
  `status` enum('unimplemented','failed','success') NOT NULL DEFAULT 'unimplemented',
  `description` text NOT NULL,
  `jenkins_id` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `unit_test`
--

CREATE TABLE `unit_test` (
  `id_test` int(11) NOT NULL,
  `id_method` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `use_case`
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

--
-- Dump dei dati per la tabella `use_case`
--

INSERT INTO `use_case` (`id_use_case`, `title`, `actors`, `parent`, `gparent`, `description`, `pre`, `post`) VALUES
(2, 'Configurazione Aziendale', 'Utente con privilegi di scrittura', NULL, NULL, 'Attraverso l’interfaccia di configurazione aziendale, l’utente coi permessi corretti è in grado di visualizzare le impostazioni riguardanti la configurazione aziendale e modificarle', 'L’utente deve essersi autenticato all’applicazione, deve possedere i privilegi di configurazione aziendale e deve essere stato configurato il collegamento ad un CRM', 'Sono state visualizzate ed eventualmente modificate le associazioni tra le famiglie di prodotti e le tipologie di risorse'),
(3, 'Visualizzazione delle famiglie di prodotti presenti nel listino del CRM', 'Utente con privilegi di scrittura', 2, NULL, 'Vengono importate dal CRM le categorie di prodotti censite e mostrate all''utente', 'L''utente deve aver selezionato l''opzione per visualizzare e modificare le impostazioni riguardanti la configurazione aziendale', 'Sono state visualizzate le famiglie di prodotti'),
(4, 'Selezione della tipologie di risorsa con cui mappare ciascuna famiglia di prodotti', 'Utente con privilegi di scrittura', 2, NULL, 'Attraverso l’interfaccia di configurazione aziendale, l’utente coi permessi corretti è in grado di specificare con quale tipologia di risorsa (figura professionale, asset o servizio) dovrà essere mappata ciascuna tipologia di prodotto proveniente dal CRM', 'L’utente deve essersi autenticato all’applicazione, deve possedere i privilegi di configurazione aziendale e deve essere stato configurato il collegamento ad un CRM', 'Per almeno una famiglia di prodotto è stata modificata l’associazione ad una tipologia di risorsa. '),
(5, 'Mappatura famiglia di prodotti con figura professionale', 'Utente con privilegi di scrittura', 4, NULL, 'L''utente associa una famiglia di prodotti proveniente dal CRM con una figura professionale presente nel sistema', 'L''utente ha selezionato la voce per poter visualizzare e modificare le impostazione di configurazione aziendale', 'L''utente ha mappato una famiglia di prodotti con una figura professionale tra quelle censite nel sistema'),
(6, 'Mappatura famiglia di prodotti con gli asset aziendali', 'Utente con privilegi di scrittura', 4, NULL, 'L''utente associa una famiglia di prodotti proveniente dal CRM con un''asset aziendale presente nel sistema', 'L''utente ha selezionato la voce per poter visualizzare e modificare le impostazione di configurazione aziendale', 'L''utente ha mappato una famiglia di prodotti con un''asset aziendale tra quelli censiti nel sistema'),
(7, 'Mappatura famiglia di prodotti con i servizi', 'Utente con privilegi di scrittura', 4, NULL, 'L''utente associa una famiglia di prodotti proveniente dal CRM con uno dei servizi presenti nel sistema', 'L''utente ha selezionato la voce per poter visualizzare e modificare le impostazione di configurazione aziendale', 'L''utente ha mappato una famiglia di prodotti con uno dei servizi tra quelli censiti nel sistema'),
(8, 'Mappatura famiglia di prodotti come prodotti da vendere', 'Utente con privilegi di scrittura', 4, NULL, 'L''utente associa una famiglia di prodotti proveniente dal CRM selezionandola come prodotti da vendere', 'L''utente ha selezionato la voce per poter visualizzare e modificare le impostazione di configurazione aziendale', 'L''utente ha mappato una famiglia di prodotti selezionandola come prodotti da vendere'),
(9, 'Mappatura famiglie di prodotti aggiunte successivamente con prodotti specifici di un offerta', 'Utente con privilegi di scrittura', 2, NULL, 'Attraverso l’interfaccia di configurazione di progetto, l’utente coi permessi corretti è in grado di effettuare una mappatura just-in-time di eventuali prodotti legati all’offerta che appartengono ad una famiglia di prodotti non mappata (perché ad esempio è stata aggiunta da poco nel CRM) o che non sono associati ad una famiglia (perché magari sono prodotti associati puntualmente all’offerta', 'Precondizione: L’utente deve essersi autenticato all’applicazione, deve possedere i privilegi di configurazione di progetto, deve essere nella pagina di configurazione del progetto, deve aver selezionato il progetto e deve aver associato al progetto un’offerta che presenta prodotti con una mappatura anomala.', 'Sono state potenzialmente modificate le mappature dei prodotti'),
(10, 'Visualizzazione prodotti non associati a famiglie del CRM', 'Utente con privilegi di amministratore', 9, NULL, 'L''utente visualizza una lista con i prodotti che non sono mappati a famiglie censite sul CRM', 'L''utente ha selezionato la voce gestire le associazioni dei prodotti di un offerta che non sono ancora stati mappati', 'L''utente ha visualizzato una lista con i prodotti che non sono mappati a famiglie censite sul CRM'),
(11, 'Selezione della categoria di risorsa con cui mappare ciascun prodotto', 'Utente con privilegi di amministratore', 9, NULL, 'L''utente seleziona per ogni prodotto non mappato la categoria di risorse con cui associarlo', 'L''utente ha selezionato la voce gestire le associazioni dei prodotti di un offerta che non sono ancora stati mappati', 'Ogni prodotto che non era mappato è associato ad una categoria di risorse'),
(12, 'Visualizzazione della lista delle famiglie di prodotti non mappate', 'Utente con privilegi di amministratore', 9, NULL, 'L''utente visualizza una lista con le famiglie di prodotti che non sone mappate', 'L''utente ha selezionato la voce gestire le associazioni dei prodotti di un offerta che non sono ancora stati mappati', 'L''utente ha visualizzato una lista con tutte le famiglie di prodotti che non sono ancora mappate nel sistema'),
(13, 'Selezione della categoria di risorse per mappare le famiglie di prodotti non mappate', 'Utente con privilegi di amministratore', 9, NULL, 'L''utente assegna ad ogni famiglia di prodotti non ancora mappata una categoria di risorse', 'L''utente ha selezionato la voce gestire le associazioni dei prodotti di un offerta che non sono ancora stati mappati', 'Ogni famiglia di prodotti che non era mappato è associato ad una categoria di risorse'),
(14, 'Gestione delle anagrafiche aziendali', 'Utente con privilegi di lettura, Utente con privilegi di scrittura', NULL, NULL, 'Attraverso l’interfaccia di gestione delle anagrafiche aziendali, l’utente coi permessi corretti è in grado di visualizzare le informazioni relative alle schede di anagrafica aziendali e modificarle', 'L’utente deve essersi autenticato all’applicazione deve possedere almeno i privilegi di visualizzazione di configurazione di progetto. Non è necessario che l’applicazione sia collegata ad un CRM', 'Sono state visualizzate ed eventualmente modificate le anagrafiche aziendali'),
(120, 'Visualizzazione errore cambio mappatura famiglia', 'Utente con privilegi di scrittura', 2, NULL, 'L''utente visualizza un messaggio d''errore se tenta di cambiare la mappatura di una famiglia di prodotti dopo che sono stati già importati i prodotti di quella famiglia', 'L''utente tenta di cambiare la mappatura di una famiglia di prodotti dopo che sono stati già importati i prodotti di quella famiglia', 'Viene visualizzato un messaggio di errore'),
(121, 'Creazione anagrafica di un azienda', 'Utente con privilegi di scrittura', 14, NULL, 'L''utente inserisce i dati relativi ad un azienda', 'L''utente seleziona la voce per creare una nuova anagrafica aziendale', 'Viene creata l''anagrafica di una nuova azienda'),
(122, 'Selezione della tipologia della nuova azienda', 'Utente con privilegi di scrittura', 14, NULL, 'L''utente seleziona la tipologia della nuova azienda che si sta inserendo nel sistema', 'L''utete ha selezionato la voce per creare una nuova azienda (l''anagrafica relativa)', 'L''utete ha seleziona la tipologia della nuova azienda che si sta inserendo nel sistema'),
(123, 'Modifica di un anagrafica aziendale', 'Utente con privilegi di scrittura', 14, NULL, 'L''utente modifica i dati relativi ad un azienda', 'L''utente ha selezionato la voce per modificare i dati di un''azienda', 'L''utente ha modificato i dati relativi ad un azienda'),
(124, 'Gestione dei contatti relativi ad un''azienda', 'Utente con privilegi di scrittura', 14, NULL, 'Attraverso l’interfaccia di gestione delle anagrafiche aziendali, l’utente coi permessi corretti è in grado di visualizzare le informazioni sui contatti di riferimento per le diverse aziende ed eventualmente modificarle', 'L’utente deve essersi autenticato all’applicazione deve possedere almeno i privilegi di visualizzazione di configurazione di progetto. Non è necessario che l’applicazione sia collegata ad un CRM', 'Sono state visualizzate ed eventualmente modificate le informazioni relative ai contatti di riferimento per un’azienda'),
(125, 'Visualizzazione della lista delle aziende censite', 'Utente con privilegi di lettura', 14, NULL, 'L''utente visualizza una lista con tutte le aziende censite nel sistema', 'L''utente ha selezionato la voce per visualizzare la lista di tutte le aziende censite nel sistema', 'L''utente ha visualizzato la lista con tutte le aziende censite nel sistema'),
(126, 'Visualizzazione dettagli azienda censita nel sistema', 'Utente con privilegi di lettura', 14, NULL, 'L''utente vede tutti i dettagli relativi all''azienda selezionata', 'L''utente ha selezionato un azienda per vedere tutti i dettagli riguardanti la stessa', 'L''utente ha visto tutti i dettagli relativi all''azienda selezionata'),
(127, 'Visualizzazione errore creazione azienda con CRM associato', 'Utente con privilegi di scrittura', 14, NULL, 'Viene visualizzato un messaggio d''errore se si tenta creare una nuova azienda quando al sistema è collegato un CRM', 'Al sistema è collegato un CRM e l''utente tenta di creare una nuova azienda', 'L''operazione viene bloccata e viene mostrato un messaggio d''errore'),
(128, 'Visualizzazione errore modifica azienda con CRM associato', 'Utente con privilegi di scrittura', 14, NULL, 'Viene visualizzato un messaggio d''errore se si tenta modificare i dati anagrafici di un azienda quando al sistema è collegato un CRM', 'Al sistema è collegato un CRM e l''utente tenta di modificare i dati anagrafici di un azienda', 'L''operazione viene bloccata e viene mostrato un messaggio d''errore'),
(129, 'Creazione anagrafica di un contatto', 'Utente con privilegi di scrittura', 124, NULL, 'L''utente crea un nuovo contatto inserendo i dati relativi allo stesso(nome, congome, numero di telefono, email)', 'L''utente ha selezionato la voce per creare un nuovo contatto', 'Il nuovo contatto ed i suoi dati sono stati salvati nel sistema'),
(130, 'Modifica anagrafica di un contatto', 'Utente con privilegi di scrittura', 124, NULL, 'L''utente modifica un contatto cambiando i dati relativi allo stesso(nome, congome, numero di telefono, email)', 'L''utente ha selezionato la voce per modificare un contatto', 'Il contatto ed i suoi dati modificati sono stati salvati nel sistema'),
(131, 'Visualizzazione dei contatti di riferimento di un azienda', 'Utente con privilegi di lettura', 124, NULL, 'L''utente visualizza i contatti di riferimento dell''azienda selezionata', 'L''utente ha selezionato la voce per visualizzare i contatti di un azienda specifica', 'Viene visualizzata una lista con tutti i contatti legati ad un azienda '),
(132, 'Visualizzazione dettagli contatto', 'Utente con privilegi di lettura', 124, NULL, 'L''utente visualizza tutti i dettagli riguardati il contatto selezionato di una determinata azienda', 'L''utente ha selezionato il contatto di cui desidera vedere tutti i dettagli', 'Vengono mostrati tutti i dettagli riguardati il contatto selezionato'),
(133, 'Visualizzazione errore creazione conttato con CRM collegato', 'Utente con privilegi di scrittura', 124, NULL, 'Viene mostrato un messaggio d''errore se si tenta di creare un nuovo contatto per un azienda collegata ad un CRM', 'L''utente tenta di creare un nuovo contatto di un''azienda collegata con un CRM', 'L''operazione viene bloccata e viene mostrato un messaggio d''errore'),
(134, 'Visualizzazione errore modifica conttato con CRM collegato', 'Utente con privilegi di scrittura', 124, NULL, 'Viene mostrato un messaggio d''errore se si tenta di modificare i dati di un contatto di un azienda collegata con un CRM', 'L''utente tenta di modificare un contatto di un''azienda collegata con un CRM', 'L''operazione viene bloccata e viene mostrato un messaggio d''errore'),
(135, 'Gestione dei progetti', 'Utente con privilegi di lettura, Utente con privilegi di scrittura', NULL, NULL, 'Attraverso l’interfaccia di configurazione di progetto, l’utente coi permessi corretti è in grado di modificare le informazioni di progetto ', 'L’utente deve :essersi autenticato all’applicazione, possedere almeno i privilegi di visualizzazione di configurazione di progetto, essere nella pagina di configurazione del progetto, aver selezionato il progetto, il tipo del progetto non deve essere Interno.\r\nÈ necessario che l’applicazione sia collegata ad un CRM per quanto riguarda la parte relativa alle offerte', 'Sono modificate le informazioni relative ad un progetto. '),
(136, 'Associazione di un commerciale ad un progetto', 'Utente con privilegi di scrittura', 135, NULL, 'L''utente associa una figura commerciale al progetto selezionato', 'L''utente ha selezionato la voce per aggiungere un commerciale al progetto selezionato', 'Viene associato un commerciale al progetto selezionato'),
(137, 'Associazione di un''azienda cliente al progetto', 'Utente con privilegi di scrittura', 135, NULL, 'L''utente associa un azienda cliente al progetto selezionato (l''azienda cliente può essere anche provenire da un CRM o direttamente essere stata inserita nel sistema)', 'L''utente ha selezionato la voce per associare un azienda cliente al progetto', 'Viene associata un azienda cliente al progetto'),
(138, 'Associazione offerte libere', 'Utente con privilegi di scrittura', 135, NULL, 'L''utente associa una o più offerte libere al progetto selezionato', 'L''utente associa una o più offerte libere al progetto selezionato', 'E'' stata associata almeno un offerta libera al progetto'),
(139, 'Gestione del contatto principale del progetto', 'Utente con privilegi di scrittura', 135, NULL, 'Attraverso l’interfaccia di configurazione di progetto, l’utente coi permessi corretti è in grado di modificare le informazioni relative al contatto principale di riferimento per un progetto (il PM lato cliente)', 'L''utente ha selezionato la voce per gestire il contatto principle del progetto', 'Sono state modificate le informazioni relative al contatto principale di riferimento per un progetto '),
(140, 'Creazione nuovo progetto da offerta', 'Utente con privilegi di scrittura', 135, NULL, 'L''utente crea un progetto a partire dai dati di una specifica offerta, autocompletando quindi l''associacione tra progetto con account, offerta e contatto', 'L''utente selezionata la voce per creare un nuovo progetto partendo da un offerta esistente', 'Viene creato un nuovo progetto'),
(141, 'Visualizzazione offerte di un azienda non associate a progetti', 'Utente con privilegi di lettura', 135, NULL, 'L''utente visualizza la lista delle offerte libere di una specifica azienda cliente non ancora associate ad alcun progetto', 'L''utente seleziona la voce per visualizzare tutte le offerte libere di un cliente non ancora associate a progetti', 'L''utente visualizza la lista con tutte le offerte libere di un''azienda non associate ad alcun progetto'),
(142, 'Visualizzazione dettagli delle offerte legate al progetto', 'Utente con privilegi di lettura', 135, NULL, 'L''utente visualizza tutti i dettagli dell''offerta selezionata collegate al progetto', 'L''utente seleziona la voce per visualizzare i dettagli di un''offerte collegate al progetto', 'Vengono visualizzati tutti i dettagli di una specifica offerta'),
(143, 'Visualizzazione offerte libere', 'Utente con privilegi di lettura', 135, NULL, 'L''utente visualizza una lista contenente tutte le offerte libere ', 'L''utente ha selezionato la voce per visualizzare tutte le offerte libere', 'Vengono visualizze tutte le offerte libere'),
(144, 'Visualizzazione alert utente dell''offerta non censito', 'Utente con privilegi di scrittura', 135, NULL, 'Viene visualizzato un alert nel caso in cui l''utente che ha effettuato l''offerta nel CRM non è censito su ADProject', 'L''utente associa un offerta ad un progetto ', 'Viene visualizzato un messaggio di alert'),
(145, 'Visualizzazione alert account aziendale non censito', 'Utente con privilegi di scrittura', 135, NULL, 'Viene visualizzato un messaggio di alert nel caso in cui l''accaunt dell''azienda cliente associata all''offerta non è censito su ADProject', 'L''utente associa un offerta ad un progetto ', 'Viene visualizzato un messaggio di alert'),
(146, 'Visualizzazione alert offerta con prodotti con famiglie non censite', 'Utente con privilegi di scrittura', 135, NULL, 'L''utente visualizza un messaggio di alert nel caso in cui l''offerta che si sta andando a mappare contiene prodotti legati a famiglie non censite su ADProject o non associati ad alcuna famiglia', 'L''utente associa un offerta ad un progetto ', 'Viene visualizzato un messaggio di alert'),
(147, 'Visualizzazione errore account non ancora selezionato', 'Utente con privilegi di scrittura', 135, NULL, 'L''utente visualizza un messaggio d''errore quando si tenta di aggiungere un contatto principale prima di aver associato un''azienda cliente al progetto', 'L''utente ha selezionato la voce per aggiungere un contatto principale di un azienda, prima di aver selezionato l''azienda cliente', 'L''azione viene bloccata e viene visualizzato un messaggio d''errore'),
(148, 'Selezione del contatto associato all''azienda cliente del progetto', 'Utente con privilegi di scrittura', 139, NULL, 'L''utente seleziona il contatto tra i referenti dell''azienda cliente da assegnare come principale nel progetto selezionato', 'L''utente ha selezionato la voce per gestire i contatti dell''azienda cliente per il progetto', 'E'' stato selezionato un contatto principale per l''azienda'),
(149, 'Inserimento nuovo contatto', 'Utente con privilegi di scrittura', 139, NULL, 'L''utente inserisce un nuovo contatto come referente principale dell''azienda cliente all''interno del progetto, immettendo tutti i dati necessati', 'L''utente ha selezionato la voce per inserire un nuovo contatto nel progetto', 'Il nuovo contatto è stato inserito nel sistema e assegnato al progetto selezionato come referente principale per l''azienda cliente'),
(150, 'Modifica dettagli contatto', 'Utente con privilegi di scrittura', 139, NULL, 'L''utente modifica i dati relativi ad un contatto di un referente dell''azienda cliente', 'L''utente ha selezionato la voce di modifica di un contatto dell''azienda cliente selezionata per il progetto', 'I dati del contatto sono stati modificati'),
(151, 'Visualizzazione dettagli contatto', 'Utente con privilegi di lettura', 139, NULL, 'L''utente visualizza tutti i dati relativi ad un contatto selezionato', 'L''utente ha selezionato il contatto di cui vuole visualizzare tutti i dati', 'Vengono visualizzati tutti i dati relativi ad un contatto di un azienda cliente'),
(152, 'Visualizzazione errore inserimento contatto collegato a CRM', 'Utente con privilegi di scrittura', 139, NULL, 'L''utente visualizza un messaggio di errore nel momento in cui vuole inserire un nuovo contatto di un azienda che è collegata ad un CRM', 'L''utente tenta di inserire un nuovo contatto per l''azienda ', 'L''azione viene bloccata e viene visualizzato un messaggio d''errore'),
(153, 'visualizzazione errore modifica contatto collegato ad un CRM', 'Utente con privilegi di scrittura', 139, NULL, 'L''utente visualizza un messaggio di errore nel momento in cui tenta di modificare un contatto di un azienda che è collegata ad un CRM', 'L''utente tenta di modificare un contatto per l''azienda ', 'L''azione viene bloccata e viene visualizzato un messaggio d''errore'),
(154, 'Inserimento dati di base del progetto', 'Utente con privilegi di scrittura', 140, NULL, 'L''utente inserisce i dati necessari per il progetto', 'L''utente ha selezionato la voce per creare un progetto da un offerta', 'Sono stati inseriti i dati di base di un progetto'),
(155, 'Selezione account azienda cliente', 'Utente con privilegi di scrittura', 140, NULL, 'L''utente seleziona un account cliente da associare al progetto', 'L''utente ha selezionato la voce per creare un progetto a partire da un offerta', 'Viene assegnato un account cliente al progetto'),
(156, 'Selezione offerta per la creazione del nuovo progetto', 'Utente con privilegi di scrittura', 140, NULL, 'L''utente seleziona un offerta tra quelle rese disponibili dal sistema (dopo essere state filtrate dalla selezione dell''account cliente) da cui verrà costruito il progetto', 'L''utente ha selezionato la voce per creare un nuovo progetto partendo da un offerta', 'L''offerta di partenza per creare il nuovo progetto è stata selezionata'),
(157, 'Inserimento nome progetto', 'Utente con privilegi di scrittura', 140, NULL, 'L''utente inserisce il nome per il nuovo progetto', 'L''utente sta inserendo i dati di base del progetto', 'L''utente ha inserito il nome per il nuovo progetto'),
(158, 'Inserimento descrizione progetto', 'Utente con privilegi di scrittura', 140, NULL, 'L''utente inserisce una breve descrizione testuale del progetto in creazione', 'L''utente sta inserendo i dati di base del progetto', 'L''utente ha inserito una descrizione per il progetto'),
(159, 'Selezione del Project Manager', 'Utente con privilegi di scrittura', 140, NULL, 'L''utente seleziona un Project Manager da assegnare al progetto tra quelli censiti nel sistema', 'L''utente sta inserendo i dati di base del progetto', 'L''utente ha selezionato un Project Manager da assegnare al progetto');

-- --------------------------------------------------------

--
-- Struttura della tabella `use_case_event`
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

--
-- Dump dei dati per la tabella `use_case_event`
--

INSERT INTO `use_case_event` (`id_event`, `category`, `use_case`, `description`, `refers_to`, `primary_actor`, `order`) VALUES
(5, 1, 2, 'L’utente visualizza la lista delle famiglie di prodotti presenti nel listino del CRM ', 3, 5, 1),
(6, 1, 2, 'L’utente seleziona la tipologia di risorse con cui andare a mappare ciascuna famiglia di prodotti ', 4, 5, 2),
(7, 1, 2, 'L’utente mappa eventuali famiglie di prodotti non mappate o prodotti specifici di un’offerta che non sono stati mappati ', 9, 5, 3),
(9, 1, 3, 'Attraverso una serie di chiamate Http alle API Rest esposte dal CRM vengono recuperati i dati riguardanti le famiglie di prodotti censite nel CRM', NULL, 5, 1),
(10, 1, 4, 'L’utente mappa una famiglia di prodotti con le figure professionali necessarie per un progetto ', 5, 5, 1),
(11, 1, 4, 'L’utente mappa una famiglia di prodotti con gli asset necessarie per un progetto ', 6, 5, 2),
(12, 1, 4, 'L’utente mappa una famiglia di servizi necessari per un progetto ', 7, 5, 3),
(13, 1, 4, 'L’utente mappa una famiglia di prodotti come prodotti venduti', 8, 5, 4),
(14, 1, 5, 'L''utente associa una famiglia di prodotti proveniente dal CRM con una figura professionale presente nel sistema', NULL, 5, 1),
(15, 1, 6, 'L''utente associa una famiglia di prodotti proveniente dal CRM con un''asset aziendale presente nel sistema', NULL, 5, 1),
(16, 1, 7, 'L''utente associa una famiglia di prodotti proveniente dal CRM con uno dei servizi presenti nel sistema', NULL, 5, 1),
(17, 1, 8, 'L''utente associa una famiglia di prodotti proveniente dal CRM selezionandola come prodotti da vendere', NULL, 5, 1),
(18, 1, 9, 'L’utente visualizza la lista dei prodotti non associati ad alcuna famiglia del CRM ', 10, 5, 1),
(19, 1, 9, 'L’utente seleziona la categoria di risorsa con cui mappare ciascun prodotto ', NULL, 5, 2),
(20, 1, 9, 'L’utente visualizza la lista delle famiglie di prodotti non mappate ', NULL, 5, 3),
(21, 1, 9, 'L’utente seleziona la categoria di risorsa con cui mappare ciascuna famiglia ', NULL, 5, 4),
(22, 1, 10, 'L''utente visualizza una lista con i prodotti che non sono mappati a famiglie censite sul CRM', NULL, 6, 1),
(23, 1, 11, 'L''utente seleziona per ogni prodotto non mappato la categoria di risorse con cui associarlo', NULL, 6, 2),
(24, 1, 12, 'L''utente visualizza una lista con le famiglie di prodotti che non sone mappate', NULL, 6, 1),
(25, 1, 13, 'L''utente assegna ad ogni famiglia di prodotti non ancora mappata una categoria di risorse', NULL, 6, 1),
(26, 1, 14, 'L’utente crea un’anagrafica di un’azienda ', 121, 5, 1),
(27, 1, 14, 'L’utente modifica l’anagrafica di un’azienda già censita ', 123, 5, 2),
(28, 1, 14, 'L’utente gestisce i contatti relativi ad un’azienda ', 124, 5, 3),
(29, 1, 14, 'L’utente visualizza la lista delle aziende censite nel sistema ', 125, 4, 4),
(30, 1, 14, 'L’utente visualizza i dettagli relativi ad una azienda censita nel sistema ', 126, 4, 5),
(39, 3, 4, 'L’utente visualizza un messaggio di errore se tenta di cambiare la mappatura di una famiglia dopo che sono già stati importati prodotti relativi a quella famiglia ', 120, 5, 1),
(40, 1, 120, 'L''utente visualizza un messaggio d''errore se tenta di cambiare la mappatura di una famiglia di prodotti dopo che sono stati già importati i prodotti di quella famiglia', NULL, 5, 1),
(42, 1, 121, 'L''utente inserisce i dati per creare l''anagrafica di una nuova azienda', NULL, 5, 1),
(43, 4, 121, 'L''utente seleziona la tipologia dell''azienda che si sta andando a inserire nel sistema', 122, 5, 1),
(44, 1, 122, 'L''utente seleziona la tipologia della nuova azienda che si sta inserendo nel sistema', NULL, 5, 1),
(45, 3, 121, 'Se l''utente prova a creare una nuova anagrafica aziendale quando un CRM è collegato al sistema viene visualizzato un messaggio d''errore', 127, 5, 1),
(46, 1, 123, 'L''utente modifica i dati relativi ad un azienda', NULL, 5, 1),
(48, 1, 125, 'L''utente visualizza una lista con tutte le aziende censite nel sistema', NULL, 5, 1),
(49, 1, 126, 'L''utente vede tutti i dettagli relativi all''azienda selezionata', NULL, 4, 1),
(50, 1, 127, 'Viene visualizzato un messaggio d''errore se si tenta creare una nuova azienda quando al sistema è collegato un CRM', NULL, 5, 1),
(51, 1, 128, 'Viene visualizzato un messaggio d''errore se si tenta modificare i dati anagrafici di un azienda quando al sistema è collegato un CRM', NULL, 5, 1),
(52, 3, 123, 'Se l''utente prova a modificare i dati di anagrafica aziendale quando un CRM è collegato al sistema viene visualizzato un messaggio d''errore', 128, 5, 1),
(53, 1, 124, 'L’utente crea un’anagrafica di contatto ', NULL, 5, 1),
(54, 1, 124, 'L’utente modifica l’anagrafica di un contatto già censito ', NULL, 5, 2),
(55, 1, 124, 'L’utente visualizza la lista dei contatti di riferimento per una specifica azienda ', NULL, 5, 3),
(56, 1, 124, 'L’utente visualizza i dettagli relativi ad un contatto ', NULL, 5, 4),
(57, 1, 129, 'L''utente crea un nuovo contatto inserendo i dati relativi allo stesso', NULL, 5, 1),
(58, 3, 129, 'Viene visualizzato un messaggio d''errore se si tenta di creare un nuovo contatto per un azienda cliente quando è collegato un CRM', 133, 5, 1),
(59, 1, 130, 'L''utente modifica un contatto cambiando i dati relativi allo stesso', NULL, 5, 1),
(60, 3, 130, 'Viene visualizzato un messaggio d''errore se si tenta di modificare un contatto per un azienda cliente quando è collegato un CRM', 134, 5, 1),
(61, 1, 131, 'L''utente visualizza i contatti di riferimento dell''azienda selezionata', NULL, 4, 1),
(62, 1, 132, 'L''utente visualizza tutti i dettagli riguardati il contatto selezionato di una determinata azienda', NULL, 4, 1),
(63, 1, 133, 'Viene mostrato un messaggio d''errore se si tenta di creare un nuovo contatto per un azienda collegata ad un CRM', NULL, 5, 1),
(64, 1, 134, 'Viene mostrato un messaggio d''errore se si tenta di modificare i dati di un contatto di un azienda collegata con un CRM', NULL, 5, 1),
(65, 1, 135, 'L’utente associa un commerciale ad un progetto ', 136, 5, 1),
(66, 1, 135, 'L’utente associa una delle aziende clienti censite al progetto ', 137, 5, 2),
(67, 1, 135, 'L’utente associa una o più offerte libere al progetto selezionato ', 138, 5, 3),
(68, 1, 135, 'L’utente gestisce il contatto principale di riferimento per un progetto ', 139, 5, 4),
(69, 1, 135, 'L’utente visualizza la lista delle offerte libere (non associate ad alcun progetto) relative al cliente selezionato ', 141, 4, 5),
(70, 1, 135, 'L’utente visualizza i dettagli delle offerte associate al progetto ', 142, 4, 6),
(71, 1, 135, 'L’utente visualizza la lista di tutte le offerte libere ', 143, 4, 7),
(72, 1, 135, 'L’utente può creare un progetto a partire da un’offerta ', 140, 5, 8),
(73, 1, 136, 'L''utente associa una figura commerciale al progetto selezionato', NULL, 5, 1),
(74, 1, 137, 'L''utente associa un azienda cliente al progetto selezionato (l''azienda cliente può essere anche provenire da un CRM o direttamente essere stata inserita nel sistema)', NULL, 5, 1),
(75, 1, 138, 'L''utente associa una o più offerte libere al progetto selezionato', NULL, 5, 1),
(76, 3, 138, 'Viene visualizzato un alert se l''utente che ha fatto l''offerta sul CRM non è stato importato su ADProject', 144, 5, 1),
(77, 3, 138, 'Viene visualizzato un alert se l''account aziendale associato all''offerta non è stato importato su ADProject dal CRM', 145, 5, 2),
(78, 3, 138, 'Viene visualizzato un alert se si tenta di associare un offerta che contiene prodotti di una famiglia non mappata o che non appartengono a nessuna famiglia', 146, 5, 3),
(79, 1, 139, 'L’utente seleziona uno dei contatti associato al cliente selezionato per il progetto ', 148, 5, 1),
(80, 1, 139, 'L’utente inserisce un nuovo contatto ', 149, 5, 2),
(81, 1, 139, 'L’utente modifica i dettagli relativi al contatto di riferimento per il progetto ', 150, 5, 3),
(82, 1, 139, 'L’utente visualizza i dettagli relativi al contatto inserito ', 151, 5, 4),
(84, 3, 139, 'Viene visualizzato un messaggio d''errore se si tenta di aggiungere un contatto principale prima che sia associato un''azienda cliente al progetto', 147, 5, 1),
(85, 1, 141, 'L''utente visualizza la lista delle offerte libere di una specifica azienda cliente non ancora associate ad alcun progetto', NULL, 4, 1),
(86, 1, 140, 'L’utente inserisce i dati di base del progetto ', 154, 5, 1),
(90, 1, 140, 'L’utente selezione il cliente su cui filtrare le offerte ', 155, 5, 2),
(91, 1, 140, 'L’utente seleziona l’offerta da cui creare il nuovo progetto ', 156, 5, 3),
(92, 1, 142, 'L''utente visualizza tutti i dettagli delle offerte collegate al progetto', NULL, 4, 1),
(93, 1, 143, 'L''utente visualizza una lista contenente tutte le offerte libere ', NULL, 4, 1),
(94, 1, 144, 'Viene visualizzato un alert nel caso in cui l''utente che ha effettuato l''offerta nel CRM non è censito su ADProject', NULL, 5, 1),
(95, 1, 145, 'Viene visualizzato un messaggio di alert nel caso in cui l''accaunt dell''azienda cliente associata all''offerta non è censito su ADProject', NULL, 5, 1),
(96, 1, 146, 'L''utente visualizza un messaggio di alert nel caso in cui l''offerta che si sta andando a mappare contiene prodotti legati a famiglie non censite su ADProject o non associati ad alcuna famiglia', NULL, 5, 1),
(97, 1, 148, 'L''utente seleziona il contatto tra i referenti dell''azienda cliente da assegnare come principale nel progetto selezionato', NULL, 5, 1),
(98, 1, 149, 'L''utente inserisce un nuovo contatto come referente principale dell''azienda cliente all''interno del progetto, immettendo tutti i dati necessati', NULL, 5, 1),
(99, 3, 149, 'Viene visualizzato un messaggio d''errore nel caso in cui si tenta di creare un nuovo contatto quando l''azienda cliente è collegata ad un CRM', 152, 5, 1),
(100, 1, 150, 'L''utente modifica i dati relativi ad un contatto di un referente dell''azienda cliente', NULL, 5, 1),
(101, 3, 150, 'L''utente visualizza un messaggio d''errore se tenta di modificare i dati di un contatto appartenente ad un azienda cliente legata ad un CRM', 153, 5, 1),
(102, 1, 151, 'L''utente visualizza tutti i dati relativi ad un contatto selezionato', NULL, 4, 1),
(103, 1, 152, 'L''utente visualizza un messaggio di errore nel momento in cui vuole inserire un nuovo contatto di un azienda che è collegata ad un CRM', NULL, 5, 1),
(104, 1, 153, 'L''utente visualizza un messaggio di errore nel momento in cui tenta di modificare un contatto di un azienda che è collegata ad un CRM', NULL, 5, 1),
(105, 1, 154, 'L''utente inserisce i dati necessari per il progetto', NULL, 5, 1),
(106, 4, 154, 'Inserimento nome progetto', 157, 5, 1),
(107, 4, 154, 'Inserimento descrizione progetto', 158, 5, 2),
(108, 4, 154, 'Inserimento di un Project Manager per il progetto', 159, 5, 3),
(109, 1, 155, 'L''utente seleziona un account cliente da associare al progetto', NULL, 5, 1),
(110, 1, 156, 'L''utente seleziona un offerta tra quelle rese disponibili dal sistema (dopo essere state filtrate dalla selezione dell''account cliente) da cui verrà costruito il progetto', NULL, 5, 1),
(111, 1, 157, 'L''utente inserisce il nome per il nuovo progetto', NULL, 5, 1),
(112, 1, 158, 'L''utente inserisce una breve descrizione testuale del progetto in creazione', NULL, 5, 1),
(113, 1, 159, 'L''utente seleziona un Project Manager da assegnare al progetto tra quelli censiti nel sistema', NULL, 5, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `validation_test`
--

CREATE TABLE `validation_test` (
  `id_test` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `id_requirement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id_actor`),
  ADD KEY `parent` (`parent`);

--
-- Indici per le tabelle `argument`
--
ALTER TABLE `argument`
  ADD PRIMARY KEY (`id_argument`),
  ADD KEY `fk_argument_method1` (`id_method`);

--
-- Indici per le tabelle `association`
--
ALTER TABLE `association`
  ADD PRIMARY KEY (`id_association`),
  ADD KEY `fk_association_class1` (`class_from`),
  ADD KEY `fk_association_class2` (`class_to`),
  ADD KEY `fk_association_attribute1` (`id_attribute`);

--
-- Indici per le tabelle `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id_attribute`),
  ADD KEY `fk_attribute_method1` (`id_class`);

--
-- Indici per le tabelle `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id_class`),
  ADD KEY `id_package` (`id_package`);

--
-- Indici per le tabelle `class_requirement`
--
ALTER TABLE `class_requirement`
  ADD PRIMARY KEY (`id_requirement`,`id_class`),
  ADD KEY `fk_requirement_has_class_class1` (`id_class`),
  ADD KEY `fk_requirement_has_class_requirement1` (`id_requirement`);

--
-- Indici per le tabelle `connect`
--
ALTER TABLE `connect`
  ADD PRIMARY KEY (`signal`,`slot`),
  ADD KEY `fk_method_has_method_method2` (`slot`),
  ADD KEY `fk_method_has_method_method1` (`signal`);

--
-- Indici per le tabelle `dependency`
--
ALTER TABLE `dependency`
  ADD PRIMARY KEY (`id_dependency`),
  ADD KEY `fk_dependency_class1` (`id_from`),
  ADD KEY `fk_dependency_class2` (`id_to`);

--
-- Indici per le tabelle `event_category`
--
ALTER TABLE `event_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indici per le tabelle `external_source`
--
ALTER TABLE `external_source`
  ADD PRIMARY KEY (`id_source`),
  ADD KEY `fk_external_source_source1` (`id_source`);

--
-- Indici per le tabelle `inherit`
--
ALTER TABLE `inherit`
  ADD PRIMARY KEY (`child`,`parent`),
  ADD KEY `fk_class_has_class_class2` (`parent`),
  ADD KEY `fk_class_has_class_class1` (`child`);

--
-- Indici per le tabelle `integration_test`
--
ALTER TABLE `integration_test`
  ADD PRIMARY KEY (`id_test`),
  ADD KEY `fk_test_has_package_package1` (`id_package`),
  ADD KEY `fk_test_has_package_test1` (`id_test`);

--
-- Indici per le tabelle `method`
--
ALTER TABLE `method`
  ADD PRIMARY KEY (`id_method`),
  ADD KEY `fk_method_class1` (`id_class`);

--
-- Indici per le tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id_package`),
  ADD KEY `parent` (`parent`);

--
-- Indici per le tabelle `package_requirement`
--
ALTER TABLE `package_requirement`
  ADD PRIMARY KEY (`id_requirement`,`id_package`),
  ADD KEY `id_package` (`id_package`);

--
-- Indici per le tabelle `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`id_requirement`),
  ADD KEY `fk_requirement_requirement_category1` (`category`),
  ADD KEY `fk_requirement_requirement1` (`parent`),
  ADD KEY `fk_requirement_1` (`priority`),
  ADD KEY `validation` (`validation`);

--
-- Indici per le tabelle `requirement_category`
--
ALTER TABLE `requirement_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indici per le tabelle `requirement_priority`
--
ALTER TABLE `requirement_priority`
  ADD PRIMARY KEY (`id_priority`);

--
-- Indici per le tabelle `requirement_validation`
--
ALTER TABLE `requirement_validation`
  ADD PRIMARY KEY (`id_validation`);

--
-- Indici per le tabelle `secondary_actors`
--
ALTER TABLE `secondary_actors`
  ADD PRIMARY KEY (`id_event`,`id_actor`),
  ADD KEY `fk_use_case_has_actor_actor1` (`id_actor`),
  ADD KEY `fk_use_case_has_actor_use_case1` (`id_event`);

--
-- Indici per le tabelle `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id_source`);

--
-- Indici per le tabelle `source_requirement`
--
ALTER TABLE `source_requirement`
  ADD PRIMARY KEY (`id_source`,`id_requirement`),
  ADD KEY `fk_source_has_requirement_requirement1` (`id_requirement`),
  ADD KEY `fk_source_has_requirement_source1` (`id_source`);

--
-- Indici per le tabelle `system_test`
--
ALTER TABLE `system_test`
  ADD PRIMARY KEY (`id_test`),
  ADD KEY `fk_test_has_requirement_requirement1` (`id_requirement`),
  ADD KEY `fk_test_has_requirement_test1` (`id_test`);

--
-- Indici per le tabelle `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id_test`);

--
-- Indici per le tabelle `unit_test`
--
ALTER TABLE `unit_test`
  ADD PRIMARY KEY (`id_test`),
  ADD KEY `fk_test_has_method_method1` (`id_method`),
  ADD KEY `fk_test_has_method_test1` (`id_test`);

--
-- Indici per le tabelle `use_case`
--
ALTER TABLE `use_case`
  ADD PRIMARY KEY (`id_use_case`),
  ADD KEY `fk_parent` (`parent`),
  ADD KEY `fk_use_case_1` (`id_use_case`),
  ADD KEY `use_case_ibfk_3` (`gparent`);

--
-- Indici per le tabelle `use_case_event`
--
ALTER TABLE `use_case_event`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `fk_use_case_event_use_case1` (`use_case`),
  ADD KEY `fk_use_case_event_actor1` (`primary_actor`),
  ADD KEY `category` (`category`),
  ADD KEY `refers_to` (`refers_to`);

--
-- Indici per le tabelle `validation_test`
--
ALTER TABLE `validation_test`
  ADD PRIMARY KEY (`id_test`),
  ADD KEY `fk_validation_test_1` (`id_test`),
  ADD KEY `fk_validation_test_validation_test1` (`parent`),
  ADD KEY `fk_validation_test_requirement1` (`id_requirement`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `actor`
--
ALTER TABLE `actor`
  MODIFY `id_actor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT per la tabella `argument`
--
ALTER TABLE `argument`
  MODIFY `id_argument` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `association`
--
ALTER TABLE `association`
  MODIFY `id_association` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id_attribute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `class`
--
ALTER TABLE `class`
  MODIFY `id_class` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT per la tabella `dependency`
--
ALTER TABLE `dependency`
  MODIFY `id_dependency` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `method`
--
ALTER TABLE `method`
  MODIFY `id_method` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `package`
--
ALTER TABLE `package`
  MODIFY `id_package` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT per la tabella `requirement`
--
ALTER TABLE `requirement`
  MODIFY `id_requirement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT per la tabella `requirement_category`
--
ALTER TABLE `requirement_category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `requirement_priority`
--
ALTER TABLE `requirement_priority`
  MODIFY `id_priority` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT per la tabella `requirement_validation`
--
ALTER TABLE `requirement_validation`
  MODIFY `id_validation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `source`
--
ALTER TABLE `source`
  MODIFY `id_source` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;
--
-- AUTO_INCREMENT per la tabella `test`
--
ALTER TABLE `test`
  MODIFY `id_test` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `use_case`
--
ALTER TABLE `use_case`
  MODIFY `id_use_case` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;
--
-- AUTO_INCREMENT per la tabella `use_case_event`
--
ALTER TABLE `use_case_event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `actor`
--
ALTER TABLE `actor`
  ADD CONSTRAINT `actor_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `actor` (`id_actor`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `argument`
--
ALTER TABLE `argument`
  ADD CONSTRAINT `argument_ibfk_1` FOREIGN KEY (`id_method`) REFERENCES `method` (`id_method`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limiti per la tabella `association`
--
ALTER TABLE `association`
  ADD CONSTRAINT `association_ibfk_1` FOREIGN KEY (`class_from`) REFERENCES `class` (`id_class`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `association_ibfk_2` FOREIGN KEY (`class_to`) REFERENCES `class` (`id_class`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `association_ibfk_3` FOREIGN KEY (`id_attribute`) REFERENCES `attribute` (`id_attribute`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limiti per la tabella `attribute`
--
ALTER TABLE `attribute`
  ADD CONSTRAINT `fk_attribute_method1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`id_package`) REFERENCES `package` (`id_package`);

--
-- Limiti per la tabella `class_requirement`
--
ALTER TABLE `class_requirement`
  ADD CONSTRAINT `fk_requirement_has_class_class1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requirement_has_class_requirement1` FOREIGN KEY (`id_requirement`) REFERENCES `requirement` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `connect`
--
ALTER TABLE `connect`
  ADD CONSTRAINT `fk_method_has_method_method1` FOREIGN KEY (`signal`) REFERENCES `method` (`id_method`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_method_has_method_method2` FOREIGN KEY (`slot`) REFERENCES `method` (`id_method`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `dependency`
--
ALTER TABLE `dependency`
  ADD CONSTRAINT `fk_dependency_class1` FOREIGN KEY (`id_from`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dependency_class2` FOREIGN KEY (`id_to`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `external_source`
--
ALTER TABLE `external_source`
  ADD CONSTRAINT `fk_external_source_source1` FOREIGN KEY (`id_source`) REFERENCES `source` (`id_source`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `inherit`
--
ALTER TABLE `inherit`
  ADD CONSTRAINT `fk_class_has_class_class1` FOREIGN KEY (`child`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_class_has_class_class2` FOREIGN KEY (`parent`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `integration_test`
--
ALTER TABLE `integration_test`
  ADD CONSTRAINT `fk_test_has_package_package1` FOREIGN KEY (`id_package`) REFERENCES `package` (`id_package`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_test_has_package_test1` FOREIGN KEY (`id_test`) REFERENCES `test` (`id_test`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `method`
--
ALTER TABLE `method`
  ADD CONSTRAINT `fk_method_class1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `package` (`id_package`);

--
-- Limiti per la tabella `package_requirement`
--
ALTER TABLE `package_requirement`
  ADD CONSTRAINT `package_requirement_ibfk_1` FOREIGN KEY (`id_requirement`) REFERENCES `requirement` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `package_requirement_ibfk_2` FOREIGN KEY (`id_package`) REFERENCES `package` (`id_package`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `requirement`
--
ALTER TABLE `requirement`
  ADD CONSTRAINT `fk_requirement_1` FOREIGN KEY (`priority`) REFERENCES `requirement_priority` (`id_priority`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requirement_requirement1` FOREIGN KEY (`parent`) REFERENCES `requirement` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requirement_requirement_category1` FOREIGN KEY (`category`) REFERENCES `requirement_category` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`validation`) REFERENCES `requirement_validation` (`id_validation`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Limiti per la tabella `secondary_actors`
--
ALTER TABLE `secondary_actors`
  ADD CONSTRAINT `fk_use_case_has_actor_actor1` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id_actor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_use_case_has_actor_use_case1` FOREIGN KEY (`id_event`) REFERENCES `use_case_event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `source_requirement`
--
ALTER TABLE `source_requirement`
  ADD CONSTRAINT `fk_source_has_requirement_requirement1` FOREIGN KEY (`id_requirement`) REFERENCES `requirement` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_source_has_requirement_source1` FOREIGN KEY (`id_source`) REFERENCES `source` (`id_source`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `system_test`
--
ALTER TABLE `system_test`
  ADD CONSTRAINT `fk_test_has_requirement_requirement1` FOREIGN KEY (`id_requirement`) REFERENCES `requirement` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_test_has_requirement_test1` FOREIGN KEY (`id_test`) REFERENCES `test` (`id_test`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `unit_test`
--
ALTER TABLE `unit_test`
  ADD CONSTRAINT `fk_test_has_method_method1` FOREIGN KEY (`id_method`) REFERENCES `method` (`id_method`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_test_has_method_test1` FOREIGN KEY (`id_test`) REFERENCES `test` (`id_test`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `use_case`
--
ALTER TABLE `use_case`
  ADD CONSTRAINT `use_case_ibfk_2` FOREIGN KEY (`parent`) REFERENCES `use_case` (`id_use_case`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `use_case_ibfk_3` FOREIGN KEY (`gparent`) REFERENCES `use_case` (`id_use_case`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `use_case_event`
--
ALTER TABLE `use_case_event`
  ADD CONSTRAINT `fk_use_case_event_actor1` FOREIGN KEY (`primary_actor`) REFERENCES `actor` (`id_actor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_use_case_event_use_case1` FOREIGN KEY (`use_case`) REFERENCES `use_case` (`id_use_case`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `use_case_event_ibfk_1` FOREIGN KEY (`category`) REFERENCES `event_category` (`id_category`) ON UPDATE CASCADE,
  ADD CONSTRAINT `use_case_event_ibfk_3` FOREIGN KEY (`refers_to`) REFERENCES `use_case` (`id_use_case`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `validation_test`
--
ALTER TABLE `validation_test`
  ADD CONSTRAINT `fk_validation_test_1` FOREIGN KEY (`id_test`) REFERENCES `test` (`id_test`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_validation_test_requirement1` FOREIGN KEY (`id_requirement`) REFERENCES `requirement` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_validation_test_validation_test1` FOREIGN KEY (`parent`) REFERENCES `validation_test` (`id_test`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
