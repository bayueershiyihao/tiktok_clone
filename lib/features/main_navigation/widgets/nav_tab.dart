import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constans/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.selectedIcon,
    required this.selectedIndex,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: selectedIndex == 0 ? Colors.black : Colors.white,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: isSelected ? 1 : 0.6,
            child: Column(
              children: [
                FaIcon(
                  isSelected ? selectedIcon : icon,
                  color: selectedIndex == 0 ? Colors.white : Colors.black,
                ),
                Gaps.v5,
                Text(
                  text,
                  style: TextStyle(
                    color: selectedIndex == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
