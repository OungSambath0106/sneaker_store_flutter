import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Your Order',
          style: TextStyle(color: AppColors.icon),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.icon),
      ),
      body: Container(
        color: AppColors.bgColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderStatus(),
              const SizedBox(height: 10),
              Expanded(child: OrderList()),
              OrderSummary(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your order status'),
              Text(
                'Pending',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date'),
              Text(
                '24 June 2023 3:30PM',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order number'),
              Text(
                '#002374',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Payment Method'),
              Text(
                'ABA Bank',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  final List<OrderItem> items = [
    OrderItem(
        name: 'Jordan 1 Retro High Off-White University Blue',
        price: 799.99,
        oldPrice: 899.99,
        image: 'assets/products/nikeshoes1.png',
        quantity: 2),
    OrderItem(
        name: 'Jordan 1 Retro High Off-White Chicago',
        price: 799.99,
        oldPrice: 899.99,
        image: 'assets/products/nikeshoes2.png',
        quantity: 2),
    OrderItem(
        name: 'Air Jordan 1 Retro Black Toe',
        price: 799.99,
        oldPrice: 899.99,
        image: 'assets/products/nikeshoes4.png',
        quantity: 2),
    OrderItem(
        name: 'Nike Dunk Low Celtic (2004)',
        price: 799.99,
        oldPrice: 899.99,
        image: 'assets/products/nikeshoes6.png',
        quantity: 2),
    OrderItem(
        name: 'Adidas Barricade 2016 XJ Unisex Baby Trainers',
        price: 799.99,
        oldPrice: 899.99,
        image: 'assets/products/adidas3.png',
        quantity: 2),
    OrderItem(
        name: 'Adidas EQT Running Guidance',
        price: 799.99,
        oldPrice: 899.99,
        image: 'assets/products/adidas5.png',
        quantity: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: OrderListItem(item: item),
        );
      },
    );
  }
}

class OrderListItem extends StatelessWidget {
  final OrderItem item;

  OrderListItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(item.image,
                  width: 90, height: 90, fit: BoxFit.contain),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '\$${item.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '\$${item.oldPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ReviewS(),
                        //   ),
                        // );
                      },
                      child: const Text(
                        'Review',
                        style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('x${item.quantity}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Amount'),
              Text('\$84.00'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Discount'),
              Text(
                '\$40.00',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('VAT'),
              Text('\$2.00'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery'),
              Text('\$0.00'),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Amount',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('\$46.00', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderItem {
  final String name;
  final double price;
  final double oldPrice;
  final String image;
  final int quantity;

  OrderItem({
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.image,
    required this.quantity,
  });
}
