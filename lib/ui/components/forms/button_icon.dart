import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  IconData icon;
  Function() onPressed;

  ButtonIcon({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: Icon(icon),
    ));
  }
}
