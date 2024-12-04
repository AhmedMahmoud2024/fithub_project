import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'avatar_stack.dart';

class ChatGroupItem extends StatelessWidget {
  final List<String> avatarUrls;
  final String groupName;
  final String lastMessage;

  const ChatGroupItem({
    super.key,
    required this.avatarUrls,
    required this.groupName,
    required this.lastMessage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        context.go('/chat/ali_fawzy_Hassan')
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            AvatarStack(imageUrls: avatarUrls),
            const Gap(24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    groupName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF101C2D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lastMessage,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF66768E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
