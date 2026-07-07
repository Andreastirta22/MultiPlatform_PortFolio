import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/controller/certificates_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/tablet/widgets/tablet_certificates_grid.dart';

class TabletCertificatesContent extends StatelessWidget {
  final CertificatesController controller;

  const TabletCertificatesContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: TabletCertificatesGrid(controller: controller),
    );
  }
}
