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
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: isHovered
              ? Matrix4.identity().scaled(1.03)
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.darkGreen : AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isHovered
                  ? AppColors.gold
                  : AppColors.grey.withOpacity(0.15),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkGreen.withOpacity(isHovered ? 0.25 : 0.08),
                blurRadius: isHovered ? 20 : 10,
                offset: Offset(0, isHovered ? 12 : 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isHovered
                      ? AppColors.gold.withOpacity(0.15)
                      : AppColors.offWhite,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  widget.icon,
                  size: 32,
                  color: isHovered ? AppColors.gold : AppColors.darkGreen,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isHovered ? AppColors.white : AppColors.darkGreen,
                  fontFamily: 'Prata',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
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
