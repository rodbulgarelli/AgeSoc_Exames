-----------------------------------------
-- Projeto AgeSoc_Exames v1.0
-----------------------------------------

Desafio:

- Criar CRUD com o tema EXAMES, contendo (pelo menos): Nome Paciente, Nome Exame, Data Exame, Observação/Resultado do Exame
- Regras:
	- Data do Exame > Data Atual
	- Ordenação por Nome Paciente; Nome Exame
	- Nome do Paciente = Unique

------------------------------
Solução de Negócio
------------------------------
----------------
Lista de Exames
----------------
- Traremos a lista principal com a agenda de exames, com as opções de Editar/Excluir para cada exame;
	> Exames em D0 ou anteriores não serão exibidos, mesmo que estejam em Banco de Dados;
	> Não é possível editar data do exame para D0 ou anteriores.

- Para incluir novos exames, devemos acessar a lista de pacientes e a partir dela chamar o formulário de agendamento.
	> Não é possível cadastrar um novo exame em data D0 ou anterior.

------------------
Lista de Pacientes
------------------
- Traremos a relação de todos os pacientes ATIVOS com as opções de Editar/Inativar e Cadastrar Exame;
	> Pacientes ordenados por nome (chave de ordenação oculta);
	> Não é possível editar um paciente com o mesmo nome/cpf que outro (ativo ou inativo);
	> Não é possivel excluir definitivamente um paciente (apenas desmarcamos como "Ativo" em BD);
	> Ao inativar um paciente, não podemos cadastrar novos exames (mas podemos editar exames ativos, se houver)

- Na mesma página, também temos a opção de cadastrar novo paciente (aplicam-se mesmas restrições de Nome/CPF)
- Também conseguimos acessar à página de "Relação de Pacientes Inativos"
	> Na lista de Pacientes Inativos, temos somente a opção de reativar. Ao clicar nela, marcaremos o paciente como "Ativo" no BD

------------------
TO-DO - Melhorias
------------------
- Feedback de erros: Geramos mensagens de feedback nas Procedures de Insert/Update em BD, porém não populamos ao Front
- Incluir limitadores nos campos (caracteres/tipo de caractere)
- Criar índice/homepage
- Retorno de execuções de processos (Cadastro/Inativação/Exclusão/Edição)
- Paginação de resultados


---------------------
--BD
---------------------
Objetos BD:

dbo.view_lista_exames (v)
--> Visualização do histórico de exames por pacientes:
--+--> Filtra visualização para dados de exames a partir de D+1
--+--> Cruzamento entre tbl_historico_exames e tbl_pacientes_cadastro
-----+--> Chave id_paciente


dbo.tbl_historico_exames (h)
--> Relação de exames contendo PK(id_historico), id_paciente(fk), desc_historico, data_exame e desc_obs


dbo.proc_alimenta_tbl_historico_exames [ph]
--> Interações (Insert/Update) na tbl_historico_exames através da PK id_historico


dbo.tbl_pacientes_cadastro (c)
--> Relação de paciente contendo PK(id_paciente), nome_sobrenome, cpf, id_ord e ativo(1/0)


dbo.proc_alimenta_tbl_pacientes_cadastro [pc]
--> Interações (Insert/Update) na tbl_historico_exames através da PK id_paciente e aplicação de critérios Unique/Ordenação


Representação de relação entre objetos:

<--(v)<---(h)<--->[ph]
           ^n-1
    	   |
           |
           |
    	   |
<---------(c)<--->[pc]



--TODO (BD)
----------------
- Criar tabelas "fato" em BD para categorizar tipos de exame
- Configurar índices em BD para tratamento de ordenação (melhoria de performance) e revisar procedures
- Desvincular o campo "desc_obs" da tbl_historico_exames e criar uma tabela apartada (1-n)
