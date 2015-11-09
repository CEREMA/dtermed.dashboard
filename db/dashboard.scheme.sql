CREATE TABLE annees (
    id_year INT(11) AUTO_INCREMENT NOT NULL,
    libelle INT(11) NULL DEFAULT NULL,
    PRIMARY KEY (id_year)
) ENGINE=MyISAM COLLATE=latin1_swedish_ci;
CREATE TABLE business (
    ID INT(11) AUTO_INCREMENT NOT NULL,
    CAT_ID INT(11) NOT NULL,
    TITLE VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    _DESC VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    PRICE DOUBLE NULL DEFAULT NULL,
    DOC INT(11) NULL DEFAULT NULL,
    YEAR INT(11) NOT NULL,
    INDEX CAT_ID (CAT_ID),
    PRIMARY KEY (ID)
) ENGINE=MyISAM COLLATE=latin1_swedish_ci;
CREATE TABLE categories (
    ID INT(11) AUTO_INCREMENT NOT NULL,
    LIBELLE VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    YEAR VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
    PROFIL INT(11) NULL DEFAULT NULL,
    PRIMARY KEY (ID)
) ENGINE=MyISAM COLLATE=latin1_swedish_ci;
CREATE TABLE docs (
    docId VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'NO' NOT NULL,
    _blob LONGTEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    filename VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    type VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    size INT(11) NULL DEFAULT NULL,
    PRIMARY KEY (docId)
) ENGINE=MyISAM COLLATE=latin1_swedish_ci;
CREATE TABLE factures (
    id INT(11) AUTO_INCREMENT NOT NULL,
    prestation VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    reference VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    gim VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    etiquette VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    echeance DATE NULL DEFAULT NULL,
    marche INT(255) NOT NULL,
    numda VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    engagement VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    montant_prev DECIMAL(19, 4) NULL DEFAULT NULL,
    ej VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    nofacture VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    montant_facture DECIMAL(19, 4) NULL DEFAULT NULL,
    date_facture DATE NULL DEFAULT NULL,
    date_servicefait DATE NULL DEFAULT NULL,
    date_chorus DATE NULL DEFAULT NULL,
    commentaire LONGTEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    BES INT(11) NOT NULL DEFAULT 0,
    _BLOB TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    immoNET VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    cloture TINYINT(4) NULL DEFAULT NULL,
    PRIMARY KEY (id)
) ENGINE=MyISAM COLLATE=latin1_swedish_ci;
CREATE TABLE filtre (
    categorie INT(11) NOT NULL,
    nature INT(4) NOT NULL,
    coche TINYINT(4) NOT NULL,
    annee INT(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM COLLATE=latin1_swedish_ci;
CREATE TABLE profils (
    profil_id INT(11) AUTO_INCREMENT NOT NULL,
    profil_code INT(50) NOT NULL DEFAULT 0,
    profil_kage INT(50) NOT NULL DEFAULT 0,
    PRIMARY KEY (profil_id)
) ENGINE=MyISAM COLLATE=latin1_swedish_ci;
CREATE TABLE temp (
    prestation VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    reference VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    gim VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    etiquette VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    echeance DATE NULL DEFAULT NULL,
    marche INT(255) NOT NULL,
    numda VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    montant_prev FLOAT NULL DEFAULT NULL,
    ej VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    nofacture VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    montant_facture FLOAT NULL DEFAULT NULL,
    date_facture DATE NULL DEFAULT NULL,
    date_servicefait DATE NULL DEFAULT NULL,
    date_chorus DATE NULL DEFAULT NULL,
    commentaire LONGTEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
    DOC INT(11) NOT NULL,
    id INT(11) AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (id)
) ENGINE=MyISAM COLLATE=latin1_swedish_ci;
