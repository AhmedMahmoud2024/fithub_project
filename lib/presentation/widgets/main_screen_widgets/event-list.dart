
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'event-card.dart';


class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            'Nearby Events',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 21,
              color: Color(0xFF101C2D),
            ),
          ),
        ),
        SizedBox(height: 18),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
               Gap(14),
                EventCard(
                  imageUrl: 'assets/images/event-2.png',
                  status: 'Now',
                  capacity: '64/100',
                  eventName: 'Weight Lifting',
                  date: '24\\3\\2024',
                ),
                SizedBox(width: 8),
                EventCard(
                  imageUrl: 'assets/images/event-1.png',
                  capacity: '19/20',
                  eventName: 'MaraThon for Gaza',
                  date: '24\\3\\2024',
                ),
                SizedBox(width: 8),
                EventCard(
                  imageUrl: 'assets/images/event-2.png',
                  capacity: '64/100',
                  eventName: 'Football Match',
                  date: '24\\3\\2024',
                ),
              //  Gap(14)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

