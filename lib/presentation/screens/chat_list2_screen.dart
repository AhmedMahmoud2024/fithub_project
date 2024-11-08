import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/presentation/screens/upload_story_screen.dart';
import '../../data/models/chat_model.dart';
import '../../data/repositories/chat_repository.dart';
import '../blocs/chat_list_cubit.dart';
import 'chat_screen.dart'; // Import the ChatScreen
import 'story_screen.dart'; // Import the StoryScreen
import '../../data/repositories/story_repository.dart';
import '../../data/models/story_model.dart';

class ChatListScreen extends StatelessWidget {
  final String userId;
  final String userName;
  final String userImage;

  ChatListScreen({required this.userId, required this.userName, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat List'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // User Information Section
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(userImage),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Text(
                  userName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Stories Section
          Container(
            height: 100,
            child: StreamBuilder<List<StoryModel>>(
              stream: StoryRepository().getStories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No stories available.'));
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final story = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoryScreen(imageUrl: story.imageUrl),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(story.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Chat List Section
          Expanded(
            child: BlocProvider(
              create: (context) => ChatListCubit(ChatRepository())..fetchChats(userId),
              child: BlocBuilder<ChatListCubit, ChatListState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state.error != null) {
                    return Center(child: Text('Error: ${state.error}'));
                  }
                  if (state.chats.isEmpty) {
                    return Center(child: Text('No chats available.'));
                  }
                  return ListView.builder(
                    itemCount: state.chats.length,
                    itemBuilder: (context, index) {
                      final chat = state.chats[index];
                      return ListTile(
                        title: Text(chat.lastMessage),
                        subtitle: Text('Participants: ${chat.participants.join(', ')}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(chatId: chat.id, userId: userId),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UploadStoryScreen(userId: userId),
            ),
          );
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}