import 'package:flutter/services.dart';
import 'package:xgrid_task/model/product_model.dart';

class ProductRepo {
  Future<ProductsModel> getProduct() async {
    final response =
        await rootBundle.loadString('lib/data/Mobile-Task-API-Response.json');
    return productsModelFromJson(response);
  }
}
