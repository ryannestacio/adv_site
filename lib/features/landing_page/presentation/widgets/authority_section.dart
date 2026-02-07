import 'package:flutter/material.dart';
// Usei import relativo para garantir que funcione independente do nome do projeto no pubspec
import '../../../../core/theme/app_colors.dart';

class AuthoritySection extends StatelessWidget {
  const AuthoritySection({super.key});

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder: O "Fiscal" que mede a largura da tela o tempo todo
    return LayoutBuilder(
      builder: (context, constraints) {
        // Se for maior que 900px, consideramos Desktop (Row). Senão, Mobile (Column).
        bool isDesktop = constraints.maxWidth >= 900;

        return Container(
          color: AppColors.darkGreen, // Fundo Verde Nobre
          width: double.infinity,
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // No Desktop: Texto na Esquerda (50%) | Imagem na Direita (50%)
                    Expanded(child: _buildTextContent(isDesktop)),
                    Expanded(child: _buildImage(context, isDesktop)),
                  ],
                )
              : Column(
                  children: [
                    // No Mobile: Imagem no Topo | Texto Embaixo
                    _buildImage(context, isDesktop),
                    _buildTextContent(isDesktop),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildTextContent(bool isDesktop) {
    return Padding(
      // Mais espaçamento no Desktop, menos no Mobile
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Decoração lateral (Linha Dourada)
          Container(
            padding: const EdgeInsets.only(left: 20),
            decoration: const BoxDecoration(
              border: Border(left: BorderSide(color: AppColors.gold, width: 4)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Referência em",
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.white,
                    fontWeight: FontWeight.w300, // Fonte mais fina
                  ),
                ),
                Text(
                  "Advocacia Civil",
                  style: TextStyle(
                    fontSize: 36, // Título grande e imponente
                    fontWeight: FontWeight.bold,
                    color: AppColors.gold, // Destaque Dourado
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Texto Descritivo
          const Text(
            "Com mais de 15 anos de atuação, o escritório Soares & Vasconcelos consolidou-se pela ética e pela busca incansável pelos direitos de seus clientes. Nossa abordagem combina conhecimento técnico profundo com um atendimento humanizado e transparente.",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFE0E0E0), // Branco gelo para leitura confortável
              height: 1.6, // Espaçamento entre linhas (melhora leitura)
            ),
            textAlign: TextAlign.justify,
          ),

          const SizedBox(height: 40),

          // Botão de Ação Secundário (OutlineButton)
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.gold), // Borda Dourada
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            ),
            child: const Text(
              "CONHECER NOSSA HISTÓRIA",
              style: TextStyle(
                color: AppColors.gold,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, bool isDesktop) {
    // Altura fixa no mobile para não ocupar a tela toda
    // No desktop, deixa expandir
    return SizedBox(
      height: isDesktop ? 600 : 300,
      width: double.infinity,
      child: Container(
        child: Image.asset(
          'lib/core/assets/images/advogada.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
