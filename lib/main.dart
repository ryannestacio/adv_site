import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/landing_page/presentation/home_page.dart';

void main() {
  runApp(const LawFirmApp());
}

class LawFirmApp extends StatelessWidget {
  const LawFirmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vasconcelos Advocacia',
      debugShowCheckedModeBanner: true,
      theme: AppTheme.lightTheme,

      // CONFIGURAÇÃO CORRETA DE ROTAS:
      initialRoute: '/', // Define por onde começar
      // REMOVA ESTA LINHA:
      // home: const HomePage(),
      routes: {
        '/': (context) =>
            const HomePage(), // O Flutter já entende que essa é a Home
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('Página Não Encontrada')),
            body: const Center(
              child: Text('404 - A página que você procura não existe.'),
            ),
          ),
        );
      },
    );
  }
}
