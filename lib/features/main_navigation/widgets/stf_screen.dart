import 'package:flutter/material.dart';

class StfSCreen extends StatefulWidget {
  const StfSCreen({super.key});

  @override
  State<StfSCreen> createState() => _StfSCreenState();
}

class _StfSCreenState extends State<StfSCreen> {
  int _clicks = 0;

  void _increase() {
    setState(() {
      _clicks++;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_clicks',
            style: const TextStyle(
              fontSize: 60,
            ),
          ),
          TextButton(
            onPressed: _increase,
            child: const Text('+'),
          ),
        ],
      ),
    );
  }
}
