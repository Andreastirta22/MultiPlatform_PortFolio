import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class ThemeAnnoouncement extends StatelessWidget {
  final bool visible;
  final String title;
  final String counter;
  const ThemeAnnoouncement({
    super.key,
    required this.visible,
    required this.title,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),

      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,

          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, .15),

              end: Offset.zero,
            ).animate(animation),

            child: child,
          ),
        );
      },

      child: visible
          ? Container(
              key: ValueKey(title),

              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),

              decoration: BoxDecoration(
                color: colors.surface,

                border: Border.all(color: colors.border),

                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                children: [Text("CURRENT STYLE"), Text(title), Text(counter)],
              ),
            )
          : const SizedBox(),
    );
  }
}
