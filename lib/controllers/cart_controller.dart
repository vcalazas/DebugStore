import 'package:flutter/foundation.dart';
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
  }
}
