import 'package:flutter/material.dart';
import 'package:lab_modelo_kickoff/pages/home_page.dart';

void main() {
  runApp(const LabMobileKickoffApp());
}

class LabMobileKickoffApp extends StatelessWidget {
  const LabMobileKickoffApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab Mobile Kickoff',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
