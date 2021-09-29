-----------------
-- Projeto
--
-----------------
CREATE TABLE AGE_SOC.dbo.tbl_historico_exames(

id_historico BIGINT IDENTITY PRIMARY KEY,
id_paciente INT,
desc_exame VARCHAR(255),
data_exame DATE,
desc_obs VARCHAR(255));

-------------------
CREATE TABLE AGE_SOC.dbo.tbl_pacientes_cadastro(

id_paciente BIGINT IDENTITY PRIMARY KEY,
nome_sobrenome VARCHAR(255),
cpf VARCHAR(255),
id_ord INT,
ativo BIT,
);
-------------------
