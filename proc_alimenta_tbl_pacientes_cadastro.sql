--USE AGE_SOC
CREATE PROCEDURE dbo.proc_alimenta_tbl_pacientes_cadastro   
    
@p VARCHAR(1),--Parâmetro de Instrução Java (U/I)  
@id INT =NULL,--chave primaria  
@c1 VARCHAR(255),--nome/sobrenome    
@c2 VARCHAR(11), --cpf    
@msg_retorno VARCHAR(255) =NULL  
  
    
AS    
    
/*     
Parâmetros Java @p: U=Update/I=Insert    
DEBUG:  
  
DECLARE @p varchar(1) = 'I'  
DECLARE @id INT = NULL  
DECLARE @C1 VARCHAR(255) = 'JoséMary'  
DECLARE @C2 VARCHAR(11) = '123321111'  
DECLARE @msg_retorno VARCHAR(255) =NULL  
--*/    
    
    
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED    
    
--Extrai base de clientes para validação e ordenação    
    
DROP TABLE IF EXISTS #tmp_clientes   
  
SELECT   
    id_paciente,  
    nome_sobrenome,   
    cpf,   
    NULL as id_ord,  
    ativo   
      
    INTO #tmp_clientes   
    FROM AGE_SOC.dbo.tbl_pacientes_cadastro;    
    
    
IF (    
 @c1 IN (select distinct nome_sobrenome from #tmp_clientes where id_paciente <> @id)     
 OR    
 @c2 IN (select distinct cpf from #tmp_clientes where id_paciente <> @id)    
 )    
    
 BEGIN    
  SET @msg_retorno = 'Revisar informações: Nome ou CPF já cadastrados em sistema.'    
  SET @p = NULL  
 END    
    
  
-----------------------------------------  
IF (@p = 'I')--Insert  
    
BEGIN    
     
  INSERT INTO #tmp_clientes (nome_sobrenome, cpf, ativo)    
  SELECT @c1, @c2, 1    
  
  
  --Reclassifica ordenação em tmp  
  UPDATE #tmp_clientes  
  SET id_ord = a.id_ord  
  FROM #tmp_clientes t   
  INNER JOIN(select cpf, ROW_NUMBER() OVER (ORDER BY nome_sobrenome) as id_ord from #tmp_clientes)a  
  on a.cpf = t.cpf  
  
  
  --Insere novo registro na tbl física  
  INSERT INTO AGE_SOC.dbo.tbl_pacientes_cadastro (nome_sobrenome, cpf, ativo)  
  SELECT nome_sobrenome, cpf, ativo from #tmp_clientes WHERE cpf = @c2  
     
  
  --Atualiza info de ordenação em tbl física  
  UPDATE AGE_SOC.dbo.tbl_pacientes_cadastro  
  SET id_ord = tmp.id_ord  
  FROM AGE_SOC.dbo.tbl_pacientes_cadastro pc  
  INNER JOIN #tmp_clientes tmp ON tmp.cpf = pc.cpf  
  
  
  SET @msg_retorno = 'Paciente cadastrado com sucesso!'    
  SET @p = NULL   
 END    
  
-----------------------------------------  
IF (@p = 'U')--Update  
    
BEGIN    
     
  UPDATE #tmp_clientes     
  SET nome_sobrenome = @c1,   
   cpf = @c2    
   
  where id_paciente = @id  
  
   --Reclassifica ordenação em tmp  
  UPDATE #tmp_clientes  
  SET id_ord = a.id_ord  
  FROM #tmp_clientes t   
  INNER JOIN(select cpf, ROW_NUMBER() OVER (ORDER BY nome_sobrenome) as id_ord from #tmp_clientes)a  
  on a.cpf = t.cpf  
  
 --Atualiza tbl física  
  UPDATE AGE_SOC.dbo.tbl_pacientes_cadastro  
  SET nome_sobrenome = t.nome_sobrenome,  
   cpf = t.cpf  
  FROM AGE_SOC.dbo.tbl_pacientes_cadastro pc  
  INNER JOIN #tmp_clientes t ON t.id_paciente = pc.id_paciente  
  
 --Atualiza info de ordenação em tbl física  
  UPDATE AGE_SOC.dbo.tbl_pacientes_cadastro  
  SET id_ord = tmp.id_ord  
  FROM AGE_SOC.dbo.tbl_pacientes_cadastro pc  
  INNER JOIN #tmp_clientes tmp ON tmp.cpf = pc.cpf  
     
  SET @msg_retorno = 'Paciente atualizado com sucesso!'    
  SET @p = NULL   
 END    
  
  
    
SELECT @msg_retorno as msg_retorno;    
---------------------------------------------    
    