--CRIANDO UMA TABELA
CREATE TABLE T_TESTE_DDL
(
    CD_TESTE NUMBER(3) NOT NULL,
    NM_TESTE VARCHAR(30) NOT NULL,
    DS_TESTE VARCHAR(60) NULL,
    DT_TESTE DATE NULL
);
--CHAVE PRIMARIA
ALTER TABLE T_TESTE_DDL ADD CONSTRAINT PK_TESTE_DDL PRIMARY KEY (CD_TESTE);
--CONSTRAINT UNIQUE
ALTER TABLE T_TESTE_DDL ADD CONSTRAINT UN_TESTE_DDL_NOME UNIQUE (NM_TESTE);
ALTER TABLE T_TESTE_DDL ADD CONSTRAINT UN_TESTE_DDL_DESC UNIQUE (DS_TESTE);