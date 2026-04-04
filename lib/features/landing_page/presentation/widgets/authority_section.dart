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
        vertical: isDesktop ? 80 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24),
            decoration: const BoxDecoration(
              border: Border(left: BorderSide(color: AppColors.gold, width: 4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Referência em",
                  style: TextStyle(
                    fontSize: isDesktop ? 28 : 22,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Lato',
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Advocacia Profissional",
                  style: TextStyle(
                    fontSize: isDesktop ? 44 : 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.gold,
                    fontFamily: 'Prata',
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "Com mais de 15 anos de atuação, o escritório Soares & Vasconcelos consolidou-se pela ética e pela busca incansável pelos direitos de seus clientes. Nossa abordagem combina conhecimento técnico profundo com um atendimento humanizado e transparente.",
            style: TextStyle(
              fontSize: isDesktop ? 16 : 14,
              color: Colors.white.withOpacity(0.85),
              height: 1.7,
              fontFamily: 'Lato',
              letterSpacing: 0.3,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 50),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.gold, width: 2),
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text(
              "CONHECER NOSSA HISTÓRIA",
              style: TextStyle(
                color: AppColors.gold,
                fontWeight: FontWeight.bold,
                fontSize: 13,
                letterSpacing: 1,
                fontFamily: 'Lato',
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
