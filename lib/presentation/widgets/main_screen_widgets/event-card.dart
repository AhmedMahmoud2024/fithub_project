import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String status;
  final String capacity;
  final String eventName;
  final String date;

  const EventCard({super.key, 
    required this.imageUrl,
    this.status = "",
    required this.capacity,
    required this.eventName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Image.asset(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(imageUrl), // Your image path
                      fit: BoxFit.cover,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                // Event Image
                // Status Label
                if (status.isNotEmpty)
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF34040),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFEEBEB),
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          capacity,
                          style: const TextStyle(
                            color: Color(0xFFF1F4F9),
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.people,
                          size: 16,
                          color: Color(0xFFF1F4F9),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Event Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              eventName,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF101C2D),
              ),
            ),
          ),
          // Event Date
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Color(0xFF66768E),
                ),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFF66768E),
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

