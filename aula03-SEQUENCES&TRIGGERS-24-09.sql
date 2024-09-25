--AULA 27-09
--SEQUENCES

-- APAGAR CASO EXISTA A TABELA
DROP TABLE T_TESTE_DDL_SEQUENCE CASCADE CONSTRAINTS;

-- CRIAR UMA TABELA PARA TESTES
CREATE TABLE T_TESTE_DDL_SEQUENCE
(
    CD_TESTE_SQ NUMBER(3) NOT NULL,
    NM_TESTE_SQ VARCHAR2(30)NOT NULL
);

-- ADICIONAR A CONSTRAINT CHAVE PRIMARIA
ALTER TABLE T_TESTE_DDL_SEQUENCE ADD CONSTRAINT PK_TESTE_DDL_SEQUENCE PRIMARY KEY (CD_TESTE_SQ);

-- APAGAR CASO EXISTA A SEQUENCE
DROP SEQUENCE SQ_TESTE_DDL_SEQUENCE;

-- CRIANDO UMA SEQUENCE
CREATE SEQUENCE SQ_TESTE_DDL_SEQUENCE
START WITH 100 --Primeiro n�mero a ser gerado
INCREMENT BY 1 --Valor do incremento (diferente de 0)
MAXVALUE 999 --Valor m�ximo da sequencia
NOCACHE --NOCACHE: sem cache
NOCYCLE; --Ap�s chegar ao limite, n�o reinicia

--REALIZANDO UM INSERT NA TABELA USANDO A SEQUENCE
INSERT INTO T_TESTE_DDL_SEQUENCE
VALUES (SQ_TESTE_DDL_SEQUENCE.NEXTVAL, 'TESTE');--RODANDO 2 VEZES

--VISUALIZANDO A TABELA
SELECT * FROM T_TESTE_DDL_SEQUENCE;

--ULTIMO VALOR ATUAL EM QUE EST� A SEQUENCE
SELECT SQ_TESTE_DDL_SEQUENCE.CURRVAL FROM DUAL;

--VISUALIZANDO OS VALORES DA SEQUENCE
SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SQ_TESTE_DDL_SEQUENCE';

--ALTERANDO A SEQUENCE
ALTER SEQUENCE SQ_TESTE_DDL_SEQUENCE
INCREMENT BY 2
MAXVALUE 900;

--VISUALIZANDO OS VALORES DA SEQUENCE
SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'SQ_TESTE_DDL_SEQUENCE';

--REALIZANDO UM INSERT NA TABELA USANDO A SEQUENCE
INSERT INTO T_TESTE_DDL_SEQUENCE
VALUES (SQ_TESTE_DDL_SEQUENCE.NEXTVAL, 'TESTE');

--VISUALIZANDO A TABELA
SELECT * FROM T_TESTE_DDL_SEQUENCE;

--DROPANDO A SEQUENCE
DROP SEQUENCE SQ_TESTE_DDL_SEQUENCE;

----------------------------------------------------
--TRIGGER
----------------------------------------------------

--CRIANDO TRIGGER
CREATE OR REPLACE TRIGGER TGR_TESTE_DDL_SEQUENCE
BEFORE INSERT ON T_TESTE_DDL_SEQUENCE
FOR EACH ROW
BEGIN
    :NEW.CD_TESTE_SQ := SQ_TESTE_DDL_SEQUENCE.NEXTVAL;
END;
/

--ULTIMO VALOR ATUAL EM QUE EST� A SEQUENCE
SELECT SQ_TESTE_DDL_SEQUENCE.CURRVAL FROM DUAL;

--REALIZANDO O INSERT PELA TRIGGER
INSERT INTO T_TESTE_DDL_SEQUENCE (NM_TESTE_SQ)
VALUES('TESTE TRIGGER');

--VISUALIZANDO A TABELA
SELECT * FROM T_TESTE_DDL_SEQUENCE;


