import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/models/cart_product_data.dart';
import 'package:untitled/ui/pages/home/home.dart';

class CartController extends GetxController {
  var productList = <CartProcudtData>[].obs;

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

  void addProduct(CartProcudtData data) {
    productList.add(data);
    Get.snackbar(
      "Produto Adicionado!",
      "${data.productData.name} foi adicionado ao carrinho.",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.all(10),
      borderRadius: 8,
      onTap: (snack) {
        Get.offAll(() => Home(startPage: HomeStartPage.cart));
      },
    );
  }

  void setQuantity(CartProcudtData data, int quantity) {
    for (int i = 0; i < productList.length; i++) {
      if (productList[i].productData.id == data.productData.id) {
        productList[i].quantity = quantity;
        break;
      }
    }
  }
}
