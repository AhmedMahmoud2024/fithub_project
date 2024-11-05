import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/presentation/screens/registration_screen.dart';
import '../blocs/user_cubit.dart';
import 'chat_list_screen.dart'; // Import the ChatListScreen

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if (state.error != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!)));
                }
                if (state.user != null) {
                  // Navigate to ChatListScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatListScreen(
                        userId: state.user!.uid, // Assuming UserEntity has an id field
                        userName: state.user!.uid,
                        userImage: state.user!.uid, // Assuming UserEntity has a profileImage field
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return state.isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    context.read<UserCubit>().signIn(
                      emailController.text,
                      passwordController.text,
                    );
                  },
                  child: Text('Login'),
                );
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}