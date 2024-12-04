
import 'package:flutter/material.dart';

import '../../widgets/main_screen_widgets/tab_item.dart';
import '_widgets/chat_group_item.dart';

class CirclesMain extends StatelessWidget {
  CirclesMain({super.key});

  final List<ChatGroup> chatGroups = [
    ChatGroup(
      avatarUrls: [
        "assets/images/Rectangle 4487-1.png",
        "assets/images/Rectangle 4487-2.png",
        "assets/images/Rectangle 4487-3.png"
      ],
      groupName: 'Ramses Club',
      lastMessage: 'Ali: Coach was sleep',
    ), ChatGroup(
      avatarUrls: [
        "assets/images/Rectangle 4487-3.png",
        "assets/images/Rectangle 4487-1.png",
        "assets/images/Rectangle 4487-2.png"
      ],
      groupName: 'Friday night match',
      lastMessage: 'Saad: المعلب كان مقفول ',
    ),
    // Add more ChatGroup items here
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Circles',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFFE6EFFF),
              ),
              child: const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: Color(0xFF0560FD),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                tabs: [
                  TabItem(title: 'My Circles', count: 933),
                  TabItem(title: 'Circles Arena', count: 2),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: chatGroups.length,
              itemBuilder: (context, index) {
                final chatGroup = chatGroups[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChatGroupItem(
                    avatarUrls: chatGroup.avatarUrls,
                    groupName: chatGroup.groupName,
                    lastMessage: chatGroup.lastMessage,
                  ),
                );
              },
            ),
            const Center(child: Text("There's no any circle here yet")),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF0560FD),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ChatGroup {
  final List<String> avatarUrls;
  final String groupName;
  final String lastMessage;

  ChatGroup({
    required this.avatarUrls,
    required this.groupName,
    required this.lastMessage,
  });
}
