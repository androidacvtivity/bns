CREATE TABLE `registru_19_06_2017_test2` (
  `IDNO` bigint(50) DEFAULT NULL,
  `DATA_REG` date DEFAULT NULL,
  `DEN_COM` varchar(1024) DEFAULT NULL,
  `FORMA_ORG` varchar(1024) DEFAULT NULL,
  `ADRESA` varchar(1024) DEFAULT NULL,
  `LIST_COND` varchar(1024) DEFAULT NULL,
  `LISTA_FOND` longtext,
  `GEN_ACT_NE_LIC` varchar(1024) DEFAULT NULL,
  `GEN_ACT_LIC` varchar(1024) DEFAULT NULL,
  `STATUTUL` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
