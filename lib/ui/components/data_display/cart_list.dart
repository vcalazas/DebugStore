import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/cart_controller.dart';
import 'package:untitled/controllers/product_controller.dart';
import 'package:untitled/models/cart_product_data.dart';
import 'package:untitled/models/product_data.dart';
import 'package:untitled/ui/components/forms/button_icon.dart';
import 'package:untitled/ui/components/forms/count_field.dart';
import 'package:untitled/ui/components/my_image.dart';

class Cartlist extends StatefulWidget {
  const Cartlist({super.key});

  @override
  State<Cartlist> createState() => _CartlistState();
}

class _CartlistState extends State<Cartlist> {
  final CartController _cartController = CartController.getInstance();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: _cartController.productList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Tile(_cartController.productList[index]);
        },
      ),
    );
  }
}

class Tile extends StatelessWidget {
  CartProcudtData cartProductData;

  Tile(this.cartProductData);

  void _onSelect() {
    ProductController.getInstance().selectProduct(cartProductData.productData);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onSelect,
      child: Card(
        color: Colors.grey.shade50,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  MyImage(
                    cartProductData.productData.images!.first,
                    width: 100,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  // color: Colors.amber,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartProductData.productData.name ?? "",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        cartProductData.productData.valueFormated,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CountField(
                        initialCount: cartProductData.quantity,
                        onChange: (count) {
                          CartController.getInstance().setQuantity(
                            cartProductData,
                            count,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              ButtonIcon(icon: Icons.delete, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
