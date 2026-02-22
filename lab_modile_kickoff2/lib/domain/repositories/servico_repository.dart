// domain/repositories/servico_repository.dart
import '../models/servico.dart';

abstract class ServicoRepository {
  List<Servico> getAll();
  void add(Servico servico);
  void update(Servico servico);
  void delete(String id);
}