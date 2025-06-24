import 'package:flutter/material.dart';
import 'package:untitled/ui/components/forms/button_icon.dart';

class CountField extends StatefulWidget {
  const CountField({super.key});

  @override
  State<CountField> createState() => _CountFieldState();
}

class _CountFieldState extends State<CountField> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 55,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.black12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonIcon(
            icon: Icons.remove,
            onPressed: () {
              setState(() {
                if (_count > 1)
                  _count--;
              });
            },
          ),
          Text("$_count"),
          ButtonIcon(
            icon: Icons.add,
            onPressed: () {
              setState(() {
                _count++;
              });
            },
          ),
        ],
      ),
    );
  }
}
