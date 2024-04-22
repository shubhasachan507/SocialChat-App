import "dart:io";

import "package:flutter/material.dart";
import "package:socialchatapp/index.dart";
import "package:socialchatapp/view/utility/utils.dart";

class UserImage extends StatefulWidget {
  const UserImage({
    super.key,
  });

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  File? _image;

  selectImage() async {
    File? im = await chooseImage(context);

    setState(() {
      _image = im;
    });

    StorageMethods().storeProfileImage('profilepics', im!);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: _image != null
                ? DecorationImage(
                    image: FileImage(File(_image!.path)), fit: BoxFit.cover)
                : const DecorationImage(
                    image: NetworkImage(
                      "https://www.shutterstock.com/image-vector/user-icon-trendy-flat-style-260nw-418179865.jpg",
                    ),
                    scale: 7,
                    fit: BoxFit.contain),
            shape: BoxShape.circle,
            border: Border.all(width: 10, color: Colors.purple.shade900),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 140,
          child: InkWell(
            onTap: selectImage,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.orange.shade300,
                shape: BoxShape.circle,
                border: Border.all(width: 4, color: Colors.white),
              ),
              child: const Icon(
                Icons.camera_alt_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
