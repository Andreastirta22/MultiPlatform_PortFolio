import 'package:flutter/material.dart';
import 'package:portfolio/features/introduction/models/principle_model.dart';
import 'package:portfolio/features/introduction/presentation/widgets/intro_principle_card.dart';

class IntroPrinciples extends StatelessWidget {
  final List<PrincipleModel> principles;

  const IntroPrinciples({super.key, required this.principles});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: principles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.25,
          ),
          itemBuilder: (context, index) {
            return IntroPrincipleCard(
              principle: principles[index],
              index: index,
            );
          },
        );
      },
    );
  }
}
