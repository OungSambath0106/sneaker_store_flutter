import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/products/nikeshoes1.png',
      'name': 'Jordan 1 Retro High Off-White University Blue',
      'price': 799.99,
      'oldPrice': 899.99,
      'discount': 30,
      'rating': 4.7,
      'reviews': 8,
      'isFavorite': true,
    },
    {
      'image': 'assets/products/nikeshoes2.png',
      'name': 'Jordan 1 Retro High Off-White Chicago',
      'price': 799.99,
      'oldPrice': 899.99,
      'discount': 30,
      'rating': 4.7,
      'reviews': 8,
      'isFavorite': true,
    },
    {
      'image': 'assets/products/nikeshoes6.png',
      'name': 'Nike Dunk Low Celtic (2004)',
      'price': 799.99,
      'oldPrice': 899.99,
      'discount': 30,
      'rating': 4.7,
      'reviews': 8,
      'isFavorite': true,
    },
    {
      'image': 'assets/products/nikeshoes7.png',
      'name': 'Air Jordan 1 Retro High Off-White NRG',
      'price': 799.99,
      'oldPrice': 899.99,
      'discount': 30,
      'rating': 4.7,
      'reviews': 8,
      'isFavorite': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'FAVORITE',
          style: TextStyle(color: AppColors.icon),
        ),
        iconTheme: const IconThemeData(color: AppColors.icon),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.bgColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(3),
                    height: 120,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.container,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: AppColors.icon),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            product['image'],
                            width: 130,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    '${product['rating']}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    '(${product['reviews']})',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  if (product['discount'] != null)
                                    Text(
                                      "\$${product['price'].toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  if (product['discount'] != null)
                                    const SizedBox(width: 4.0),
                                  if (product['discount'] != null)
                                    Text(
                                      "\$${product['oldPrice'].toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  if (product['discount'] == null)
                                    Text(
                                      "\$${product['price'].toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        IconButton(
                          icon: Icon(
                            product['isFavorite']
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              product['isFavorite'] = !product['isFavorite'];
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // Add spacing between items, except for the last item
                  if (index < products.length - 1) const SizedBox(height: 8.0),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
