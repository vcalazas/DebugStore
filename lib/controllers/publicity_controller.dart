import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:untitled/models/product_data.dart';
import 'package:untitled/models/publicity_data.dart';

class PublicityController extends GetxController {
  var publicityList = <PublicityData>[].obs;

  static PublicityController getInstance() {
    PublicityController? controller;
    try {
      controller = Get.find();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    controller ??= Get.put(PublicityController(), permanent: true);
    return controller!;
  }

  void getPublicity() async {
    publicityList.clear();
    for (int i = 0; i < 5; i++) {
      publicityList.add(
        PublicityData.mock(
          id: i,
          image: 'assets/images/banner.png',
        ),
      );
    }
  }
}
