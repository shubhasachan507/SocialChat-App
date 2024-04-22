import "package:flutter/material.dart";
import "package:socialchatapp/index.dart";

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  saveData() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UserImage(),
        ],
      ),
    );
  }
}
