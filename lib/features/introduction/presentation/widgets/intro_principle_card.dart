import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/introduction/models/principle_model.dart';

class IntroPrincipleCard extends StatelessWidget {
  final PrincipleModel principle;
  final int index;

  const IntroPrincipleCard({
    super.key,
    required this.principle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.border.withValues(alpha: 0.6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER ROW (TAG + NUMBER)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (principle.tags != null)
                Text(
                  principle.tags!.toUpperCase(),
                  style: TextStyle(
                    color: colors.textSecondary.withValues(alpha: 0.7),
                    fontSize: 10,
                    letterSpacing: 1.6,
                  ),
                )
              else
                const SizedBox(),

              // NUMBER SYSTEM (01 / 02 / 03)
              Text(
                (index + 1).toString().padLeft(2, '0'),
                style: TextStyle(
                  color: colors.textSecondary.withValues(alpha: 0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // TITLE (MAIN FOCUS)
          Text(
            principle.title,
            style: TextStyle(
              color: colors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),

          const SizedBox(height: 10),

          // DESCRIPTION
          Text(
            principle.description,
            style: TextStyle(
              color: colors.textSecondary.withValues(alpha: 0.9),
              fontSize: 13,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
