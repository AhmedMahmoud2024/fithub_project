import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class NewChatScreen extends StatefulWidget {
  final String userId;

  NewChatScreen({required this.userId});

  @override
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  List<UserModel> users = [];
  List<String> selectedUserIds = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  void _fetchUsers() {
    FirebaseFirestore.instance.collection('users').snapshots().listen((snapshot) {
      setState(() {
        users = snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
      });
    });
  }

  Future<void> _createChat() async {
    if (selectedUserIds.isNotEmpty) {
      // Create a new chat document in Firestore
      await FirebaseFirestore.instance.collection('chats').add({
        'participants': [widget.userId, ...selectedUserIds],
        'lastMessage': '',
        'timestamp': FieldValue.serverTimestamp(),
      });
      Navigator.pop(context); // Go back to the chat list
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select at least one participant.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Chat')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return CheckboxListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email), // Assuming UserModel has an email field
                    value: selectedUserIds.contains(user.id), // Assuming UserModel has an id field
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedUserIds.add(user.id);
                        } else {
                          selectedUserIds.remove(user.id);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _createChat,
              child: Text('Create Chat'),
            ),
          ],
        ),
      ),
    );
  }
}