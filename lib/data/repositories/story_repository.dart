import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_clone/data/models/story_model.dart';

class StoryRepository{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  Stream<List<StoryModel>> getStories() {
    return _firestore.collection('stories').orderBy('timestamp', descending: true).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => StoryModel.fromJson(doc.data(), doc.id)).toList();
    });
  }

  Future<void> addStory(String userId,imageUrl)async{
await _firestore.collection('stories').add({
  'userId':userId,
  'imageUrl':imageUrl,
  'timestamp':FieldValue.serverTimestamp()
});
  }
}