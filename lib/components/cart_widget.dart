import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final String dPrice;
  final String tPrice;
  final VoidCallback onPressDelete;

  const CartWidget({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.dPrice,
    required this.tPrice,
    required this.onPressDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              image,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          desc,
                          maxLines: 2,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      IconButton(
                        onPressed: onPressDelete,
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                  Text(
                    dPrice,
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    tPrice,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
