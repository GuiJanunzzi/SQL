--DESCREVENDO UMA TABELA(MOSTRANDO OS DADOS DELA)
DESCRIBE T_SIP_DEPTO;

--INSERINDO DADOS DENTRO DE UMA TABELA
INSERT INTO t_sip_depto (CD_DEPTO,NM_DEPTO,SG_DEPTO)
VALUES (1, 'FINANCEIRO','FIN');

--INSERINDO DADOS DENTRO DE UMA TABELA
INSERT INTO T_SIP_DEPTO (CD_DEPTO,NM_DEPTO,SG_DEPTO) VALUES (2, 'TI','TI');

--SALVAR O QUE FOI FEITO, SE N�O FIZER ISSO QUANDO FECHAR E ABRIR OS DADOS N�O SER�O SALVOS
COMMIT;

--DESCREVENDO UMA TABELA(MOSTRANDO OS DADOS DELA) AQUI DE FORMA ABREVIADA "DESC"
DESC T_SIP_PROJETO;

--ALTERANDO O NOME QUE ESTAVA ERRADO
ALTER TABLE T_SIP_PROJETO RENAME COLUMN DT_INCIIO TO DT_INICIO;

--DESCREVENDO UMA TABELA(MOSTRANDO OS DADOS DELA) AQUI DE FORMA ABREVIADA "DESC"
DESC T_SIP_PROJETO;

--INSERINDO DADOS DENTRO DE UMA TABELA
INSERT INTO T_SIP_PROJETO (CD_PROJETO, NM_PROJETO, DT_INICIO, DT_TERMINO) 
VALUES (1, 'FIAP-1TDSPO', '10-SEP-2024', '12-SEP-2024');

--IDENTIFICANDO O FORMATO DE DATA DO SISTEMA 
SELECT SYSDATE FROM DUAL;

--CONFERINDO OS DADOS DA TABELA
SELECT * FROM T_SIP_PROJETO;

--INSERINDO DADOS DENTRO DE UMA TABELA AGORA PASSANDO A DATA DE UMA FORMA QUE VAI FUNCIONAR NO BANCO IDEPENDENTE DO SEU IDIOMA
INSERT INTO T_SIP_PROJETO (CD_PROJETO, NM_PROJETO, DT_INICIO, DT_TERMINO)
VALUES (2, 'FIAP-1TDSPO-2', TO_DATE('10-09-2022','DD-MM-YYYY'), TO_DATE('05-06-2024','DD-MM-YYYY'));

--INSERINDO DADOS DENTRO DE UMA TABELA SEM OS NOMES DAS COLUNAS ANTES(PQ PODE) E COMO NULL O CAMPO QUE N�O � OBRIGAT�RIO
INSERT INTO T_SIP_PROJETO VALUES (3, 'FIAP-1TDSPO-3', TO_DATE('10-09-2023','DD-MM-YYYY'), NULL);

--INSERINDO DADOS DENTRO DE UMA TABELA COM OS NOMES DAS COLUNAS MAS SEM O CAMPO QUE N�O � OBRIGAT�RIO
INSERT INTO T_SIP_PROJETO (CD_PROJETO, NM_PROJETO, DT_INICIO)
VALUES (4, 'FIAP-1TDSPO-4', TO_DATE('10-09-2019','DD-MM-YYYY'));

--CRIANDO UMA TABELA COPIA 
--EX01
--PASSO 01
CREATE TABLE T_COPY_SIP_PROJETO AS
SELECT * FROM T_SIP_PROJETO WHERE 1=2;
--PASSO 02
INSERT INTO T_COPY_SIP_PROJETO (CD_PROJETO, NM_PROJETO, DT_INICIO, DT_TERMINO)
--FAZENDO O SELECT UTILIZANDO OS NOMES DE CADA COLUNA(PQ SIM) E SELECIONANDO APENAS OS QUE OS DADOS EST�O NULL
SELECT CD_PROJETO, NM_PROJETO, DT_INICIO, DT_TERMINO
    FROM T_SIP_PROJETO
    WHERE DT_TERMINO IS NULL;

--CONFERINDO OS DADOS DA TABELA COPIA
SELECT * FROM T_COPY_SIP_PROJETO;

--EX02
--OUTRA FORMA DE INSERIR
INSERT INTO T_COPY_SIP_PROJETO
(SELECT *
    FROM T_SIP_PROJETO
    WHERE DT_TERMINO IS NOT NULL);

--CONFERINDO OS NOVOS DADOS DA TABELA COPIA
SELECT * FROM T_COPY_SIP_PROJETO;

--ATUALIZANDO DADOS DA TABELA, NO CASO DA TABELA 3 ATUALIZANDO A DATA
UPDATE T_SIP_PROJETO SET DT_TERMINO = TO_DATE('10-09-2024', 'DD/MM/YYYY')
WHERE CD_PROJETO = 3;
--MOSTRANDO OS DADOS ATUALIZADOS
SELECT * FROM T_SIP_PROJETO;

--ATUALIZANDO A TABELA COM BASE NO DADO DE UMA COLUNA
UPDATE T_SIP_PROJETO SET DT_TERMINO = (SELECT DT_TERMINO
                                        FROM T_SIP_PROJETO
                                        WHERE CD_PROJETO =2);
--MOSTRANDO OS DADOS ATUALIZADOS
SELECT * FROM T_SIP_PROJETO;

--ATUALIZANDO A TABELA COM BASE NO CODIGO
UPDATE T_SIP_PROJETO SET DT_TERMINO = NULL
WHERE CD_PROJETO > 2;
--MOSTRANDO OS DADOS ATUALIZADOS
SELECT * FROM T_SIP_PROJETO;

--DELETANDO DADOS DA TABELA
DELETE FROM T_SIP_PROJETO;
--MOSTRANDO OS DADOS ATUALIZADOS
SELECT * FROM T_SIP_PROJETO;

--VOLTANDO ATRAS NO DELETE
ROLLBACK;
--MOSTRANDO OS DADOS ATUALIZADOS
SELECT * FROM T_SIP_PROJETO;

--DELETANDO QUANDO O DADO FOR NULL
DELETE FROM T_SIP_PROJETO WHERE DT_TERMINO IS NULL;
--MOSTRANDO OS DADOS ATUALIZADOS
SELECT * FROM T_SIP_PROJETO;

--DELETANDO O DPTO DE TI
DELETE FROM T_SIP_DEPTO WHERE NM_DEPTO = 'TI';

--COMMITANDO
COMMIT;
--MOSTRANDO OS DADOS ATUALIZADOS
SELECT * FROM T_SIP_DEPTO;