import 'package:flutter/material.dart';

class XpCardTemplate extends StatelessWidget {
  const XpCardTemplate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD4D0C8),

        border: Border.all(color: Colors.black, width: 2),
      ),

      child: Column(
        children: [
          Container(
            height: 32,

            padding: const EdgeInsets.symmetric(horizontal: 12),

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0054E3), Color(0xFF3A8CFF)],
              ),
            ),

            child: const Row(
              children: [
                Icon(Icons.folder, size: 16, color: Colors.white),

                SizedBox(width: 8),

                Text(
                  "Portfolio Explorer",

                  style: TextStyle(
                    color: Colors.white,

                    fontWeight: FontWeight.bold,

                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(padding: const EdgeInsets.all(16), child: child),
          ),

          Container(
            height: 28,

            padding: const EdgeInsets.symmetric(horizontal: 12),

            decoration: const BoxDecoration(color: Color(0xFFE4E0D8)),

            child: const Align(
              alignment: Alignment.centerLeft,

              child: Text("4 items", style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}
