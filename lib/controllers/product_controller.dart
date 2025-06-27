import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:untitled/models/category_data.dart';
import 'package:untitled/models/product_data.dart';
import 'package:untitled/ui/pages/product_details.dart';

enum ProductControllerListener { selectProduct }

class ProductController extends GetxController {
  var productSelected = ProductData().obs;
  var productList = <ProductData>[].obs;
  var productSimilarList = <ProductData>[].obs;

  var categorySelected = CategoryData.mock(id: 0, name: "categoria 0").obs;
  var categoryList = <CategoryData>[].obs;

  static ProductController getInstance() {
    ProductController? controller;
    try {
      controller = Get.find();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    controller ??= Get.put(ProductController(), permanent: true);
    return controller!;
  }

  void selectProduct(ProductData data) {
    productSelected.value = data;
    if (Get.currentRoute == "/ProductDetails") {
      update([ProductControllerListener.selectProduct]);
      return;
    }
    Get.to(ProductDetails());
  }

  void selectCategory(CategoryData data) {
    categorySelected.value = data;
  }

  void getCategory() async {
    categoryList.clear();
    for (int i = 0; i < 50; i++) {
      categoryList.add(CategoryData.mock(id: i, name: "categoria $i"));
    }
  }

  void getProducts() async {
    productList.clear();
    for (int i = 0; i < 50; i++) {
      productList.add(
        ProductData.mock(
          name: "Item $i",
          value: 1000,
          images: [
            'assets/images/image.png',
            'assets/images/image.png',
            'assets/images/image.png',
          ],
          description:
              "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.",
        ),
      );
    }
  }

  void getProductsSimilar() async {
    productSimilarList.clear();
    for (int i = 0; i < 6; i++) {
      productSimilarList.add(
        ProductData.mock(
          name: "Item $i",
          value: 1000,
          images: [
            'assets/images/image.png',
            'assets/images/image.png',
            'assets/images/image.png',
          ],
          description:
              "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.",
        ),
      );
    }
  }
}
