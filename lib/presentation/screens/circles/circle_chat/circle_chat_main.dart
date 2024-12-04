
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../_widgets/avatar_stack.dart';

class CircleChatMain extends StatelessWidget {
  final String groupName;
  final List<String> avatarUrls;

  const CircleChatMain({
    super.key,
    required this.groupName,
    required this.avatarUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:InkWell(onTap: () => context.go("/circles") ,child: const  Icon(Icons.arrow_back)),
        title: Text(groupName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AvatarStack(imageUrls: [
              "assets/images/Rectangle 4487-1.png",
              "assets/images/Rectangle 4487-2.png",
              "assets/images/Rectangle 4487-3.png"
            ]),
            const SizedBox(height: 16),
            Text(
              groupName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Add more details if necessary.
          ],
        ),
      ),
    );
  }
}
