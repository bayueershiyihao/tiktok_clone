import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constans/gaps.dart';
import 'package:tiktok_clone/constans/sizes.dart';

final tabs = [
  'Top',
  'Users',
  'Videos',
  'Sounds',
  'LIVE',
  'Shopping',
  'Brands',
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController(
    text: 'Initial Text',
  );

  bool _isWriting = false;

  void _onSearchChanged(String val) {
    final searchTextValue = _textEditingController.value.text.isNotEmpty;
    if (searchTextValue) {
      setState(() {
        _isWriting = true;
      });
    } else {
      setState(() {
        _isWriting = false;
      });
    }
  }

  void _onSearchSubmitted(String val) {
    setState(() {
      _isWriting = false;
    });
  }

  void _onDeleteSearachText() {
    if (_textEditingController.value.text.isNotEmpty) {
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: TextField(
            controller: _textEditingController,
            onChanged: _onSearchChanged,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  Sizes.size10,
                ),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.zero,
              prefixIcon: const Icon(
                Icons.search,
                size: Sizes.size32,
              ),
              suffixIcon: _isWriting
                  ? IconButton(
                      onPressed: _onDeleteSearachText,
                      icon: FaIcon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Colors.grey.shade600,
                        size: Sizes.size20,
                      ),
                    )
                  : Container(),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(
                right: Sizes.size14,
              ),
              child: FaIcon(
                FontAwesomeIcons.sliders,
              ),
            ),
          ],
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey[500],
            onTap: (value) {
              FocusScope.of(context).unfocus();
            },
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(
                Sizes.size8,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.size4,
                      ),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 15,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: 'assets/images/placeholder.jpg',
                        image:
                            'https://flexible.img.hani.co.kr/flexible/normal/960/960/imgdb/resize/2019/0121/00501111_20190121.JPG',
                      ),
                    ),
                  ),
                  Gaps.v10,
                  const Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    'This is a very log caption for my tiktok that um upload just now currently',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gaps.v8,
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 14,
                          backgroundImage: NetworkImage(
                            'https://i.pinimg.com/236x/5c/8f/15/5c8f1559b8cf6f2d27f012f5b94f626d.jpg',
                          ),
                        ),
                        Gaps.h5,
                        const Expanded(
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            'My avatar is going to be very long.',
                          ),
                        ),
                        Gaps.h4,
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size16,
                          color: Colors.grey.shade600,
                        ),
                        Gaps.h3,
                        const Text(
                          '2.5M',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size24,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
