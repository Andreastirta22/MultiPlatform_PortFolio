import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/responsive_extension.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/design_system/molecules/navbar/nav_items.dart';
import 'package:portfolio/design_system/molecules/navbar/nav_logo.dart';
import 'package:portfolio/design_system/molecules/navbar/navbar_drawer.dart';
import 'package:portfolio/design_system/molecules/theme_switcher/theme_switcher.dart';

class FloatingNavbar extends StatelessWidget {
  const FloatingNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = context.radius;
    final spacing = context.spacing;

    final compact = context.width < 1100;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.lg,
          vertical: spacing.md,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius.full),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  height: 72,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: colors.transparent,
                    borderRadius: BorderRadius.circular(radius.full),
                    border: Border.all(color: colors.border),
                  ),
                  child: Row(
                    children: [
                      const NavLogo(),
                      const Spacer(),
                      if (!compact)
                        ...navItems.map(
                          (item) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: TextButton(
                              onPressed: item.onTap,
                              child: Text(item.label),
                            ),
                          ),
                        ),
                      const SizedBox(width: 12),
                      const ThemeSwitcher(),
                      if (context.isPhone)
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: colors.transparent,
                              isScrollControlled: true,
                              builder: (_) {
                                return const NavbarDrawer();
                              },
                            );
                          },
                          icon: const Icon(Icons.menu),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
