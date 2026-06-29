import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multiplatform Portfolio Dart",
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text("Portfolio"))),
    );
  }
}
