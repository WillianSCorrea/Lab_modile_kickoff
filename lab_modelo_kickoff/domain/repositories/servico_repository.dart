import '../Servico.dart';

abstract class ServicoRepository {
  List<Servico> obterTodos();
  void adicionar(Servico servico);
}