import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/cart_controller.dart';
import 'package:untitled/controllers/product_controller.dart';
import 'package:untitled/models/product_data.dart';
import 'package:untitled/ui/components/data_display/product_similar_list.dart';
import 'package:untitled/ui/components/forms/button_big.dart';
import 'package:untitled/ui/components/forms/button_icon.dart';
import 'package:untitled/ui/components/forms/count_field.dart';
import 'package:untitled/ui/components/data_display/product_image_list.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductController _productController = ProductController.getInstance();
  final CartController _cartController = CartController.getInstance();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _productController.addListenerId(
      ProductControllerListener.selectProduct,
      _scrollToTop,
    );
    super.initState();
  }

  @override
  void dispose() {
    _productController.removeListenerId(
      ProductControllerListener.selectProduct,
      _scrollToTop,
    );
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      ProductData data = _productController.productSelected.value;
      return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
          title: Center(child: Text(data.name ?? "")),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Icon(Icons.arrow_back),
              ),
              onPressed: () => Get.back(),
            ),
          ),
          actions: [ButtonIcon(onPressed: () {}, icon: Icons.favorite_border)],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          controller: _scrollController,
          child: Container(
            padding: EdgeInsets.only(bottom: 60),
            child: Column(children: [ProductImageList(data), _infos(data)]),
          ),
        ),
        bottomSheet: Container(
          color: Colors.transparent,
          margin: EdgeInsets.all(10),
          child: ButtonBig(
            icon: Icons.shopping_cart_outlined,
            text: "Adicionar ao carrinho",
            onPressed: () {_cartController.addProduct(data);},
          ),
        ),
      );
    });
  }

  Widget _infos(ProductData data) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name ?? "",
            style: Theme.of(context).textTheme.displaySmall!,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    data.valueFormated,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                CountField(),
              ],
            ),
          ),
          Text("Descrição", style: Theme.of(context).textTheme.titleMedium),
          Text(data.description ?? ""),
          Divider(height: 20),
          Text(
            "Produtos similares",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ProductSimilarlist(),
        ],
      ),
    );
  }
}
