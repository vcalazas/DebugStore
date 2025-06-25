import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmptyList extends StatelessWidget {
  String? text;

  EmptyList({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Icon(FontAwesomeIcons.wind, size: 40,),
          ),
          Text("Nada por aqui", style: Theme.of(context).textTheme.titleLarge),
          if (text != null)
            Text(text!, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
