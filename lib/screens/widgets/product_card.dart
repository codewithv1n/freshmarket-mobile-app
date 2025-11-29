import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final String imgUrl;

  const ProductCard({
    required this.name,
    required this.price,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(imgUrl, height: 90, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('₱$price / kilo', style: TextStyle(color: Colors.green)),
            Spacer(),
            ElevatedButton(onPressed: () {}, child: Text("Add to Cart")),
          ],
        ),
      ),
    );
  }
}
