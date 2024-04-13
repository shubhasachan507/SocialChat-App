import "package:flutter/material.dart";

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: NetworkImage(
                  "https://t3.ftcdn.net/jpg/02/95/94/94/360_F_295949484_8BrlWkTrPXTYzgMn3UebDl1O13PcVNMU.jpg",
                ),
                fit: BoxFit.cover),
            shape: BoxShape.circle,
            border: Border.all(width: 10, color: Colors.purple.shade900),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 140,
          child: InkWell(
            onTap: () {},
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
