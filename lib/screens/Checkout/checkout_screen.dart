import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/screens/Checkout/add_address.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedDelivery = 'Vireak Buntham Express';
  final deliveryOptions = [
    {
      'name': 'Vireak Buntham Express',
      'cost': 2.50,
      'image': 'assets/images/vet.jpg',
    },
    {'name': 'J&T Express', 'cost': 2.50, 'image': 'assets/images/j&t.jpg'},
    {
      'name': 'Standard Delivery',
      'cost': 2.00,
      'image': 'assets/images/sneaker.png'
    },
  ];

  double getDeliveryCost() {
    final delivery = deliveryOptions
        .firstWhere((option) => option['name'] == selectedDelivery);
    return delivery['cost'] as double;
  }

  void _showDeliveryOptions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Select Delivery Option',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: deliveryOptions.map(
              (delivery) {
                return ListTile(
                  leading: Image.asset(
                    delivery['image'] as String,
                    width: 40,
                    height: 40,
                  ),
                  title: Text(delivery['name'] as String),
                  trailing: Text('\$${delivery['cost']}'),
                  onTap: () {
                    setState(() {
                      selectedDelivery = delivery['name'] as String;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
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
          'CHECKOUT',
          style: TextStyle(color: AppColors.icon),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.icon),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            const Text(
              'Delivery Address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
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
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddAddress()),
                  );
                },
                child: Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 30, color: Colors.brown),
                    const SizedBox(width: 12),
                    const Text('Add Your Address',
                        style: TextStyle(fontSize: 16)),
                    const Spacer(),
                    Image.asset(
                      'assets/icons/edit_profile.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Delivery',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
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
              child: Row(
                children: [
                  Image.asset(
                    deliveryOptions.firstWhere((option) =>
                        option['name'] == selectedDelivery)['image'] as String,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    selectedDelivery,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Text('\$${getDeliveryCost().toStringAsFixed(2)}'),
                  const Spacer(),
                  InkWell(
                    onTap: _showDeliveryOptions,
                    child: Image.asset(
                      'assets/icons/edit_profile.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Order List',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(child: OrderList()),
            OrderSummary(
              deliveryCost: getDeliveryCost(),
              totalAmount: calculateTotal(84.00, 2.00),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: () {},
            child: const Text(
              'Continue to payment',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  double calculateTotal(double amount, double vat) {
    return amount + vat + getDeliveryCost();
  }
}

class OrderList extends StatelessWidget {
  final List<OrderItem> items = [
    OrderItem(
      image: 'assets/products/nikeshoes1.png',
      name: 'Jordan 1 Retro High Off-White University Blue',
      originalprice: 899.99,
      discountPercentage: 30.0,
      quantity: 1,
    ),
    OrderItem(
      image: 'assets/products/nikeshoes2.png',
      name: 'Jordan 1 Retro High Off-White Chicago',
      originalprice: 899.99,
      discountPercentage: 30.0,
      quantity: 1,
    ),
    OrderItem(
      image: 'assets/products/nikeshoes3.png',
      name: 'Nike Dunk Low Pro SB',
      originalprice: 899.99,
      discountPercentage: 30.0,
      quantity: 1,
    ),
    OrderItem(
      image: 'assets/products/nikeshoes4.png',
      name: 'Air Jordan 1 Retro Black Toe',
      originalprice: 899.99,
      discountPercentage: 30.0,
      quantity: 1,
    ),
    OrderItem(
      image: 'assets/products/nikeshoes6.png',
      name: 'Nike Dunk Low Celtic (2004)',
      originalprice: 899.99,
      discountPercentage: 30.0,
      quantity: 1,
    ),
    OrderItem(
      image: 'assets/products/nikeshoes7.png',
      name: 'Air Jordan 1 Retro High Off-White NRG',
      originalprice: 899.99,
      discountPercentage: 30.0,
      quantity: 1,
    ),
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
      child: Row(
        children: [
          Image.asset(
            item.image,
            height: 80,
            width: 120,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow
                        .visible, // Ensures the text doesn't get truncated
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "\$${(item.originalprice * (1 - item.discountPercentage / 100)).toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '\$${item.originalprice.toStringAsFixed(2)}',
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
          const SizedBox(height: 8),
          Text('x${item.quantity}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  final double deliveryCost;
  final double totalAmount;

  OrderSummary({required this.deliveryCost, required this.totalAmount});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Amount'),
              Text('\$84.00'),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('VAT'),
              Text('\$2.00'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Delivery'),
              Text('\$${deliveryCost.toStringAsFixed(2)}'),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('\$${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderItem {
  final String name;
  final double originalprice;
  final double discountPercentage;
  final String image;
  final int quantity;

  OrderItem({
    required this.name,
    required this.originalprice,
    required this.discountPercentage,
    required this.image,
    required this.quantity,
  });
}
