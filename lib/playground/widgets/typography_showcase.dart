import 'package:flutter/material.dart';

class TypographyShowcase extends StatelessWidget {
  const TypographyShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Typography", style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 16),
        Text('Display', style: TextStyle(fontSize: 56)),
        Text("Headline", style: TextStyle(fontSize: 36)),
        Text("Title", style: TextStyle(fontSize: 24)),
        Text("Body", style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
