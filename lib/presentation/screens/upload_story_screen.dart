import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import '../../data/repositories/story_repository.dart';

class UploadStoryScreen extends StatefulWidget {
  final String userId;

  UploadStoryScreen({required this.userId});

  @override
  _UploadStoryScreenState createState() => _UploadStoryScreenState();
}

class _UploadStoryScreenState extends State<UploadStoryScreen> {
  File? _storyImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _storyImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadStory() async {
    if (_storyImage != null) {
      String filePath = 'stories/${DateTime.now().millisecondsSinceEpoch}.png';
      try {
        await FirebaseStorage.instance.ref(filePath).putFile(_storyImage!);
        String imageUrl = await FirebaseStorage.instance.ref(filePath).getDownloadURL();
        await StoryRepository().addStory(widget.userId, imageUrl);
        Navigator.pop(context); // Go back to the previous screen
      } catch (e) {
        print("Error uploading story: $e");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error uploading story: $e')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select an image.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Story')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _storyImage != null ? FileImage(_storyImage!) : null,
                child: _storyImage == null ? Icon(Icons.camera_alt, size: 50) : null,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadStory,
              child: Text('Upload Story'),
            ),
          ],
        ),
      ),
    );
  }
}