import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/menu/navigation_menu.dart';
import 'package:flutter_application_1/model/model_product.dart';
import 'package:flutter_application_1/screens/home_screen/category/adidas_screen.dart';
import 'package:flutter_application_1/screens/home_screen/category/nike_screen.dart';
import 'package:flutter_application_1/screens/order/order.dart';
import 'package:flutter_application_1/screens/product/product_detail.dart';
import 'package:flutter_application_1/screens/scan_qrcode/scan_qrcode_screen.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

//Class for Popular Product
class Product {
  final String imagePath;
  final String name;
  final double price;
  final double originalPrice;

  Product({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.originalPrice,
  });
}

class _HomeSreenState extends State<HomeSreen> {
  bool isSearchActive = false;
  TextEditingController searchController = TextEditingController();

  // final List<bool> _bestSelling = List.generate(6, (_) => false);
  final List<bool> _newArrival = List.generate(6, (_) => false);
  // final List<bool> _popularFavorite = List.generate(6, (_) => false);

  final List<String> imgList = [
    'assets/banners/banner1.png',
    'assets/banners/banner2.png',
    'assets/banners/banner3.png',
    'assets/banners/banner4.png',
    'assets/banners/banner5.png',
  ];

  final List<Map<String, dynamic>> categories = [
    {'image': 'assets/categories/nike.png', 'label': 'NIKE'},
    {'image': 'assets/categories/adidas.png', 'label': 'ADIDAS'},
    {'image': 'assets/categories/nb.png', 'label': 'NEW BALANCE'},
    {'image': 'assets/categories/vans.png', 'label': 'VANS'},
    {'image': 'assets/categories/puma.png', 'label': 'PUMA'},
  ];

  //set values for Popular Product
  final List<Product> products = [
    Product(
      imagePath: 'assets/products/nikeshoes1.png',
      name: 'Jordan 1 Retro High Off-White University Blue',
      price: 799.99,
      originalPrice: 899.99,
    ),
    Product(
      imagePath: 'assets/products/nikeshoes2.png',
      name: 'Jordan 1 Retro High Off-White Chicago',
      price: 799.99,
      originalPrice: 899.99,
    ),
    Product(
      imagePath: 'assets/products/adidas3.png',
      name: 'Adidas Barricade 2016 XJ Unisex Baby Trainers',
      price: 799.99,
      originalPrice: 899.99,
    ),
    Product(
      imagePath: 'assets/products/adidas4.png',
      name: 'YEEZY BOOST 700 "Waverunner"',
      price: 799.99,
      originalPrice: 899.99,
    ),
  ];

  //set values for Best Selling
  final List<BestSellingProduct> _bestsellingproducts = [
    BestSellingProducts(
      imagePath: 'assets/products/nikeshoes1.png',
      brand: 'Nike',
      name: 'Jordan 1 Retro High Off-White University Blue',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/nikeshoes2.png',
      brand: 'Nike',
      name: 'Jordan 1 Retro High Off-White Chicago',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/adidas5.png',
      brand: 'Adidas',
      name: 'adidas EQT Running Guidance',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/nikeshoes3.png',
      brand: 'Nike',
      name: 'Nike Dunk Low Pro SB',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/adidas1.png',
      brand: 'Adidas',
      name: 'Yeezy Boost 350 V2',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/nikeshoes4.png',
      brand: 'Nike',
      name: 'Air Jordan 1 Retro Black Toe',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/nikeshoes7.png',
      brand: 'Nike',
      name: 'Air Jordan 1 Retro High Off-White NRG',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/adidas2.png',
      brand: 'Adidas',
      name: 'Adidas EQT Support ADV Primeknit Turbo',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/nikeshoes8.png',
      brand: 'Nike',
      name: 'Nike Air Jordan 1 "Shattered Backboard 1.0"',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/adidas3.png',
      brand: 'Adidas',
      name: 'adidas Barricade 2016 XJ Unisex Baby Trainers',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/nikeshoes5.png',
      brand: 'Nike',
      name: 'Nike Air Force 1 Low Stars White Black',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/adidas4.png',
      brand: 'Adidas',
      name: 'YEEZY BOOST 700 "Waverunner"',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/nikeshoes6.png',
      brand: 'Nike',
      name: 'Nike Dunk Low Celtic (2004)',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
    BestSellingProducts(
      imagePath: 'assets/products/adidas6.png',
      brand: 'Adidas',
      name: 'Adidas NMD_XR1 Primeknit Clear Granite W',
      originalprice: 899.99,
      discountPercentage: 30.0,
    ),
  ];

  late List<BestSellingProduct> _relatedProducts;

  List<BestSellingProduct> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _relatedProducts = _bestsellingproducts.where((product) {
      return product.brand == 'Nike' || product.brand == 'Adidas';
    }).toList();

    _filteredProducts = _bestsellingproducts; // Corrected here

    searchController.addListener(() {
      _filterProducts(searchController.text);
    });
  }

  void _navigateToProductDetail(BestSellingProduct product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetail(
          product: product,
          relatedProducts: _relatedProducts, // Ensure this is defined
        ),
      ),
    );
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = _bestsellingproducts.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void _toggleBestSellingFavorite(int index) {
    setState(() {
      _filteredProducts[index].isFavorite =
          !_filteredProducts[index].isFavorite;
    });
  }

  void _toggleRecommentFavorite(int index) {
    setState(() {
      _newArrival[index] = !_newArrival[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.topNavigationbar,
        title: const Text(
          'THE SNEAKER',
          style: TextStyle(color: AppColors.icon),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: IconButton(
              icon: Image.asset(
                'assets/icons/invoice.png', // Replace with the second image path
                width: 24.0, // Set your desired width
                height: 24.0, // Set your desired height
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderHistoryScreen(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Image.asset(
                'assets/icons/qr-code.png', // Replace with your actual image path
                width: 24.0, // Set your desired width
                height: 24.0, // Set your desired height
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScanQrcodeScreen(),
                  ),
                );
              },
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: AppColors.icon),
      ),
      drawer: const NavigationMenu(),
      // drawer: const NavigationMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        _filterProducts(value);
                        setState(() {
                          isSearchActive = value.isNotEmpty;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (!isSearchActive)
                CarouselSlider(
                  options: CarouselOptions(
                    height: 150,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                  ),
                  items: imgList
                      .map(
                        (item) => Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(item,
                                fit: BoxFit.cover, width: 1000),
                          ),
                        ),
                      )
                      .toList(),
                ),
              if (!isSearchActive) ...[
                const SizedBox(height: 20),
                _buildSectionTitle('Categories', () {}),
                _buildCategorySection(),
                const SizedBox(height: 10),
                _buildSectionTitle('Popular Product', () {}),
                const SizedBox(height: 5),
                _newArrivalProduct(),
                const SizedBox(height: 20),
                _buildSectionTitle('Best Selling', () {}),
                const SizedBox(height: 5),
                _bestSellingProduct(),
              ],
              if (isSearchActive) ...[
                const SizedBox(height: 5),
                _searchProduct(),
              ],
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onPressed) {
    return Row(
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
            'Show All',
            style: TextStyle(color: Colors.brown),
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySection() {
    return SizedBox(
      height: 120.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (index) {
            // Define the destination screen based on the category
            Widget destinationScreen;
            switch (categories[index]['label']) {
              case 'NIKE':
                destinationScreen = const NikeScreen();
                break;
              case 'ADIDAS':
                destinationScreen = const AdidasScreen();
                break;
              // Add more cases for other categories
              default:
                destinationScreen = const HomeSreen(); // Fallback screen
            }

            return CategoryItem(
              imageAsset: categories[index]['image'],
              label: categories[index]['label'],
              destinationScreen:
                  destinationScreen, // Pass the destination screen
            );
          }),
        ),
      ),
    );
  }

  Widget _bestSellingProduct() {
    if (_filteredProducts.isEmpty) {
      return const Center(
        child: Text(
          'Data not found',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      );
    }

    return SizedBox(
      height: 500, // Adjust height as needed to fit two rows
      child: Column(
        children: [
          // First row (first 6 products or fewer)
          SizedBox(
            height: 240, // Height for the first row
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  min(_filteredProducts.length, 7), // Show up to 7 products
              itemBuilder: (context, index) {
                final product = _filteredProducts[index];

                return GestureDetector(
                  onTap: () => _navigateToProductDetail(product),
                  child: Container(
                    width: 180, // Adjust width for each item
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Card(
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 18.0, 0.0, 0),
                                child: SizedBox(
                                  width: 300,
                                  height: 90,
                                  child: Image.asset(
                                    product.imagePath,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 5.0, 12.0, 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      product.brand,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      product.name,
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Text(
                                  '\$${product.discountprice}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Text(
                                  '\$${product.originalprice.toStringAsFixed(2)}',
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
                                product.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: product.isFavorite
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
            ),
          ),
          const SizedBox(height: 15),
          // Second row (next set of products, if any)
          if (_filteredProducts.length > 7)
            SizedBox(
              height: 240, // Height for the second row
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _filteredProducts.length - 7, // Remaining products
                itemBuilder: (context, index) {
                  final product =
                      _filteredProducts[index + 7]; // Start from product 7

                  return GestureDetector(
                    onTap: () => _navigateToProductDetail(product),
                    child: Container(
                      width: 180, // Adjust width for each item
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Card(
                        color: Colors.white,
                        child: Stack(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 18.0, 0.0, 0),
                                  child: SizedBox(
                                    width: 300,
                                    height: 90,
                                    child: Image.asset(
                                      product.imagePath,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      15.0, 5.0, 12.0, 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        product.brand,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        product.name,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Text(
                                    '\$${product.discountprice}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Text(
                                    '\$${product.originalprice.toStringAsFixed(2)}',
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
                                  product.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: product.isFavorite
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  _toggleBestSellingFavorite(
                                      index + 7); // Update index
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
              ),
            ),
        ],
      ),
    );
  }

  Widget _searchProduct() {
    if (_filteredProducts.isEmpty) {
      return const Center(
        child: Text(
          'Data not found',
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
        childAspectRatio: 0.74, // Adjust if needed
      ),
      itemCount: _filteredProducts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final product = _filteredProducts[index]; // Use filtered products

        return GestureDetector(
          onTap: () => _navigateToProductDetail(product),
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
                            product.imagePath,
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
                              product.brand,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              product.name,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Adds an ellipsis when the text overflows
                              maxLines: 1, // Limits the text to a single line
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          '\$${product.discountprice}',
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
                          '\$${product.originalprice.toStringAsFixed(2)}',
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
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: product.isFavorite ? Colors.red : Colors.grey,
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

  Widget _newArrivalProduct() {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              width: 260.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        20.0), // Optional: to match the container’s rounded corners
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Image.asset(
                        product.imagePath,
                        height: 80.0,
                        width: 80.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // const SizedBox(width: 10.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow
                                .ellipsis, // Add this to handle text overflow
                            maxLines:
                                1, // Ensure text is constrained to a single line
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${product.originalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 15.0), // Set padding here
                    child: IconButton(
                      icon: Icon(
                        _newArrival[index]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        _toggleRecommentFavorite(index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imageAsset;
  final String label;
  final Widget destinationScreen; // Added parameter for navigation

  const CategoryItem({
    required this.imageAsset,
    required this.label,
    required this.destinationScreen, // Required parameter for screen navigation
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to the specified screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destinationScreen),
            );
          },
          child: Container(
            width: 80.0,
            height: 80.0,
            margin: const EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(360.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                imageAsset,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
