import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String chatId;
  final String userId;

  ChatScreen({required this.chatId, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Center(child: Text('Chat ID: $chatId')),
    );
  }
}