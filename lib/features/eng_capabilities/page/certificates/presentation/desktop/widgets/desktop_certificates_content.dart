import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/controller/certificates_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/desktop/widgets/desktop_certificates_grid.dart';

class DesktopCertificatesContent extends StatelessWidget {
  final CertificatesController controller;

  const DesktopCertificatesContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: DesktopCertificatesGrid(controller: controller),
    );
  }
}
