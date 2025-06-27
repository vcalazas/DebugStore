import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  String? image;

  MyImage(this.image);

  @override
  Widget build(BuildContext context) {
    if (image != null && image!.contains("assets/")) {
      return Image.asset(
        image!,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
      );
    }
    if (image != null && !image!.contains("assets/")) {
      return Image.network(
        image!,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
      );
    }

    return Container();
  }
}
