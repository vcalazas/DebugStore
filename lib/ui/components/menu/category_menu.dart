import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/product_controller.dart';
import 'package:untitled/models/category_data.dart';

class Categorymenu extends StatefulWidget {
  const Categorymenu({super.key});

  @override
  State<Categorymenu> createState() => _CategorymenuState();
}

class _CategorymenuState extends State<Categorymenu> {
  final ProductController _productController = ProductController.getInstance();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _productController.getCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: _productController.categoryList.length,
          itemBuilder: (context, index) {
            return Obx(() {
              CategoryData data = _productController.categoryList[index];
              bool isSelected =
                  _productController.categorySelected.value.id == data.id;
              return TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
                  ),
                ),
                onPressed: () => _productController.selectCategory(data),
                child: Text(
                  data.name ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isSelected
                        ? Colors.white
                        : Colors.black54,
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
