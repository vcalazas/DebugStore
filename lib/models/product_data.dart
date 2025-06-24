import 'package:intl/intl.dart';

class ProductData {
  String? name, description;
  int? value;

  List<String>? images;

  String get valueFormated {
    return "R\$ ${NumberFormat("#,##0.00", "pt_BR").format(value == null ? 0 : (value ?? 0) / 100)}";
  }

  ProductData();

  ProductData.mock({this.name, this.value, this.description, this.images});
}
