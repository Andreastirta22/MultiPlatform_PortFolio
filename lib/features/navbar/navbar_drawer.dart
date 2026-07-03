import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/navbar/nav_items.dart';
import 'package:portfolio/theme/theme_switcher/theme_switcher.dart';

class NavbarDrawer extends StatelessWidget {
  const NavbarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final visuals = context.visuals;

    Widget panel = Container(
      width: 320,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(visuals.cardRadius),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  Navigator.pop(context);
                },

                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...List.generate(navItems.length, (index) {
            final item = navItems[index];
            return _DrawerItem(label: item.label, onTap: item.onTap);
          }),
          const SizedBox(height: 24),
          Divider(color: colors.border),
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

            child: const ThemeSwitcher(compact: true),
          ),
        ],
      ),
    );
    if (visuals.glass) {
      panel = ClipRRect(
        borderRadius: BorderRadius.circular(visuals.cardRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: visuals.blur, sigmaY: visuals.blur),
          child: panel,
        ),
      );
    }
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(child: panel),
      ),
    );
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
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hover = true;
        });
      },
      onExit: (_) {
        setState(() {
          hover = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: hover ? colors.surface : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Row(
            children: [
              Expanded(child: Text(widget.label)),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 150),
                opacity: hover ? 1 : 0,
                child: const Icon(Icons.arrow_forward, size: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
