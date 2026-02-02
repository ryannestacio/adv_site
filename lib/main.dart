import 'package:flutter/material.dart';
// import 'features/landing_page/presentation/pages/home_page.dart';

void main() {
  runApp(const LawFirmApp());
}

class LawFirmApp extends StatelessWidget {
  const LawFirmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nome do Escritório',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const Scaffold(
        body: Center(child: Text("Site Advocacia - Em Construção")),
      ),
    );
  }
}
