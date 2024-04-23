import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

chooseImage(BuildContext context) async {
  final imagePicker = ImagePicker();

  XFile? _file = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select Image Source'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.of(context)
                  .pop(await imagePicker.pickImage(source: ImageSource.camera));
            },
            child: Text('Camera'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(
                  await imagePicker.pickImage(source: ImageSource.gallery));
            },
            child: Text('Gallery'),
          ),
        ],
      );
    },
  );

  if (_file != null) {
    return File(_file.path);
  }
  print("No Image Selected");
}

showSnackbar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.amber.shade600,
      content: Text(title),
    ),
  );
}
