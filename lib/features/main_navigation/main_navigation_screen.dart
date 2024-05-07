import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constans/gaps.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';
import 'package:tiktok_clone/users/user_profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 4;

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
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        surfaceTintColor: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              icon: FontAwesomeIcons.house,
              text: 'Home',
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
              selectedIndex: _selectedIndex,
              selectedIcon: FontAwesomeIcons.house,
            ),
            NavTab(
              icon: FontAwesomeIcons.compass,
              text: 'Discover',
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
              selectedIndex: _selectedIndex,
              selectedIcon: FontAwesomeIcons.solidCompass,
            ),
            Gaps.h24,
            GestureDetector(
              onTap: _onPostVideoButtonTap,
              child: PostVideoButton(
                inverted: _selectedIndex != 0,
              ),
            ),
            Gaps.h24,
            NavTab(
              icon: FontAwesomeIcons.message,
              text: 'Inbox',
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
              selectedIndex: _selectedIndex,
              selectedIcon: FontAwesomeIcons.solidMessage,
            ),
            NavTab(
              icon: FontAwesomeIcons.user,
              text: 'Profile',
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
              selectedIndex: _selectedIndex,
              selectedIcon: FontAwesomeIcons.solidUser,
            ),
          ],
        ),
      ),
    );
  }
}
