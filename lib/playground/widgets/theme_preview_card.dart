import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';

class ThemePreviewCard extends StatelessWidget {
  final AppTheme theme;
  final bool selected;
  final VoidCallback onTap;

  const ThemePreviewCard({
    required this.theme,
    required this.selected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
