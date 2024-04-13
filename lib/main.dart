import 'package:flutter/material.dart';
import 'package:socialchatapp/index.dart';

void main() {
  runApp(const SocialChat());
}

class SocialChat extends StatelessWidget {
  const SocialChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthScreen(),
    );
  }
}
