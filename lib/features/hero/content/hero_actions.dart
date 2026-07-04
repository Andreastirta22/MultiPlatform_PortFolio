import 'package:flutter/material.dart';

class HeroActions extends StatelessWidget {
  const HeroActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: const StadiumBorder(),
          ),
          child: const Text("Explore Projects"),
        ),

        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: const StadiumBorder(),
          ),
          child: const Text("Architecture"),
        ),

        TextButton(onPressed: () {}, child: const Text("Resume")),
      ],
    );
  }
}
