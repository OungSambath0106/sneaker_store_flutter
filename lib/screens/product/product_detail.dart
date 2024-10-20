import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/model/model_product.dart';

class ProductDetail extends StatefulWidget {
  final BestSellingProduct product;
  final List<BestSellingProduct> relatedProducts;

  // const ProductDetail({super.key, required this.product});
  const ProductDetail({
    Key? key,
    required this.product,
    required this.relatedProducts,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with TickerProviderStateMixin {
  String selectedSize = '';
  late double currentOriginalPrice; // Track the current original price
  late TabController _tabController;

  List<BestSellingProduct> filteredRelatedProducts = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    currentOriginalPrice =
        widget.product.originalprice; // Initialize current price
  }

  void _updatePrice(String price) {
    setState(() {
      // Update currentOriginalPrice based on selected size
      currentOriginalPrice =
          double.tryParse(price) ?? widget.product.originalprice;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleBestSellingFavorite(int index) {
    setState(() {
      filteredRelatedProducts[index].isFavorite =
          !filteredRelatedProducts[index].isFavorite;
    });
  }

  void _updateOriginalPrice(String size) {
    List<String> sizes = [
      'EU 36',
      'EU 37',
      'EU 38',
      'EU 39',
      'EU 40',
      'EU 41',
      'EU 42',
      'EU 43',
      'EU 44',
      'EU 45'
    ];
    List<double> prices = [
      559.99,
      599.99,
      659.99,
      699.99,
      759.99,
      799.99,
      859.99,
      899.99,
      959.99,
      999.99,
    ];

    int index = sizes.indexOf(size);
    if (index != -1) {
      setState(() {
        currentOriginalPrice =
            prices[index]; // Update the current original price
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          product.name,
          style: const TextStyle(color: AppColors.icon),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.icon),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    product.imagePath,
                    width: MediaQuery.of(context).size.width - 10,
                    height: MediaQuery.of(context).size.width * 0.6,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.brand,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 4),
                            Text(
                              "5.0",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      // Calculate discount price
                      Text(
                        "\$${(currentOriginalPrice * (1 - product.discountPercentage / 100)).toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Show current original price
                      Text(
                        "\$${currentOriginalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red,
                        ),
                        child: Text(
                          "${product.discountPercentage}% OFF",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Integrate TabBarView content here
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          'Select Size',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    _buildSizeSelector(),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Welcome to dinoclaire.my shop! We provide the best service and the best beauty products. Wholesale please. Welcome to dinoclaire. my shop! We provide the best service and the best beauty products. Wholesale please. See more",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    _buildSectionTitle('Related Products', () {}),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildRelatedProductsRow(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 17,
            right: 17,
            bottom: 30,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF683212),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                onPressed: () {
                  // Show the success SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to cart successfully!'),
                    ),
                  );
                },
                child: const Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeOption(String size, String price, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size; // Update selected size
          _updateOriginalPrice(size);
          _updatePrice(price); // Update original price based on selected size
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.brown : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.brown : Colors.grey,
            width: 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              size,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Colors.white : Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              '\$$price',
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeSelector() {
    List<String> sizes = [
      'EU 34',
      'EU 35',
      'EU 36',
      'EU 37',
      'EU 38',
      'EU 39',
      'EU 40',
      'EU 41',
      'EU 42',
      'EU 43',
      'EU 44',
      'EU 45'
    ];
    List<String> prices = [
      '459.99',
      '499.99',
      '559.99',
      '599.99',
      '659.99',
      '699.99',
      '759.99',
      '799.99',
      '859.99',
      '899.99',
      '959.99',
      '999.99',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 18,
      ),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        alignment: WrapAlignment.start,
        children: List<Widget>.generate(sizes.length, (index) {
          String size = sizes[index];
          String price = prices[index];
          bool isSelected = size == selectedSize;
          return Container(
            width: MediaQuery.of(context).size.width / 4 - 16,
            child: _buildSizeOption(size, price, isSelected),
          );
        }),
      ),
    );
  }

  Widget _buildRelatedProductsRow() {
    // Get the currently displayed product
    final currentProduct = widget.product;

    // Filter out the current product from the related products
    final filteredRelatedProducts =
        widget.relatedProducts.where((p) => p != currentProduct).toList();

    if (filteredRelatedProducts.isEmpty) {
      return const Center(
        child: Text(
          'No related products found',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.74,
      ),
      itemCount: filteredRelatedProducts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final relatedProduct = filteredRelatedProducts[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(
                  product: relatedProduct,
                  relatedProducts:
                      widget.relatedProducts, // Pass all related products
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(0.0),
            child: Card(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: SizedBox(
                          width: 200,
                          height: 90,
                          child: Image.asset(
                            relatedProduct.imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 5.0, 12.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              relatedProduct.brand,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              relatedProduct.name,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          '\$${relatedProduct.discountprice}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          '\$${relatedProduct.originalprice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 8.0,
                    right: 12.0,
                    child: IconButton(
                      icon: Icon(
                        relatedProduct.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: relatedProduct.isFavorite
                            ? Colors.red
                            : Colors.grey,
                      ),
                      onPressed: () {
                        _toggleBestSellingFavorite(index);
                      },
                    ),
                  ),
                  Positioned(
                    right: 12.0,
                    bottom: 5.0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'See More',
              style: TextStyle(color: Colors.brown),
            ),
          ),
        ],
      ),
    );
  }
}
