import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constans/gaps.dart';
import 'package:tiktok_clone/constans/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/setting/settings_screen.dart';
import 'package:tiktok_clone/users/widgets/persistent_tab_bar.dart';
import 'package:tiktok_clone/users/widgets/user_account.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text(
                  'GIRL',
                ),
                actions: [
                  IconButton(
                    onPressed: _onGearPressed,
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      foregroundColor: Colors.blue,
                      foregroundImage: NetworkImage(
                        'https://i.pinimg.com/236x/5c/8f/15/5c8f1559b8cf6f2d27f012f5b94f626d.jpg',
                      ),
                      child: Text('aa'),
                    ),
                    Gaps.v10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '@Jaewon',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.h4,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size16,
                          color: Colors.blue.shade500,
                        ),
                      ],
                    ),
                    Gaps.v24,
                    SizedBox(
                      height: Sizes.size56,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const UserAccount(text: '37', subText: 'Following'),
                          VerticalDivider(
                            width: Sizes.size40,
                            thickness: Sizes.size1,
                            indent: Sizes.size16,
                            endIndent: Sizes.size16,
                            color: Colors.grey.shade300,
                          ),
                          const UserAccount(
                              text: '10.5M', subText: 'Followers'),
                          VerticalDivider(
                            width: Sizes.size40,
                            thickness: Sizes.size1,
                            indent: Sizes.size16,
                            endIndent: Sizes.size16,
                            color: Colors.grey.shade300,
                          ),
                          const UserAccount(text: '149.3M', subText: 'Likes'),
                        ],
                      ),
                    ),
                    Gaps.v10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size60,
                            vertical: Sizes.size14,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                Sizes.size4,
                              ),
                            ),
                          ),
                          child: const Text(
                            textAlign: TextAlign.center,
                            'Follow',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Gaps.h5,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size12,
                            horizontal: Sizes.size12,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                Sizes.size4,
                              ),
                            ),
                          ),
                          child: const FaIcon(
                            FontAwesomeIcons.youtube,
                          ),
                        ),
                        Gaps.h5,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size12,
                            horizontal: Sizes.size12,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                Sizes.size4,
                              ),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_drop_down,
                          ),
                        )
                      ],
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size44,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        'All highlights and where to watch live matches on FIFA+ I wonder how it would look',
                      ),
                    ),
                    Gaps.v14,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size14,
                        ),
                        Gaps.h4,
                        Text(
                          'https://www.fifa.com/fifaplus/en/home',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v14,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                itemCount: 20,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: Sizes.size2,
                  crossAxisSpacing: Sizes.size2,
                  childAspectRatio: 9 / 14,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 9 / 14,
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/iamges/placeholder.jpg',
                          image:
                              'https://flexible.img.hani.co.kr/flexible/normal/960/960/imgdb/resize/2019/0121/00501111_20190121.JPG',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        left: 0,
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow_outlined,
                              color: Colors.white,
                              size: Sizes.size28,
                            ),
                            Text(
                              '4.1M',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
