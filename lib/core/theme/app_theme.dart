import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      // Define o esquema de cores principal
      colorScheme: const ColorScheme.light(
        primary: AppColors.navyBlue, // Cor principal do app
        secondary: AppColors.gold, // Cor de destaque (botões flutuantes, etc)
        surface: AppColors.offWhite, // Cor de fundo das telas
        onPrimary:
            AppColors.white, // Cor do texto/ícone em cima da cor primária
      ),

      // Configuração padrão da AppBar (Topo do app)
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.navyBlue,
        foregroundColor: AppColors.white, // Cor do texto/ícones
        elevation: 0,
        centerTitle: true,
      ),

      // Configuração padrão dos Botões Elevados (FilledButton)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: AppColors.navyBlue, // Texto do botão
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // Aqui você pode adicionar configurações de TextTheme (fontes) no futuro
    );
  }
}
