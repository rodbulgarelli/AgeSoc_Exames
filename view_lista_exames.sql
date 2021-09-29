CREATE VIEW dbo.view_lista_exames AS  
  
  
SELECT   
  
id_historico,  
p.id_paciente,  
desc_exame,  
CONVERT(VARCHAR,CAST(data_exame AS datetime),103) as data_exame,  
desc_obs,  
p.nome_sobrenome,  
id_ord  
  
  
from dbo.tbl_historico_exames e  
INNER JOIN dbo.tbl_pacientes_cadastro p on p.id_paciente = e.id_paciente  
  
WHERE data_exame >= CAST(getdate() as date);