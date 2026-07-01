import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/core/extension/responsive_extension.dart';
import 'package:portfolio/design_system/molecules/navbar/floating_navbar.dart';
import 'package:portfolio/features/home/presentation/desktop_home.dart';
import 'package:portfolio/features/home/presentation/mobile_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (!_controller.hasClients) {
      return;
    }
    final direction = _controller.position.userScrollDirection;
    if (direction == ScrollDirection.reverse) {
      if (_visible) {
        setState(() {
          _visible = false;
        });
      }
    } else if (direction == ScrollDirection.forward) {
      if (!_visible) {
        setState(() {
          _visible = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPhone = context.isPhone;
    final isTablet = context.isTablet;

    Widget body;
    if (isPhone) {
      body = MobileHome(controller: _controller);
    } else if (isTablet) {
      body = DesktopHome(controller: _controller);
    } else {
      body = DesktopHome(controller: _controller);
    }

    return Scaffold(
      body: Stack(
        children: [
          body,
          if (!isPhone)
            Positioned(
              top: 24,
              left: 0,
              right: 0,
              child: AnimatedSlide(
                offset: _visible ? Offset.zero : const Offset(0, -1),
                duration: Duration(milliseconds: 350),
                child: FloatingNavbar(),
              ),
            ),
          if (isPhone)
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: AnimatedSlide(
                offset: _visible ? Offset.zero : const Offset(0, 1),
                duration: Duration(milliseconds: 350),
                child: FloatingNavbar(),
              ),
            ),
        ],
      ),
    );
  }
}
