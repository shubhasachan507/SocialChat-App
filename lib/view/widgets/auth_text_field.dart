import "package:flutter/material.dart";
import "package:socialchatapp/index.dart";

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.inputType,
    required this.obscuretext,
  });

  final TextEditingController controller;
  final String label;
  final TextInputType inputType;
  final bool obscuretext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscuretext,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            label: Text(label),
            labelStyle: TextStyle(color: Colors.teal.shade900),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Appcolors.myPurple),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Appcolors.myPurple),
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}
