// presentation/pages/servico_list_page.dart
import 'package:flutter/material.dart';
import '../controllers/servico_controller.dart';
import 'servico_form_page.dart';

class ServicoListPage extends StatefulWidget {
  final ServicoController controller;

  const ServicoListPage({super.key, required this.controller});

  @override
  State<ServicoListPage> createState() => _ServicoListPageState();
}

class _ServicoListPageState extends State<ServicoListPage> {

  @override
  void initState() {
    super.initState();
    widget.controller.carregar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Laboratório Mobile")),
      body: AnimatedBuilder(
        animation: widget.controller,
        builder: (_, __) {
          return ListView.builder(
            itemCount: widget.controller.servicos.length,
            itemBuilder: (_, index) {
              final servico = widget.controller.servicos[index];

              return ListTile(
                title: Text(servico.titulo),
                subtitle: Text(servico.descricao),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ServicoFormPage(
                              controller: widget.controller,
                              servico: servico,
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _confirmDelete(servico.id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ServicoFormPage(
                controller: widget.controller,
              ),
            ),
          );
        },
      ),
    );
  }

  void _confirmDelete(String id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirmar exclusão"),
        content: const Text("Deseja realmente excluir?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              widget.controller.remover(id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Item removido")),
              );
            },
            child: const Text("Excluir"),
          ),
        ],
      ),
    );
  }
}