import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/controller/certificates_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/desktop/widgets/desktop_certificates_content.dart';

class DesktopCertificatesLayout extends StatelessWidget {
  final CertificatesController controller;

  const DesktopCertificatesLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DesktopCertificatesContent(controller: controller),
    );
  }
}
