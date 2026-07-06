import 'package:flutter/material.dart';

class LanguageEmptyState extends StatelessWidget {
  const LanguageEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.code_off_rounded, size: 56),
            const SizedBox(height: 20),
            const Text('No Language Selected', textAlign: TextAlign.center),
            const SizedBox(height: 12),
            const Text(
              'Select a programming language to explore its engineering capabilities, supported platforms, related projects, and technical expertise.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
