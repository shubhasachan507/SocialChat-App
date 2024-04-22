import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final name = FirebaseAuth.instance.currentUser!.displayName;

  storeProfileImage(String folderName, File file) async {
    Reference ref = firebaseStorage.ref().child(folderName).child(uid);
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    await firebaseFirestore
        .collection('users')
        .doc(uid)
        .update({"profilePic": downloadUrl});
  }
}
