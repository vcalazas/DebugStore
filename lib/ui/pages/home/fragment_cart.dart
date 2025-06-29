import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/cart_controller.dart';
import 'package:untitled/ui/components/data_display/cart_list.dart';
import 'package:untitled/ui/components/empty_list.dart';
import 'package:untitled/ui/components/forms/button_big.dart';

class FragmentCart extends StatefulWidget {
  const FragmentCart({super.key});

  @override
  State<FragmentCart> createState() => _FragmentCartState();
}

class _FragmentCartState extends State<FragmentCart> {
  final CartController _cartController = CartController.getInstance();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_cartController.productList.isNotEmpty) {
        return Column(
          children: [
            Expanded(child: Cartlist()),
            Container(
              margin: EdgeInsets.all(10),
              child: ButtonBig(
                text: " Finalizar Compra",
                onPressed: () {},
                icon: Icons.shopping_cart,
              ),
            ),
          ],
        );
      }
      return EmptyList(text: "Adicione itens ao carrinho");
    });
  }
}
