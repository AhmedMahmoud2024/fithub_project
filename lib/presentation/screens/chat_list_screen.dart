import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chat_model.dart';
import '../../data/repositories/chat_repository.dart';
import '../blocs/chat_list_cubit.dart';
import 'chat_screen.dart'; // Import the ChatScreen
import 'new_chat_screen.dart'; // Import the NewChatScreen

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
      body: BlocProvider(
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
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No chats available.'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to New Chat Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewChatScreen(userId: userId),
                          ),
                        );
                      },
                      child: Text('Start a New Chat'),
                    ),
                  ],
                ),
              );
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
    );
  }
}