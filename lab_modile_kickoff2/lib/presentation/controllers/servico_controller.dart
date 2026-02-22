import 'package:flutter/material.dart';
import '../../domain/models/servico.dart';
import '../../domain/repositories/servico_repository.dart';

class ServicoController extends ChangeNotifier {
  final ServicoRepository repository;

  List<Servico> servicos = [];

  ServicoController(this.repository);

  void carregar() {
    servicos = repository.getAll();
    notifyListeners();
  }

  void criar(String titulo, String descricao) {
    final novo = Servico(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      titulo: titulo,
      descricao: descricao,
    );
    repository.add(novo);
    carregar();
  }

  void editar(String id, String titulo, String descricao) {
    final atualizado = Servico(
      id: id,
      titulo: titulo,
      descricao: descricao,
    );
    repository.update(atualizado);
    carregar();
  }

  void remover(String id) {
    repository.delete(id);
    carregar();
  }
}