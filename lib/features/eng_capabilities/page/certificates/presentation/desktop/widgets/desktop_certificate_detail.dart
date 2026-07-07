import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/models/engineering_certificates_model.dart';

class DesktopCertificateDetailContent extends StatelessWidget {
  final CertificateModel certificate;

  const DesktopCertificateDetailContent({super.key, required this.certificate});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 28),

          _DetailSection(
            title: 'Description',
            child: Text(
              certificate.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colors.textSecondary,
                height: 1.7,
              ),
            ),
          ),

          const SizedBox(height: 32),

          Row(
            children: [
              Expanded(
                child: _DetailSection(
                  title: 'Issuer',
                  child: Text(
                    certificate.issuer,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Expanded(
                child: _DetailSection(
                  title: 'Category',
                  child: Text(
                    certificate.category.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Expanded(
                child: _DetailSection(
                  title: 'Issued',
                  child: Text(
                    '${certificate.issuedAt.day}/${certificate.issuedAt.month}/${certificate.issuedAt.year}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.open_in_new),
              label: const Text('View Certificate'),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _DetailSection({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: colors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}
