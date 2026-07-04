import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/introduction/data/introduction_principle_data.dart';
import 'package:portfolio/features/introduction/presentation/widgets/intro_cta.dart';
import 'package:portfolio/features/introduction/presentation/widgets/intro_flow.dart';
import 'package:portfolio/features/introduction/presentation/widgets/intro_header.dart';
import 'package:portfolio/features/introduction/presentation/widgets/intro_principles.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: double.infinity,
      color: colors.background,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 96),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 768;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IntroHeader(),
                  SizedBox(height: isMobile ? 40 : 50),
                  IntroPrinciples(principles: introductionPrincipleData),
                  SizedBox(height: isMobile ? 40 : 50),
                  const IntroFlow(),
                  SizedBox(height: isMobile ? 56 : 60),
                  const IntroCta(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
