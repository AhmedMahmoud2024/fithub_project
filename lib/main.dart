import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/firebase_options.dart';
import 'package:whatsapp_clone/presentation/blocs/user_cubit.dart';
import 'package:whatsapp_clone/presentation/screens/Modified%20_Regestration_Screen.dart';
import 'package:whatsapp_clone/presentation/screens/Modified_login_Screen.dart';
import 'package:whatsapp_clone/presentation/screens/gender_selection.dart';
import 'package:whatsapp_clone/presentation/screens/goals.dart';
import 'package:whatsapp_clone/presentation/screens/skill_level.dart';
import 'package:whatsapp_clone/presentation/screens/weight_hight_screen.dart';
import 'package:whatsapp_clone/presentation/widgets/weight_height_widget.dart';
import 'data/repositories/user_repository.dart';
import 'data/data_sources/firebase_data_source.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/register_user.dart';
import 'domain/usecases/sign_in-user.dart';
import 'presentation/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
  final firebaseDataSource = FirebaseDataSource();
  final userRepository = UserRepositoryImpl(firebaseDataSource);

  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(
        registerUser: RegisterUser(userRepository),
        signInUser: SignInUser(userRepository),
      ),
      child: MaterialApp(
        title: 'Chat App',
        theme: ThemeData.light(),
        home: GoalsScreen(),
      ),
    );
  }
}