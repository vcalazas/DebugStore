import 'package:flutter/material.dart';
import 'package:untitled/ui/components/menu/category_menu.dart';
import 'package:untitled/ui/components/product_list.dart';
import 'package:untitled/ui/components/publicity.dart';

class FragmentHome extends StatelessWidget {
  const FragmentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(children: [Categorymenu(), Publicity(), Productlist()]),
    );
  }
}
