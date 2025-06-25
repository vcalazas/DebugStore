import 'package:flutter/material.dart';
import 'package:untitled/ui/pages/home/fragment_profile.dart';

class Maindrawermenu extends StatefulWidget {
  const Maindrawermenu({super.key});

  @override
  State<Maindrawermenu> createState() => _MaindrawermenuState();
}

class _MaindrawermenuState extends State<Maindrawermenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: FragmentProfile()
    );
  }
}
