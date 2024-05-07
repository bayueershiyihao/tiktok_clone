import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constans/gaps.dart';
import 'package:tiktok_clone/constans/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  final index;
  const ChatDetailScreen({super.key, this.index});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: 25,
                foregroundImage: NetworkImage(
                  'https://i.pinimg.com/236x/5c/8f/15/5c8f1559b8cf6f2d27f012f5b94f626d.jpg',
                ),
                child: Text(
                  '재원',
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 14,
                  width: 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.green,
                  ),
                ),
              )
            ],
          ),
          title: const Text(
            'JaeWon',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text('Active now'),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
              ),
              Gaps.h24,
              FaIcon(
                FontAwesomeIcons.ellipsis,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
              horizontal: Sizes.size14,
            ),
            itemBuilder: (context, index) {
              var isMine = index % 2 == 0;
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                      Sizes.size14,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isMine ? Colors.blue : Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(
                          Sizes.size20,
                        ),
                        topRight: const Radius.circular(
                          Sizes.size20,
                        ),
                        bottomLeft: Radius.circular(
                          isMine ? Sizes.size20 : Sizes.size1,
                        ),
                        bottomRight: Radius.circular(
                          isMine ? Sizes.size4 : Sizes.size20,
                        ),
                      ),
                    ),
                    child: const Text(
                      'this is a message',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Gaps.v10,
            itemCount: 10,
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Send a message...',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              Sizes.size28,
                            ),
                            topRight: Radius.circular(
                              Sizes.size28,
                            ),
                            bottomLeft: Radius.circular(
                              Sizes.size28,
                            ),
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.faceSmile,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  Container(
                    child: FaIcon(
                      FontAwesomeIcons.paperPlane,
                      color: Colors.grey.shade500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
