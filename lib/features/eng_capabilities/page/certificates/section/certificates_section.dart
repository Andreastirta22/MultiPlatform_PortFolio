import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/responsive_extension.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/controller/certificates_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/layout/mobile_certificates_layout.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/desktop/pages/desktop_certificates_layout.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/tablet/pages/tablet_certificates_layout.dart';

class CertificatesSection extends StatefulWidget {
  const CertificatesSection({super.key});

  @override
  State<CertificatesSection> createState() => _CertificatesSectionState();
}

class _CertificatesSectionState extends State<CertificatesSection> {
  late final CertificatesController controller;

  @override
  void initState() {
    super.initState();
    controller = CertificatesController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (context.isPhone) {
      return MobileCertificatesLayout(controller: controller);
    }
    if (context.isTablet) {
      return TabletCertificatesLayout(controller: controller);
    }

    return DesktopCertificatesLayout(controller: controller);
  }
}
