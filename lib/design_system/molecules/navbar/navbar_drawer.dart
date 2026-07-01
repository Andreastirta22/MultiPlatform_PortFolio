import 'package:flutter/material.dart';
import 'package:portfolio/design_system/molecules/navbar/nav_items.dart';
import 'package:portfolio/design_system/molecules/theme_switcher/theme_switcher.dart';

class NavbarDrawer extends StatelessWidget {
  const NavbarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...navItems.map((item) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(item.label),
                onTap: item.onTap,
              );
            }),
            const Divider(),
            const SizedBox(height: 16),
            const ThemeSwitcher(),
          ],
        ),
      ),
    );
  }
}
