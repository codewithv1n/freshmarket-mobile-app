// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';

class PaymentMethod {
  final String name;
  final IconData icon;
  final String description;

  PaymentMethod(
      {required this.name, required this.icon, required this.description});
}

class PaymentScreen extends StatefulWidget {
  final CartProvider cart;

  const PaymentScreen({Key? key, required this.cart}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedPaymentIndex = 0;

  final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(
      name: 'Credit/Debit Card',
      icon: Icons.credit_card,
      description: 'Pay with your card',
    ),
    PaymentMethod(
      name: 'Cash on Delivery',
      icon: Icons.money,
      description: 'Pay when you receive',
    ),
    PaymentMethod(
      name: 'Digital Wallet',
      icon: Icons.account_balance_wallet,
      description: 'PayPal, Google Pay, etc.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Payment Method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _paymentMethods.length,
              itemBuilder: (context, index) {
                final method = _paymentMethods[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Icon(method.icon),
                    title: Text(method.name),
                    subtitle: Text(method.description),
                    trailing: Radio(
                      value: index,
                      groupValue: _selectedPaymentIndex,
                      onChanged: (value) {
                        setState(() => _selectedPaymentIndex = value as int);
                      },
                    ),
                    onTap: () => setState(() => _selectedPaymentIndex = index),
                  ),
                );
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle order placement
                  widget.cart.items.clear();
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Order Placed!'),
                      content: Text(
                          'Paid via ${_paymentMethods[_selectedPaymentIndex].name}.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close dialog
                            Navigator.pop(context); // Close Payment
                            Navigator.pop(context); // Close Cart
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                    'Place Order (\$${widget.cart.totalPrice.toStringAsFixed(2)})'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
