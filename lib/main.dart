import 'package:flutter/material.dart';
import 'package:socialchatapp/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:socialchatapp/view/screens/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SocialChat());
}

class SocialChat extends StatelessWidget {
  const SocialChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LogInScreen(),
        '/signUp': (context) => SignUpScreen(),
      },
      home: UserProfile(),
    );
  }
}
