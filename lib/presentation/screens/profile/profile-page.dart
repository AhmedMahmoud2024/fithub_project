
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'circle-list.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ProfileBackgroundImage(),
                    ),
                    ProfileAvatar(),
                  ],
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0.0, -48.0, 0.0),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: ProfileCard(),
                    ),
                    Gap(24),
                    CirclesWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileBackgroundImage extends StatelessWidget {
  const ProfileBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/profile-cover.png', fit: BoxFit.cover,
      width: double.infinity,
      height: 138, // Setting the fixed height as per the design
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      // Adjust the padding as needed
      child: Container(
        transform: Matrix4.translationValues(0.0, -63.0, 0.0),
        // Positioning the avatar
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white, width: 4.0, // Adjust border width
            ),
          ),
          child: const CircleAvatar(
            radius: 60, // Adjust as necessary to fit the design
            backgroundImage: AssetImage('assets/images/profile-image.png'),
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        UserInfo(),
        Gap(12),
        FollowInfo(),
        Gap(12),
        Bio(),
      ],
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Fateen Bilal',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF101C2D),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/egypt-flag.svg',
              width: 24,
              height: 24,
            ),
          ],
        ),
        const Gap(4),
        const Text(
          '@bilal',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Color(0xFF66768E),
          ),
        ),
      ],
    );
  }
}

class FollowInfo extends StatelessWidget {
  const FollowInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '125 Following',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 24.0),
        Text(
          '10 Followers',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class Bio extends StatelessWidget {
  const Bio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'I am a fitness enthusiast and a personal trainer. I love to help people achieve their fitness goals. Let\'s get fit together!',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF2F3A4C),
        height: 1.6,
      ),
    );
  }
}
