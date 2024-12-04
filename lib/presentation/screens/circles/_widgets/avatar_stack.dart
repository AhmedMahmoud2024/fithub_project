import 'package:flutter/material.dart';

class AvatarStack extends StatelessWidget {
  final List<String> imageUrls;

  const AvatarStack({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54, // Based on the overlapping nature and initial width.
      height: 54,
      child: Stack(
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 16.0,
            top: -4,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(imageUrls[2]),
            ),
          ),

          Positioned(
              bottom: -4,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(imageUrls[0]),
                ),
              )),
          Positioned(
              left: 28.0,
              bottom: -4,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(imageUrls[1]),
                ),
              )),
        ],
      ),
    );
  }
}
