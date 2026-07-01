import 'package:flutter/material.dart';

class CardShowcase extends StatelessWidget {
  const CardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Project Card"),
            SizedBox(height: 8),
            Text("Portfolio Design System"),
          ],
        ),
      ),
    );
  }
}
