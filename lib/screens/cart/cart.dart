import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/screens/Checkout/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> cartItems = [
    CartItem(
      image: 'assets/products/nikeshoes1.png',
      name: 'Jordan 1 Retro High Off-White University Blue',
      originalprice: 899.99,
      discountPercentage: 30.0,
      quantity: 1,
    ),
    CartItem(
      image: 'assets/products/nikeshoes2.png',
      name: 'Jordan 1 Retro High Off-White Chicago',
      originalprice: 899.99,
      discountPercentage: 30.0,
      quantity: 1,
    ),
    CartItem(
      image: 'assets/products/nikeshoes3.png',
      name: 'Nike Dunk Low Pro SB',
      originalprice: 899.99,
      discountPercentage: 30.0,
      quantity: 1,
    ),
    CartItem(
      image: 'assets/products/nikeshoes4.png',
      name: 'Air Jordan 1 Retro Black Toe',
      originalprice: 899.99,
      discountPercentage: 30.0,
      quantity: 1,
    ),
    CartItem(
      image: 'assets/products/nikeshoes6.png',
      name: 'Nike Dunk Low Celtic (2004)',
      originalprice: 899.99,
      discountPercentage: 30.0,
      quantity: 1,
    ),
    CartItem(
      image: 'assets/products/nikeshoes7.png',
      name: 'Air Jordan 1 Retro High Off-White NRG',
      originalprice: 899.99,
      discountPercentage: 30.0,
      quantity: 1,
    ),
  ];

  void _deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _confirmDeleteItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Item"),
          content: const Text(
              "Are you sure you want to delete this item from your cart?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Delete"),
              onPressed: () {
                _deleteItem(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'MY CART',
          style: TextStyle(color: AppColors.icon),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 80,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        cartItems[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              cartItems[index].name, // Display the full name
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "4.7 (8)", // Update this to reflect actual ratings
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "\$${(cartItems[index].originalprice * (1 - cartItems[index].discountPercentage / 100)).toStringAsFixed(2)}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "\$${cartItems[index].originalprice}",
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, color: Colors.brown),
                            onPressed: () {
                              if (cartItems[index].quantity == 1) {
                                _confirmDeleteItem(index);
                              } else {
                                setState(() {
                                  cartItems[index].quantity--;
                                });
                              }
                            },
                          ),
                          Text(
                            '${cartItems[index].quantity}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.brown),
                            onPressed: () {
                              setState(() {
                                cartItems[index].quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown, // Background color of the button
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutScreen()),
              );
            },
            child: const Text(
              'Check Out',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class CartItem {
  final String image;
  final String name;
  final double originalprice;
  final double discountPercentage;
  int quantity;

  CartItem({
    required this.image,
    required this.name,
    required this.originalprice,
    required this.discountPercentage,
    this.quantity = 1,
  });
}
