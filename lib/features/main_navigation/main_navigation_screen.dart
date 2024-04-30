import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constans/gaps.dart';

import 'package:tiktok_clone/constans/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/stf_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Record video'),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const StfSCreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const StfSCreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const StfSCreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const StfSCreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: Colors.black,
        surfaceTintColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              icon: FontAwesomeIcons.house,
              text: 'Home',
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
              selectedIcon: FontAwesomeIcons.house,
            ),
            NavTab(
              icon: FontAwesomeIcons.compass,
              text: 'Discover',
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
              selectedIcon: FontAwesomeIcons.solidCompass,
            ),
            Gaps.h24,
            GestureDetector(
              onTap: _onPostVideoButtonTap,
              child: const PostVideoButton(),
            ),
            Gaps.h24,
            NavTab(
              icon: FontAwesomeIcons.message,
              text: 'Inbox',
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
              selectedIcon: FontAwesomeIcons.solidMessage,
            ),
            NavTab(
              icon: FontAwesomeIcons.user,
              text: 'Profile',
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
              selectedIcon: FontAwesomeIcons.solidUser,
            ),
          ],
        ),
      ),
    );
  }
}
