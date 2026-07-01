import 'package:flutter/material.dart';

class ColorShowcase extends StatelessWidget {
  const ColorShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Colors', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _ColorBox('title', Colors.black),
            _ColorBox('Surface', Colors.grey),
            _ColorBox('Accent', Colors.orange),
          ],
        ),
      ],
    );
  }
}

class _ColorBox extends StatelessWidget {
  final String title;
  final Color color;

  const _ColorBox(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(height: 8),
        Text(title),
      ],
    );
  }
}
