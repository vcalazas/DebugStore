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
          image:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        ),
      );
    }
  }
}
