import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/controller/certificates_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/mobile/pages/mobile_certificates_content.dart';

class MobileCertificatesLayout extends StatelessWidget {
  final CertificatesController controller;

  const MobileCertificatesLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MobileCertificatesContent(controller: controller),
    );
  }
}
