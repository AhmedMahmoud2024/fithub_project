import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CirclesWidget extends StatelessWidget {
  const CirclesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeaderSection(),
        SizedBox(height: 14),
        ProfileCardList(),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Circles',
            style: TextStyle(
              color: Color(0xFF101C2D),
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          Text(
            'More',
            style: TextStyle(
              color: Color(0xFF0560FD),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCardList extends StatelessWidget {
  const ProfileCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Gap(14),
          ProfileCard(
              image: 'assets/images/Rectangle 4487-1.png',
              name: 'Pyramids club'),
          SizedBox(width: 14),
          ProfileCard(
              image: 'assets/images/Rectangle 4487-2.png', name: 'Cairo Maze '),
          SizedBox(width: 14),
          ProfileCard(
              image: 'assets/images/Rectangle 4487.png', name: 'Ramses Tharir'),
          SizedBox(width: 14),
          ProfileCard(
              image: 'assets/images/Rectangle 4487-3.png',
              name: 'السلام العاشر'),
          Gap(14)
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String image;
  final String name;

  const ProfileCard({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFDDE4EE),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.asset(image, height: 72, fit: BoxFit.cover),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF2F3A4C),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color(0xFF101C2D),
              elevation: 0,
              side: const BorderSide(
                color: Color(0xFFCCD4E0),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
              'join',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
