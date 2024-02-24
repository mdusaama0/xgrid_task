import 'package:flutter/material.dart';

class RecommendedProductWidget extends StatelessWidget {
  final String image;

  final String desc;

  final String tPrice;
  const RecommendedProductWidget({
    super.key,
    required this.image,
    required this.desc,
    required this.tPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            desc,
            maxLines: 2,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            tPrice,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Pick an option',
            style: TextStyle(color: Colors.purple),
          ),
        ],
      ),
    );
  }
}
