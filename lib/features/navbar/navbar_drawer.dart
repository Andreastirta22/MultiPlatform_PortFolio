import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/navbar/nav_items.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/theme/controller/theme_controller.dart';
import 'package:portfolio/theme/theme_switcher/theme_switcher.dart';
import 'package:provider/provider.dart';

class NavbarDrawer extends StatelessWidget {
  const NavbarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ThemeController>();
    final colors = AppTheme.resolve(controller.currentTheme).colors;

    return Container(
      color: colors.background,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "MENU",
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // NAV ITEMS
                ...List.generate(navItems.length, (index) {
                  final item = navItems[index];
                  return _DrawerItem(label: item.label, onTap: item.onTap);
                }),

                const SizedBox(height: 24),

                Divider(color: colors.border.withValues(alpha: 0.4)),

                const SizedBox(height: 20),
                const Text(
                  "STYLE",
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 16),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: const _ThemeSwitcherWrapper(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeSwitcherWrapper extends StatelessWidget {
  const _ThemeSwitcherWrapper();

  @override
  Widget build(BuildContext context) {
    return const ThemeSwitcher(compact: true);
  }
}

class _DrawerItem extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;

  const _DrawerItem({required this.label, this.onTap});

  @override
  State<_DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<_DrawerItem> {
  bool hover = false;

  void _setHover(bool value) {
    if (!mounted) return;
    if (hover == value) return;
    setState(() => hover = value);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final hoverColor = colors.surface.withValues(alpha: 0.25);
    final textColor = colors.textPrimary;

    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(14),
          splashColor: textColor.withValues(alpha: 0.06),
          highlightColor: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOutCubic,
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: hover ? hoverColor : Colors.transparent,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Expanded(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOutCubic,
                    style: TextStyle(
                      color: hover
                          ? textColor
                          : textColor.withValues(alpha: 0.85),
                    ),
                    child: Text(widget.label),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 140),
                  opacity: hover ? 1 : 0,
                  child: Icon(Icons.arrow_forward, size: 16, color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
