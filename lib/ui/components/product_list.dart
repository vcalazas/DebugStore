import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/product_controller.dart';
import 'package:untitled/models/product_data.dart';

class Productlist extends StatefulWidget {
  const Productlist({super.key});

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  ProductController productController = ProductController.getInstance();

  @override
  void initState() {
    productController.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AlignedGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        itemCount: productController.productList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Tile(productController.productList[index]);
        },
      ),
    );
  }
}

class Tile extends StatelessWidget {
  ProductData productData;

  Tile(this.productData);

  void _onSelect() {
    ProductController.getInstance().selectProduct(productData);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onSelect,
      child: Card(
        color: Colors.grey.shade50,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(width: 150, height: 150, color: Colors.grey),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(productData.name ?? ""),
                    Text(
                      productData.valueFormated,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
