import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constans/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final void Function(BuildContext context) navigator;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.navigator,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigator(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size14,
            horizontal: Sizes.size24,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size5),
              border: Border.all(
                color: Colors.grey.shade300,
                width: Sizes.size1,
              )),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
