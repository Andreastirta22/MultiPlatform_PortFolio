import 'package:flutter/material.dart';

class HeroActions extends StatelessWidget {
  const HeroActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        ElevatedButton(onPressed: () {}, child: const Text("Explore Projects")),
        OutlinedButton(onPressed: () {}, child: const Text("Architecture")),
        TextButton(onPressed: () {}, child: const Text("Resume")),
      ],
    );
  }
}
