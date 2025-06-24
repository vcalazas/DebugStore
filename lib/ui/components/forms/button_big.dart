import 'package:flutter/cupertino.dart';

class ButtonBig extends StatelessWidget {
  String text;
  IconData? icon;
  Function() onPressed;

  ButtonBig({required this.text, this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [if (icon != null) Icon(icon), Text(text)],
      ),
    );
  }
}
