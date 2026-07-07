import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/models/engineering_certificates_model.dart';

class TabletCertificateDetailContent extends StatelessWidget {
  final CertificateModel certificate;

  const TabletCertificateDetailContent({super.key, required this.certificate});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          _DetailSection(
            title: 'Description',
            child: Text(
              certificate.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colors.textSecondary,
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: _DetailSection(
                  title: 'Issuer',
                  child: Text(certificate.issuer),
                ),
              ),
              Expanded(
                child: _DetailSection(
                  title: 'Category',
                  child: Text(certificate.category.name),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          _DetailSection(
            title: 'Issued',
            child: Text(
              '${certificate.issuedAt.day}/${certificate.issuedAt.month}/${certificate.issuedAt.year}',
            ),
          ),

          const SizedBox(height: 32),

          SizedBox(
            width: double.infinity,
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
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: colors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
