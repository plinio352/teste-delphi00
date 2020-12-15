unit UConstante;

interface

const
  DEP_INCLUIR = 'insert into Dependente(Nome, IsCalculaIR, IsCalculaINSS, FuncionarioId) values(:Nome, :IsCalculaIR, :IsCalculaINSS, :FuncionarioId)';
  DEP_ALTERACAO = 'UPDATE Dependente SET Nome = :Nome, IsCalculaIR = :IsCalculaIR, IsCalculaINSS = :IsCalculaINSS, FuncionarioId = :FuncionarioId WHERE id = :id';
  DEP_EXCLUSAO = 'DELETE FROM Dependente WHERE id = :id';
  DEP_QTD = 'select COUNT(*) Qtd from Dependente where 1=1 and FuncionarioId = :FuncionarioId ';

  FUNC_INCLUIR = 'insert into Funcionario(Nome, CPF, Salario) values(:Nome, :CPF, :Salario)';
  FUNC_ALTERACAO = 'UPDATE Funcionario SET Nome = :Nome, CPF = :CPF, Salario = :Salario WHERE id = :id';
  FUNC_EXCLUSAO = 'DELETE FROM Funcionario WHERE id = :id';
  FUNC_LISTA = 'select * from Funcionario where 1=1 ';

implementation

end.
