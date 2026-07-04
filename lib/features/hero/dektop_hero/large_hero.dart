import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/responsive_extension.dart';
import 'package:portfolio/features/hero/herodock/hero_social_dock.dart';

/// Tablet + Desktop hero. Mobile uses MobileHeroCover instead.
///
/// Composition mirrors reference.png 1:1:
///   Stack(
///     BackgroundImage        -> full bleed, BoxFit.cover, bright, minimal overlay
///     GradientOverlay        -> subtle, only enough for text legibility
///     TopLeftMetric          -> big number + 2-line supporting copy
///     BottomRightDescription -> heading + short wrapped paragraph, right aligned
///     FloatingSocialDock     -> centered, content-hugging, floats above bottom edge
///   )
class LargeHero extends StatelessWidget {
  const LargeHero({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final outerPadding = isDesktop ? 32.0 : 24.0;
    final radius = isDesktop ? 36.0 : 28.0;

    return SizedBox(
      height: screenHeight,
      child: Padding(
        padding: EdgeInsets.all(outerPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _background(),
              _gradient(),
              _metric(context),
              _description(context),
              _dock(isDesktop),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _background() {
  return Image.asset(
    "assets/images/second_logo.png",
    fit: BoxFit.cover,
    alignment: Alignment.center,
  );
}

/// Very light scrim — the photo should stay bright like reference.png.
/// Just enough top darkening for the metric text and a soft bottom
/// pool of shadow so the floating dock reads clearly against the image.
Widget _gradient() {
  return const DecoratedBox(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black26,
          Colors.transparent,
          Colors.transparent,
          Colors.black45,
        ],
        stops: [0, .22, .68, 1],
      ),
    ),
  );
}

Widget _metric(BuildContext context) {
  final isDesktop = context.isDesktop;
  final padding = isDesktop ? 56.0 : 40.0;
  final metricSize = isDesktop ? 72.0 : 56.0;

  return Positioned(
    top: padding,
    left: padding,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "7+",
          style: TextStyle(
            color: Color(0xFF8E8E99),
            fontSize: metricSize,
            fontWeight: FontWeight.w800,
            height: 1,
            shadows: const [
              Shadow(
                color: Colors.black26,
                blurRadius: 16,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Shipping Products,",
          style: TextStyle(
            color: Color(0xFF8E8E99),
            fontSize: isDesktop ? 16 : 15,
            fontWeight: FontWeight.w500,
            height: 1.3,
          ),
        ),
        Text(
          "End to End",
          style: TextStyle(
            color: Color(0xFF8E8E99),
            fontSize: isDesktop ? 16 : 15,
            fontWeight: FontWeight.w500,
            height: 1.3,
          ),
        ),
      ],
    ),
  );
}

Widget _description(BuildContext context) {
  final isDesktop = context.isDesktop;
  final padding = isDesktop ? 56.0 : 40.0;
  final headingSize = isDesktop ? 28.0 : 22.0;

  return Positioned(
    right: padding,
    bottom: isDesktop ? 132.0 : 108.0,
    child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: isDesktop ? 300 : 240),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Product Thinker",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF8E8E99),
              fontSize: headingSize,
              fontWeight: FontWeight.w700,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Flutter Engineer crafting cross-platform "
            "experiences with a focus on design systems.",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF8E8E99),
              fontSize: isDesktop ? 14.5 : 13.5,
              fontWeight: FontWeight.w400,
              height: 1.45,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _dock(bool isDesktop) {
  return Positioned(
    left: 0,
    right: 0,
    bottom: 0,
    child: HeroSocialDock(isDesktop: isDesktop),
  );
}
