import 'dart:async';

import 'package:flutter/material.dart';

class ExperienceBannerController {
  static const int _kMiddlePage = 10000;

  final PageController pageController;
  final ValueNotifier<int> activeIndex = ValueNotifier(0);

  Timer? _timer;
  bool _isAnimating = false;

  final Duration interval;
  final Duration animationDuration;

  ExperienceBannerController({
    this.interval = const Duration(seconds: 5),
    this.animationDuration = const Duration(milliseconds: 900),
  }) : pageController = PageController(
         initialPage: _kMiddlePage,
         viewportFraction: 0.88,
       );

  void startAutoPlay(int length) {
    _timer?.cancel();

    if (length <= 1) return;

    _timer = Timer.periodic(interval, (_) {
      nextPage(length);
    });
  }

  void nextPage(int length) {
    if (!pageController.hasClients) return;
    if (_isAnimating) return;
    if (length <= 0) return;

    final currentPage =
        pageController.page ?? pageController.initialPage.toDouble();
    final nextPage = currentPage + 1;

    _animateTo(nextPage.toInt());
  }

  void previousPage(int length) {
    if (!pageController.hasClients) return;
    if (_isAnimating) return;
    if (length <= 0) return;

    final currentPage =
        pageController.page ?? pageController.initialPage.toDouble();
    final prevPage = currentPage - 1;

    _animateTo(prevPage.toInt());
  }

  void _animateTo(int page) {
    _isAnimating = true;

    pageController
        .animateToPage(
          page,
          duration: animationDuration,
          curve: Curves.easeInOutCubic,
        )
        .whenComplete(() {
          _isAnimating = false;
        });
  }

  void onPageChangedLocal(int page, int length) {
    if (length <= 0) return;

    activeIndex.value = page % length;

    _recenterIfNeeded(page, length);
  }

  void _recenterIfNeeded(int page, int length) {
    // anti drift supaya gak jauh dari center
    const threshold = 5000;

    if ((page - _kMiddlePage).abs() > threshold) {
      final newPage = _kMiddlePage + (page % length);
      pageController.jumpToPage(newPage);
    }
  }

  void pause() {
    _timer?.cancel();
  }

  void resume(int length) {
    startAutoPlay(length);
  }

  void dispose() {
    _timer?.cancel();
    pageController.dispose();
    activeIndex.dispose();
  }
}
