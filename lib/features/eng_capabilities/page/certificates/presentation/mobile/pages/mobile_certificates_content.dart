import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/controller/certificates_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/mobile/widgets/mobile_certificates_list.dart';

class MobileCertificatesContent extends StatelessWidget {
  final CertificatesController controller;

  const MobileCertificatesContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [MobileCertificatesList(controller: controller)],
      ),
    );
  }
}
