import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/controller/certificates_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/mobile/widgets/mobile_certificates_node.dart';

class MobileCertificatesList extends StatelessWidget {
  final CertificatesController controller;
  const MobileCertificatesList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Column(
          children: List.generate(
            controller.certificates.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: MobileCertificateNode(
                controller: controller,
                index: index,
              ),
            ),
          ),
        );
      },
    );
  }
}
