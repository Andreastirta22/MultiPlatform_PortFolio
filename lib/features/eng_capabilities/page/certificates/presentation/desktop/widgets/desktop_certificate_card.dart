import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/controller/certificates_controller.dart';

class DesktopCertificateCard extends StatelessWidget {
  final CertificatesController controller;
  final int index;

  const DesktopCertificateCard({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final certificate = controller.certificates[index];
    final isSelected = controller.selectedIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => controller.select(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? colors.accent : colors.border,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(certificate.imageAsset, fit: BoxFit.cover),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    certificate.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    certificate.issuer,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    '${certificate.issuedAt.year}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
