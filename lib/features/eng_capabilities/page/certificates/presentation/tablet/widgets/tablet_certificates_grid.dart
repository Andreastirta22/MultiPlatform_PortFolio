import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/controller/certificates_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/tablet/widgets/tablet_certificate_node.dart';

class TabletCertificatesGrid extends StatelessWidget {
  final CertificatesController controller;

  const TabletCertificatesGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.certificates.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.25,
          ),
          itemBuilder: (_, index) {
            return TabletCertificateNode(controller: controller, index: index);
          },
        );
      },
    );
  }
}
