import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xgrid_task/view-model/product_view_model.dart';

import '../components/cart_widget.dart';
import '../components/recommended_product_widget.dart';

class CartView extends ConsumerStatefulWidget {
  const CartView({super.key});

  @override
  ConsumerState<CartView> createState() => _CartViewState();
}

class _CartViewState extends ConsumerState<CartView> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(productProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(productProvider).getRecommendedProducts();
            },
            icon: const Icon(
              Icons.ios_share,
              color: Colors.purple,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                itemCount: provider.cartList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = provider.cartList[index];
                  return CartWidget(
                    image: item.thumb!,
                    title: item.manufacturerName!,
                    desc: item.name!,
                    dPrice: item.priceFormatted!,
                    tPrice: item.totalFormatted!,
                    onPressDelete: () => provider.removeFromCart(index),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Products you may like',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Wrap(
                  children: [
                    ...List.generate(
                      provider.recommendedList.length,
                      (index) {
                        final item = provider.recommendedList[index];
                        return RecommendedProductWidget(
                          image: item.thumb!,
                          desc: item.name!,
                          tPrice: item.priceFormated!,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
