import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/controller/certificates_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/desktop/widgets/desktop_certificate_detail.dart';

class DesktopCertificateNode extends StatelessWidget {
  final CertificatesController controller;
  final int index;

  const DesktopCertificateNode({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final certificate = controller.certificates[index];
    final isExpanded = controller.isExpanded(index);

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colors.border),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () => controller.toogle(index),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(28),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            certificate.title,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            certificate.issuer,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: colors.textSecondary),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '${certificate.issuedAt.year}',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: colors.textSecondary),
                          ),
                        ],
                      ),
                    ),
                    AnimatedRotation(
                      turns: isExpanded ? .5 : 0,
                      duration: const Duration(milliseconds: 250),
                      child: const Icon(Icons.keyboard_arrow_down_rounded),
                    ),
                  ],
                ),
              ),
              if (isExpanded)
                DesktopCertificateDetailContent(certificate: certificate),
            ],
          ),
        ),
      ),
    );
  }
}
