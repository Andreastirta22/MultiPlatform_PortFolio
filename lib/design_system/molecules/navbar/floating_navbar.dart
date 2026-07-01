import 'package:flutter/material.dart';
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
    final compact = MediaQuery.sizeOf(context).width < 1100;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.lg,
          vertical: spacing.md,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Container(
              height: 72,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: colors.transparent,
                borderRadius: BorderRadius.circular(radius.full),
                border: Border.all(color: colors.border),
              ),
              child: Row(
                children: [
                  const NavLogo(),
                  Expanded(
                    child: !compact
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: navItems.map((item) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: TextButton(
                                  onPressed: item.onTap,
                                  style: TextButton.styleFrom(
                                    foregroundColor: colors.textPrimary,
                                    overlayColor: colors.textPrimary.withValues(
                                      alpha: .06,
                                    ),
                                  ),
                                  child: Text(
                                    item.label,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          )
                        : const SizedBox(),
                  ),
                  ThemeSwitcher(compact: compact),
                  if (compact)
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: colors.background,
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
    );
  }
}
