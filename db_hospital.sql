SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
pobytypobytypobytypobyty`plugin`
-- ----------------------------
-- Table structure for dane_logowania
-- ----------------------------
DROP TABLE IF EXISTS `dane_logowania`;
CREATE TABLE `dane_logowania`  (
  `ID_dane_logowania` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_pracownicy` int(10) UNSIGNED NULL DEFAULT NULL,
  `login` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `haslo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'concat(`login`,\'_\',year(curtime()))',
  PRIMARY KEY (`ID_dane_logowania`) USING BTREE,
  INDEX `dane_logowania_ibfk_1`(`ID_pracownicy`) USING BTREE,
  CONSTRAINT `dane_logowania_ibfk_1` FOREIGN KEY (`ID_pracownicy`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lekarze_specjalizacje
-- ----------------------------
DROP TABLE IF EXISTS `lekarze_specjalizacje`;
CREATE TABLE `lekarze_specjalizacje`  (
  `ID_lekarze` int(10) UNSIGNED NOT NULL,
  `ID_specjalizacje` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_lekarze`, `ID_specjalizacje`) USING BTREE,
  INDEX `ID_specjalizacje`(`ID_specjalizacje`) USING BTREE,
  CONSTRAINT `lekarze_specjalizacje_ibfk_2` FOREIGN KEY (`ID_specjalizacje`) REFERENCES `specjalizacje` (`ID_specjalizacje`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lekarze_specjalizacje_ibfk_3` FOREIGN KEY (`ID_lekarze`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lekarze_typy_zabiegow
-- ----------------------------
DROP TABLE IF EXISTS `lekarze_typy_zabiegow`;
CREATE TABLE `lekarze_typy_zabiegow`  (
  `ID_lekarze` int(10) UNSIGNED NOT NULL,
  `ID_typy_zabiegow` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_lekarze`, `ID_typy_zabiegow`) USING BTREE,
  INDEX `ID_zabiegi`(`ID_typy_zabiegow`) USING BTREE,
  CONSTRAINT `lekarze_typy_zabiegow_ibfk_2` FOREIGN KEY (`ID_typy_zabiegow`) REFERENCES `typy_zabiegow` (`ID_typy_zabiegow`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lekarze_typy_zabiegow_ibfk_3` FOREIGN KEY (`ID_lekarze`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for leki
-- ----------------------------
DROP TABLE IF EXISTS `leki`;
CREATE TABLE `leki`  (
  `ID_leki` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazwa_leku` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `firma` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `opis` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_leki`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oddzialy
-- ----------------------------
DROP TABLE IF EXISTS `oddzialy`;
CREATE TABLE `oddzialy`  (
  `ID_oddzialy` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazwa_oddzialu` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ID_ordynatorzy` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`ID_oddzialy`) USING BTREE,
  INDEX `oddzialy_ibfk_1`(`ID_ordynatorzy`) USING BTREE,
  CONSTRAINT `oddzialy_ibfk_1` FOREIGN KEY (`ID_ordynatorzy`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pacjenci
-- ----------------------------
DROP TABLE IF EXISTS `pacjenci`;
CREATE TABLE `pacjenci`  (
  `ID_pacjenci` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `imie` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nazwisko` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PESEL` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `telefon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `adres` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `data_urodzenia` date NULL DEFAULT NULL,
  `plec` set('kobieta','mezczyzna') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_pacjenci`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pobyty
-- ----------------------------
DROP TABLE IF EXISTS `pobyty`;
CREATE TABLE `pobyty`  (
  `ID_pobyty` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_pacjenci` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_pokoje` int(10) UNSIGNED NULL DEFAULT NULL,
  `czas_rozpoczecia` date NULL DEFAULT NULL,
  `czas_zakonczenia` date NULL DEFAULT NULL,
  PRIMARY KEY (`ID_pobyty`) USING BTREE,
  INDEX `ID_pacjent`(`ID_pacjenci`) USING BTREE,
  INDEX `ID_pokoje`(`ID_pokoje`) USING BTREE,
  CONSTRAINT `pobyty_ibfk_1` FOREIGN KEY (`ID_pacjenci`) REFERENCES `pacjenci` (`ID_pacjenci`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pobyty_ibfk_2` FOREIGN KEY (`ID_pokoje`) REFERENCES `pokoje` (`ID_pokoje`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pokoje
-- ----------------------------
DROP TABLE IF EXISTS `pokoje`;
CREATE TABLE `pokoje`  (
  `ID_pokoje` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_oddzialy` int(10) UNSIGNED NULL DEFAULT NULL,
  `czy_dostepny` tinyint(1) NULL DEFAULT NULL,
  `numer_pokoju` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_pokoje`) USING BTREE,
  INDEX `ID_oddzialy`(`ID_oddzialy`) USING BTREE,
  CONSTRAINT `pokoje_ibfk_1` FOREIGN KEY (`ID_oddzialy`) REFERENCES `oddzialy` (`ID_oddzialy`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pracownicy
-- ----------------------------
DROP TABLE IF EXISTS `pracownicy`;
CREATE TABLE `pracownicy`  (
  `ID_pracownicy` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `imie` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `nazwisko` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `stanowisko` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `data_zatrudnienia` date NULL DEFAULT NULL,
  `adres` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telefon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `wynagrodzenie brutto` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `lekarz_kontraktowy` tinyint(1) NULL DEFAULT NULL,
  `ID_oddzialy` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`ID_pracownicy`) USING BTREE,
  INDEX `imie`(`imie`) USING BTREE,
  INDEX `pracownicy_ibfk_1`(`ID_oddzialy`) USING BTREE,
  CONSTRAINT `pracownicy_ibfk_1` FOREIGN KEY (`ID_oddzialy`) REFERENCES `oddzialy` (`ID_oddzialy`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pracownicy_typy_kont
-- ----------------------------
DROP TABLE IF EXISTS `pracownicy_typy_kont`;
CREATE TABLE `pracownicy_typy_kont`  (
  `ID_pracownicy` int(10) UNSIGNED NOT NULL,
  `ID_typy_kont` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_pracownicy`, `ID_typy_kont`) USING BTREE,
  INDEX `pracownicy_typy_kont_ibfk_2`(`ID_typy_kont`) USING BTREE,
  CONSTRAINT `pracownicy_typy_kont_ibfk_1` FOREIGN KEY (`ID_pracownicy`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pracownicy_typy_kont_ibfk_2` FOREIGN KEY (`ID_typy_kont`) REFERENCES `typy_kont` (`ID_typy_kont`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recepty
-- ----------------------------
DROP TABLE IF EXISTS `recepty`;
CREATE TABLE `recepty`  (
  `ID_recepty` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_lekarze` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_pacjenci` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`ID_recepty`) USING BTREE,
  INDEX `recepty_ibfk_2`(`ID_pacjenci`) USING BTREE,
  INDEX `recepty_ibfk_3`(`ID_lekarze`) USING BTREE,
  CONSTRAINT `recepty_ibfk_2` FOREIGN KEY (`ID_pacjenci`) REFERENCES `pacjenci` (`ID_pacjenci`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recepty_ibfk_3` FOREIGN KEY (`ID_lekarze`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recepty_leki
-- ----------------------------
DROP TABLE IF EXISTS `recepty_leki`;
CREATE TABLE `recepty_leki`  (
  `ID_recepty` int(10) UNSIGNED NOT NULL,
  `ID_leki` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_recepty`, `ID_leki`) USING BTREE,
  INDEX `ID_leki`(`ID_leki`) USING BTREE,
  CONSTRAINT `recepty_leki_ibfk_1` FOREIGN KEY (`ID_recepty`) REFERENCES `recepty` (`ID_recepty`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `recepty_leki_ibfk_2` FOREIGN KEY (`ID_leki`) REFERENCES `leki` (`ID_leki`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for specjalizacje
-- ----------------------------
DROP TABLE IF EXISTS `specjalizacje`;
CREATE TABLE `specjalizacje`  (
  `ID_specjalizacje` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazwa_specjalizacji` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_specjalizacje`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for typy_kont
-- ----------------------------
DROP TABLE IF EXISTS `typy_kont`;
CREATE TABLE `typy_kont`  (
  `ID_typy_kont` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `typ_konta` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `uprawnienia` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_typy_kont`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for typy_zabiegow
-- ----------------------------
DROP TABLE IF EXISTS `typy_zabiegow`;
CREATE TABLE `typy_zabiegow`  (
  `ID_typy_zabiegow` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazwa_zabiegu` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `opis` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_typy_zabiegow`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wizyty
-- ----------------------------
DROP TABLE IF EXISTS `wizyty`;
CREATE TABLE `wizyty`  (
  `ID_wizyty` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_pacjenci` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_lekarze` int(10) UNSIGNED NULL DEFAULT NULL,
  `data` datetime NULL DEFAULT NULL,
  `zakonczono` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_wizyty`) USING BTREE,
  INDEX `ID_pacjent`(`ID_pacjenci`) USING BTREE,
  INDEX `wizyty_ibfk_2`(`ID_lekarze`) USING BTREE,
  CONSTRAINT `wizyty_ibfk_1` FOREIGN KEY (`ID_pacjenci`) REFERENCES `pacjenci` (`ID_pacjenci`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wizyty_ibfk_2` FOREIGN KEY (`ID_lekarze`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zabiegi
-- ----------------------------
DROP TABLE IF EXISTS `zabiegi`;
CREATE TABLE `zabiegi`  (
  `ID_zabiegi` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_lekarze` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_pacjenci` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_typy_zabiegow` int(11) UNSIGNED NULL DEFAULT NULL,
  `wynik` blob NULL DEFAULT NULL,
  `data_zabiegu` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID_zabiegi`) USING BTREE,
  INDEX `zabiegi_ibfk_1`(`ID_lekarze`) USING BTREE,
  INDEX `zabiegi_ibfk_2`(`ID_pacjenci`) USING BTREE,
  INDEX `zabiegi_ibfk_3`(`ID_typy_zabiegow`) USING BTREE,
  CONSTRAINT `zabiegi_ibfk_1` FOREIGN KEY (`ID_lekarze`) REFERENCES `pracownicy` (`ID_pracownicy`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zabiegi_ibfk_2` FOREIGN KEY (`ID_pacjenci`) REFERENCES `pacjenci` (`ID_pacjenci`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zabiegi_ibfk_3` FOREIGN KEY (`ID_typy_zabiegow`) REFERENCES `typy_zabiegow` (`ID_typy_zabiegow`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

