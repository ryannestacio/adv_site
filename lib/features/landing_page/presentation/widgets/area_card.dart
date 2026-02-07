import 'package:flutter/material.dart';
import 'package:site_adv/core/theme/app_colors.dart';

class AreaCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback? onTap;

  const AreaCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.onTap,
  });

  @override
  State<AreaCard> createState() => _AreaCardState();
}

class _AreaCardState extends State<AreaCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Detecta o Mouse (Hover)
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),

      // O Card em si
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          // Aumenta levemente a elevação e muda a cor de fundo no hover
          transform: isHovered
              ? Matrix4.identity().scaled(1.02)
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.darkGreen : AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isHovered
                  ? AppColors.gold
                  : AppColors.grey.withOpacity(0.3),
              width: 2,
            ),
            boxShadow: [
              if (isHovered)
                BoxShadow(
                  color: AppColors.darkGreen.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                ),
            ],
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ocupa apenas o espaço necessário
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ícone Dourado
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isHovered
                      ? AppColors.white.withOpacity(0.1)
                      : AppColors.offWhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(widget.icon, size: 32, color: AppColors.gold),
              ),
              const SizedBox(height: 16),

              // Título
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isHovered ? AppColors.white : AppColors.darkGreen,
                  fontFamily: 'Prata',
                ),
              ),
              const SizedBox(height: 8),

              // Descrição
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: isHovered ? AppColors.offWhite : AppColors.grey,
                  fontFamily: 'Lato',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
