import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String id;
  final List<String> participants;
  final String lastMessage;
  final DateTime timestamp;

  ChatModel({
    required this.id,
    required this.participants,
    required this.lastMessage,
    required this.timestamp,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json, String id) {
    return ChatModel(
      id: id,
      participants: List<String>.from(json['participants']),
      lastMessage: json['lastMessage'] ?? '',
      timestamp: (json['timestamp'] as Timestamp).toDate(),
    );
  }
}