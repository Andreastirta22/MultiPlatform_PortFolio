import 'package:flutter/material.dart';

class ButtonShowcase extends StatelessWidget {
  const ButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: [
        FilledButton(onPressed: () {}, child: Text("Primary")),
        OutlinedButton(onPressed: () {}, child: Text("Secondary")),
        TextButton(onPressed: () {}, child: Text("Text")),
      ],
    );
  }
}
