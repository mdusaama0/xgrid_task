import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xgrid_task/repository/product_repo.dart';

import '../model/product_model.dart';

final productProvider = ChangeNotifierProvider.autoDispose(
  (ref) => ProductViewModel(),
);

class ProductViewModel extends ChangeNotifier {
  late ProductRepo productRepo;
  var cartList = <CartProduct>[];
  var recommendedList = <RecommendedProductsProduct>[];

  ProductViewModel() {
    productRepo = ProductRepo();
    getCartProducts();
    getRecommendedProducts();
  }

  getCartProducts() async {
    final response = await productRepo.getProduct();
    cartList = response.data!.cart!.products!;
    notifyListeners();
  }

  getRecommendedProducts() async {
    final response = await productRepo.getProduct();
    recommendedList = response.data!.recommendedProducts!.products!;
    notifyListeners();
  }

  removeFromCart(int index) {
    cartList.removeAt(index);
    notifyListeners();
  }
}
