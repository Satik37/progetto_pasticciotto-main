import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  // final int index;
  final String imagePath;

  const ImageWidget({
    super.key,
    //  required this.index,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 150,
        width: double.infinity,
        child: Card(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      );
}
