import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/controller/certificates_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/tablet/widgets/tablet_certificates_content.dart';

class TabletCertificatesLayout extends StatelessWidget {
  final CertificatesController controller;

  const TabletCertificatesLayout({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TabletCertificatesContent(controller: controller),
    );
  }
}
