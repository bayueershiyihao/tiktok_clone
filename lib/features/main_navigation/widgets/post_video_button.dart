import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constans/sizes.dart';

class PostVideoButton extends StatefulWidget {
  const PostVideoButton({super.key});

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  bool _isSelected = false;

  void _onLongPressDown(LongPressDownDetails details) {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressDown: _onLongPressDown,
      onLongPressEnd: _onLongPressEnd,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            right: _isSelected ? -4 : 22,
            child: Container(
              height: 38,
              width: 32,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff61D4F0),
                borderRadius: BorderRadius.circular(
                  Sizes.size12,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            left: _isSelected ? -4 : 22,
            child: Container(
              height: 38,
              width: 32,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(
                  Sizes.size12,
                ),
              ),
            ),
          ),
          Container(
            height: 38,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size14,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Sizes.size12),
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: Colors.black,
                size: Sizes.size24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
