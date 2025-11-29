import 'package:flutter/material.dart';
import 'package:freshmarketapp/screens/widgets/product_card.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {"name": "Tomato", "price": 30, "img": "https://via.placeholder.com/150"},
    {"name": "Carrots", "price": 25, "img": "https://via.placeholder.com/150"},
    {"name": "Banana", "price": 50, "img": "https://via.placeholder.com/150"},
    {"name": "Mango", "price": 80, "img": "https://via.placeholder.com/150"},
    {"name": "Mango", "price": 80, "img": "https://via.placeholder.com/150"},
    {"name": "Mango", "price": 80, "img": "https://via.placeholder.com/150"},
    {"name": "Mango", "price": 80, "img": "https://via.placeholder.com/150"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fresh Market App'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          var item = products[index];
          return ProductCard(
            name: item["name"],
            price: item["price"],
            imgUrl: item["img"],
          );
        },
      ),
    );
  }
}
