import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  String? image;
  double? width;

  MyImage(this.image, {this.width});

  @override
  Widget build(BuildContext context) {
    if (image != null && image!.contains("assets/")) {
      return Image.asset(
        image!,
        fit: BoxFit.cover,
        width: width,
      );
    }
    if (image != null && !image!.contains("assets/")) {
      return Image.network(
        image!,
        fit: BoxFit.cover,
        width: width,
      );
    }

    return Container();
  }
}
