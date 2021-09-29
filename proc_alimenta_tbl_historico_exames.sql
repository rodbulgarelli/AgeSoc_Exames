--USE AGE_SOC

CREATE PROCEDURE dbo.proc_alimenta_tbl_historico_exames
    
@p VARCHAR(1),--Parâmetro de Instrução Java (U/I)  
@id INT =NULL,--chave primaria  
@idp INT =NULL,--fk (paciente)
@c1 VARCHAR(255),--Descr. Exame
@c2 VARCHAR(10),--Data formato DD/MM/YYYY ou DD/MM/YY
@c3 VARCHAR(255), --OBS   
@msg_retorno VARCHAR(255) =NULL  
 
    
AS    
    
/*     
Parâmetros Java @p: U=Update/I=Insert    
DEBUG:  
  
DECLARE @p varchar(1) = 'U'  
DECLARE @id INT = 10006  
DECLARE @idp INT =NULL
DECLARE @C1 VARCHAR(255) = 'Exame de S'  
DECLARE @C2 VARCHAR(10) = '12/09/2023' 
DECLARE @C3 VARCHAR(255) = 'Paciente ligará'
DECLARE @msg_retorno VARCHAR(255) =NULL  
--*/    
    
    
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED    
    
--Extrai base de clientes para validação e ordenação    
    
    
--Valida Regra de Negócio---    
IF (CAST (@c2 as DATE) <= CAST(GETDATE() as DATE)) 
    
 BEGIN    
  SET @msg_retorno = 'Revisar informações: Data menor ou igual à atual.'    
  SET @p = NULL  
 END    
-----------------------------------------  
IF (@p = 'I')--Insert  
    
BEGIN    
     
  INSERT INTO AGE_SOC.dbo.tbl_historico_exames (id_paciente, desc_exame, data_exame, desc_obs)
  SELECT @idp, @c1, CAST(@c2 as DATE), @c3 
  
  SET @msg_retorno = 'Exame cadastrado com sucesso!'    
  SET @p = NULL   
 END    
  
-----------------------------------------  
IF (@p = 'U')--Update  
    
BEGIN    
     
  UPDATE AGE_SOC.dbo.tbl_historico_exames 
  SET --id_paciente = @idp,
	  desc_exame = @c1, 
	  data_exame = isnull(try_cast(@c2 as date),'2099-12-12'), 
	  desc_obs = @c3
  FROM AGE_SOC.dbo.tbl_historico_exames
  WHERE id_historico = @id
     
  SET @msg_retorno = 'Exame atualizado com sucesso!'    
  SET @p = NULL   
 END    
  
  
    
SELECT @msg_retorno as msg_retorno;    
---------------------------------------------    
    