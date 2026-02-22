import 'package:flutter/material.dart';
import 'data/repositories/servico_repository_fake.dart';
import 'presentation/controllers/servico_controller.dart';
import 'presentation/pages/servico_list_page.dart';

void main() {
  final repository = ServicoRepositoryFake();
  final controller = ServicoController(repository);

  runApp(MyApp(controller));
}

class MyApp extends StatelessWidget {
  final ServicoController controller;

  const MyApp(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServicoListPage(controller: controller),
    );
  }
}