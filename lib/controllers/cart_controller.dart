import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/models/product_data.dart';

class CartController extends GetxController {
  var productList = <ProductData>[].obs;

  static CartController getInstance() {
    CartController? controller;
    try {
      controller = Get.find();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    controller ??= Get.put(CartController(), permanent: true);
    return controller!;
  }

  void addProduct(ProductData data) {
    productList.add(data);
    Get.snackbar(
      "Produto Adicionado!", // Título
      "${data.name} foi adicionado ao carrinho.", // Mensagem
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.all(10),
      borderRadius: 8,
    );
  }
}
