import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AuthoritySection extends StatelessWidget {
  const AuthoritySection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth >= 900;

        return Container(
          color: AppColors.darkGreen,
          width: double.infinity,
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _buildTextContent(isDesktop)),
                    Expanded(child: _buildImage(context, isDesktop)),
                  ],
                )
              : Column(
                  children: [
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
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  "Advocacia Civil",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.gold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Com mais de 15 anos de atuação, o escritório Soares & Vasconcelos consolidou-se pela ética e pela busca incansável pelos direitos de seus clientes. Nossa abordagem combina conhecimento técnico profundo com um atendimento humanizado e transparente.",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFE0E0E0),
              height: 1.6,
            ),
            textAlign: TextAlign.justify,
          ),

          const SizedBox(height: 40),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.gold),
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
