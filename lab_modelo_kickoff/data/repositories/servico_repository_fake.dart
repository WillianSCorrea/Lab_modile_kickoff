import '../../domain/Servico.dart';
import '../../domain/repositories/servico_repository.dart';

class ServicoRepositoryFake implements ServicoRepository {
  final List<Servico> _servicos = [];

  @override
  List<Servico> obterTodos() {
    return _servicos;
  }

  @override
  void adicionar(Servico servico) {
    _servicos.add(servico);
  }
}
