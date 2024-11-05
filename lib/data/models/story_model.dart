import 'package:cloud_firestore/cloud_firestore.dart';

class StoryModel{
  final String id;
  final String userId ;
  final String imageUrl;
  final DateTime timestamp;

  StoryModel({required this.id, required this.userId, required this.imageUrl, required this.timestamp});
factory StoryModel.fromJson(Map<String,dynamic>json,String id){
  return StoryModel(
      id: id,
      userId: json['userId'],
      imageUrl: json['imageUrl'],
      timestamp: (json['timestamp'] as Timestamp).toDate()
  );
}
}