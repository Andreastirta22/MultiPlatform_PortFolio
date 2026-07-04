import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/theme/controller/theme_controller.dart';
import 'package:portfolio/theme/theme_mode.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatefulWidget {
  final bool compact;
  final bool anonouncementBelow;

  const ThemeSwitcher({
    super.key,
    required this.compact,
    this.anonouncementBelow = true,
  });

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  late ThemeController controller;
  bool _showThemeInfo = false;
  Timer? _timer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = context.watch<ThemeController>();
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ThemeController>();
    final colors = context.colors;
    final radius = context.radius;

    final width = widget.compact ? 42.0 : 180.0;
    final desktop = !widget.compact;

    return SizedBox(
      width: width,

      height: 42,

      child: Stack(
        clipBehavior: Clip.none,

        alignment: Alignment.center,

        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutCubic,
            top: desktop ? null : (_showThemeInfo ? -96 : -72),
            bottom: desktop ? (_showThemeInfo ? -72 : -52) : null,

            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: _showThemeInfo ? 1 : 0,
              child: IgnorePointer(
                ignoring: !_showThemeInfo,
                child: Container(
                  key: ValueKey(controller.currentTheme),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: colors.border),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _themeName,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                          color: colors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _themeCounter,
                        style: TextStyle(
                          fontSize: 10,
                          letterSpacing: 2,
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Tooltip(
            message: _themeName,
            child: GestureDetector(
              onTap: _nextTheme,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(radius.full),
                  border: Border.all(color: colors.border),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: animation,
                      child: ScaleTransition(scale: animation, child: child),
                    );
                  },
                  child: Icon(
                    _icon(),
                    key: ValueKey(controller.currentTheme),
                    size: 18,
                    color: colors.textPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _nextTheme() async {
    final themes = PortfolioTheme.values;
    final index = themes.indexOf(controller.currentTheme);
    final next = themes[(index + 1) % themes.length];
    await controller.changeTheme(next);
    _timer?.cancel();
    setState(() {
      _showThemeInfo = true;
    });

    _timer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        _showThemeInfo = false;
      });
    });
  }

  String get _themeName {
    switch (controller.currentTheme) {
      case PortfolioTheme.dark:
        return "NOIR";
      case PortfolioTheme.editorial:
        return "EDITORIAL";
      case PortfolioTheme.minimal:
        return "MINIMAL";
      case PortfolioTheme.neo:
        return "NEO";
      case PortfolioTheme.xp:
        return "XP";
    }
  }

  String get _themeCounter {
    final total = PortfolioTheme.values.length;
    final current = PortfolioTheme.values.indexOf(controller.currentTheme) + 1;
    return "$current OF $total THEMES";
  }

  IconData _icon() {
    switch (controller.currentTheme) {
      case PortfolioTheme.dark:
        return Icons.dark_mode_rounded;
      case PortfolioTheme.editorial:
        return Icons.menu_book_rounded;
      case PortfolioTheme.minimal:
        return Icons.circle_outlined;
      case PortfolioTheme.neo:
        return Icons.auto_awesome_rounded;
      case PortfolioTheme.xp:
        return Icons.desktop_windows_rounded;
    }
  }
}
