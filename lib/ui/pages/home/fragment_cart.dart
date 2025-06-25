import 'package:flutter/material.dart';
import 'package:untitled/ui/components/empty_list.dart';

class FragmentCart extends StatefulWidget {
  const FragmentCart({super.key});

  @override
  State<FragmentCart> createState() => _FragmentCartState();
}

class _FragmentCartState extends State<FragmentCart> {
  @override
  Widget build(BuildContext context) {
    return EmptyList(text: "Adicione itens ao carrinho",);
  }
}
