import 'package:flutter/material.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final CartProvider _cart = CartProvider();

  final List<Product> _products = [
    Product(
        name: 'Fresh Tomatoes',
        category: 'Vegetables',
        price: 2.99,
        unit: 'kg',
        image: '🍅'),
    Product(
        name: 'Organic Bananas',
        category: 'Fruits',
        price: 1.99,
        unit: 'kg',
        image: '🍌'),
    Product(
        name: 'Green Lettuce',
        category: 'Vegetables',
        price: 1.49,
        unit: 'piece',
        image: '🥬'),
    Product(
        name: 'Fresh Milk',
        category: 'Dairy',
        price: 3.49,
        unit: 'liter',
        image: '🥛'),
    Product(
        name: 'Red Apples',
        category: 'Fruits',
        price: 3.99,
        unit: 'kg',
        image: '🍎'),
    Product(
        name: 'Carrots',
        category: 'Vegetables',
        price: 1.79,
        unit: 'kg',
        image: '🥕'),
    Product(
        name: 'Strawberries',
        category: 'Fruits',
        price: 4.99,
        unit: 'box',
        image: '🍓'),
    Product(
        name: 'Fresh Eggs',
        category: 'Dairy',
        price: 4.49,
        unit: 'dozen',
        image: '🥚'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fresh Market'),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(cart: _cart),
                    ),
                  );
                },
              ),
              if (_cart.itemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints:
                        const BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '${_cart.itemCount}',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: _selectedIndex == 0 ? _buildHomeTab() : _buildProfileTab(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // --- Home Tab ---
  Widget _buildHomeTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.green[700],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome back!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'What would you like to buy today?',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Categories',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCategoryCard('Fruits', Icons.apple, Colors.orange),
                      _buildCategoryCard('Vegetables', Icons.eco, Colors.green),
                      _buildCategoryCard(
                          'Dairy', Icons.water_drop, Colors.blue),
                      _buildCategoryCard('Meat', Icons.set_meal, Colors.red),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Fresh Products',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: _products.length,
                  itemBuilder: (context, index) =>
                      _buildProductCard(_products[index]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets ---
  Widget _buildCategoryCard(String title, IconData icon, Color color) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Center(
                  child: Text(product.image,
                      style: const TextStyle(fontSize: 60))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text('\$${product.price.toStringAsFixed(2)}/${product.unit}',
                    style: TextStyle(
                        color: Colors.green[700], fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() => _cart.addToCart(product));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('${product.name} added to cart'),
                            duration: const Duration(seconds: 1)),
                      );
                    },
                    icon: const Icon(Icons.add_shopping_cart, size: 16),
                    label: const Text('Add', style: TextStyle(fontSize: 12)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Profile Tab ---
  Widget _buildProfileTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
        const SizedBox(height: 16),
        const Text('John Doe',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('john.doe@email.com',
            textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 32),
        _buildProfileOption(Icons.shopping_bag, 'My Orders'),
        _buildProfileOption(Icons.location_on, 'Delivery Address'),
        _buildProfileOption(Icons.payment, 'Payment Methods'),
        _buildProfileOption(Icons.notifications, 'Notifications'),
        _buildProfileOption(Icons.help, 'Help & Support'),
        _buildProfileOption(Icons.settings, 'Settings'),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          icon: const Icon(Icons.logout, color: Colors.red),
          label: const Text('Logout', style: TextStyle(color: Colors.red)),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            side: const BorderSide(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
