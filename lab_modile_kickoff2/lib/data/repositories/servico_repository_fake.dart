// data/repositories/servico_repository_fake.dart
import '../../domain/models/servico.dart';
import '../../domain/repositories/servico_repository.dart';

class ServicoRepositoryFake implements ServicoRepository {
  final List<Servico> _servicos = [
    Servico(
      id: '1',
      titulo: 'Troca de Óleo',
      descricao: 'Serviço completo de troca de óleo.',
    ),
    Servico(
      id: '2',
      titulo: 'Alinhamento',
      descricao: 'Alinhamento e balanceamento.',
    ),
  ];

  @override
  List<Servico> getAll() {
    return List.from(_servicos);
  }

  @override
  void add(Servico servico) {
    _servicos.add(servico);
  }

  @override
  void update(Servico servico) {
    final index = _servicos.indexWhere((s) => s.id == servico.id);
    if (index != -1) {
      _servicos[index] = servico;
    }
  }

  @override
  void delete(String id) {
    _servicos.removeWhere((s) => s.id == id);
  }
}
