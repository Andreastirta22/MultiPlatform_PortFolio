import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/controller/certificates_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/desktop/widgets/desktop_certificate_node.dart';

class DesktopCertificatesGrid extends StatelessWidget {
  final CertificatesController controller;

  const DesktopCertificatesGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 24.0;

        final itemWidth = (constraints.maxWidth - spacing * 2) / 3;

        return AnimatedBuilder(
          animation: controller,
          builder: (_, __) {
            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: List.generate(
                controller.certificates.length,
                (index) => SizedBox(
                  width: itemWidth,
                  child: DesktopCertificateNode(
                    controller: controller,
                    index: index,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
