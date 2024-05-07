import 'package:flutter/material.dart';
import 'package:tiktok_clone/constans/gaps.dart';
import 'package:tiktok_clone/constans/sizes.dart';

class UserAccount extends StatelessWidget {
  final String text;
  final String subText;

  const UserAccount({
    super.key,
    required this.text,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Text(
          subText,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
