import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/architecture/presentation/sections/architecture_section.dart';
import 'package:portfolio/features/experience_banner/section/experience_banner_section.dart';
import 'package:portfolio/features/hero/hero_layout.dart';
import 'package:portfolio/features/projects/sections/project_section.dart';
import 'package:portfolio/theme/controller/theme_controller.dart';
import 'package:provider/provider.dart';

class DesktopHome extends StatefulWidget {
  final ScrollController controller;
  const DesktopHome({super.key, required this.controller});

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome>
    with SingleTickerProviderStateMixin {
  static const _showFabThreshold = 480.0;

  late final AnimationController _fabAnim;

  bool _fabVisible = false;

  @override
  void initState() {
    super.initState();
    _fabAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    widget.controller.addListener(_handleScroll);
  }

  void _handleScroll() {
    final shouldShow = widget.controller.offset > _showFabThreshold;
    if (shouldShow != _fabVisible) {
      setState(() => _fabVisible = shouldShow);
      shouldShow ? _fabAnim.forward() : _fabAnim.reverse();
    }
  }

  void _scrollToTop() {
    widget.controller.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleScroll);
    _fabAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();

    return Stack(
      children: [
        ScrollConfiguration(
          behavior: const _SmoothScrollBehavior(),
          child: ListView(
            controller: widget.controller,
            physics: const _InertiaScrollPhysics(),
            children: [
              HeroLayout(),
              ProjectSection(),
              ArchitectureSection(),
              ExperienceBannerSection(themeController: themeController),
              _SectionPlaceholder(label: "Footer"),
            ],
          ),
        ),

        Positioned(
          right: 32,
          bottom: 32,
          child: IgnorePointer(
            ignoring: !_fabVisible,
            child: FadeTransition(
              opacity: _fabAnim,
              child: ScaleTransition(
                scale: CurvedAnimation(
                  parent: _fabAnim,
                  curve: Curves.easeOutBack,
                ),
                child: _ScrollToTopButton(onPressed: _scrollToTop),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionPlaceholder extends StatelessWidget {
  final String label;
  const _SectionPlaceholder({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.25),
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _ScrollToTopButton extends StatefulWidget {
  final VoidCallback onPressed;
  const _ScrollToTopButton({required this.onPressed});

  @override
  State<_ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<_ScrollToTopButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6C5CE7), Color(0xFF8C6CFF)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(
                  0xFF6C5CE7,
                ).withValues(alpha: _hovering ? 0.45 : 0.28),
                blurRadius: _hovering ? 22 : 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          transform: Matrix4.identity()
            ..translateByDouble(0, _hovering ? -2 : 0, 0, 1),
          child: const Icon(
            Icons.keyboard_arrow_up_rounded,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
    );
  }
}

/// Mouse-wheel + trackpad friendly scroll behavior for desktop.
class _SmoothScrollBehavior extends ScrollBehavior {
  const _SmoothScrollBehavior();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    // No glow/stretch indicator on desktop.
    return child;
  }

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
  };
}

/// Adds a touch of inertia/deceleration so scrolling feels smoother
/// than the platform default ClampingScrollPhysics on desktop.
class _InertiaScrollPhysics extends ScrollPhysics {
  const _InertiaScrollPhysics({super.parent});

  @override
  _InertiaScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _InertiaScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring =>
      const SpringDescription(mass: 0.5, stiffness: 100, damping: 18);

  @override
  double get minFlingVelocity => 50.0;

  @override
  double get maxFlingVelocity => 8000.0;

  @override
  Tolerance get tolerance => const Tolerance(velocity: 0.5, distance: 0.5);
}
