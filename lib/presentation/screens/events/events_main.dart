
import 'package:flutter/material.dart';

import '../../widgets/main_screen_widgets/tab_item.dart';

class EventsMain extends StatelessWidget {
  const EventsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Events and Activities',
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
              child:const  ClipRRect(
                borderRadius:  BorderRadius.all(Radius.circular(10)),
                child:  TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Color(0xFF0560FD),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    TabItem(title: 'current events', count: 933),
                    TabItem(title: 'My events', count: 2),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('There are no events near you yet')),
            Center(child: Text("You don't have any event here yet")),
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