import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class Authentication {
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  //SignUn User and Save their username
  Future<String> signUpUser(
      {required String email,
      required String password,
      required String userName}) async {
    String result = "Something went wrong";
    try {
      if (email.isNotEmpty && password.isNotEmpty && userName.isNotEmpty) {
        UserCredential credential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        debugPrint("User ID------>${credential.user!.uid}");

        await firebaseFirestore
            .collection('users')
            .doc(credential.user!.uid)
            .set({
          "username": userName,
          "email": email,
          "followers": [],
          "following": [],
          "profilePic": "",
        });
        result = "Success";
      }
    } catch (error) {
      result = error.toString();
    }
    return result;
  }

  Future<String> logInUser(
      {required String email, required String password}) async {
    String result = "Something went wrong";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential credential = await firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password);
      }
      result = "Success";
    } catch (error) {
      result = error.toString();
    }
    return result;
  }
}
