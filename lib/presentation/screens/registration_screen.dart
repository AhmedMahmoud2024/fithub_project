import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../domain/entities/user_entity.dart';
import '../blocs/user_cubit.dart';
import 'chat_list_screen.dart'; // Import the ChatListScreen
import 'package:firebase_storage/firebase_storage.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<String> _uploadImageToStorage(File file) async {
    try {
      String filePath = 'profile_images/${DateTime.now().millisecondsSinceEpoch}.png';
      await FirebaseStorage.instance.ref(filePath).putFile(file);
      return await FirebaseStorage.instance.ref(filePath).getDownloadURL();
    } catch (e) {
      print("Error uploading image: $e");
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                child: _profileImage == null ? Icon(Icons.camera_alt, size: 50) : null,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
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
                        userName: state.userEntity!.name,
                        userImage: state.userEntity!.profileImage, // Assuming UserEntity has a profileImage field
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return state.isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () async {
                    if (_profileImage != null) {
                      // Upload image to Firebase Storage
                      String imageUrl = await _uploadImageToStorage(_profileImage!);
                      if (imageUrl.isNotEmpty) {
                        final userEntity = UserEntity(
                          name: nameController.text,
                          phone: phoneController.text,
                          profileImage: imageUrl, // Use the uploaded image URL
                        );
                        context.read<UserCubit>().register(
                          emailController.text,
                          passwordController.text,
                          userEntity,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image upload failed.')));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select an image.')));
                    }
                  },
                  child: Text('Register'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}