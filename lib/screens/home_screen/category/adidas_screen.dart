import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdidasScreen extends StatefulWidget {
  const AdidasScreen({super.key});

  @override
  State<AdidasScreen> createState() => _AdidasScreenState();
}

//Class for Best Selling Product
class BestSellingProduct {
  final String imagePath;
  final String brand;
  final String name;
  final String size;
  final double price;
  bool isFavorite;

  BestSellingProduct({
    required this.imagePath,
    required this.brand,
    required this.name,
    required this.size,
    required this.price,
    this.isFavorite = false,
  });
}

class _AdidasScreenState extends State<AdidasScreen> {
  bool isSearchActive = false;
  TextEditingController searchController = TextEditingController();

  //set values for Best Selling
  final List<BestSellingProduct> _bestsellingproducts = [
    BestSellingProduct(
      imagePath: 'assets/images/adidas1.png',
      brand: 'Adidas',
      name: 'Yeezy Boost 350 V2',
      size: '42',
      price: 799.0,
    ),
    BestSellingProduct(
      imagePath: 'assets/images/adidas2.png',
      brand: 'Adidas',
      name: 'Adidas EQT Support ADV Primeknit Turbo',
      size: '40',
      price: 799.0,
    ),
    BestSellingProduct(
      imagePath: 'assets/images/adidas3.png',
      brand: 'Nike',
      name: 'adidas Barricade 2016 XJ Unisex Baby Trainers',
      size: '40',
      price: 799.0,
    ),
    BestSellingProduct(
      imagePath: 'assets/images/adidas4.png',
      brand: 'Nike',
      name: 'YEEZY BOOST 700 "Waverunner"',
      size: '40',
      price: 799.0,
    ),
    BestSellingProduct(
      imagePath: 'assets/images/adidas5.png',
      brand: 'Nike',
      name: 'adidas EQT Running Guidance',
      size: '40',
      price: 799.0,
    ),
    BestSellingProduct(
      imagePath: 'assets/images/adidas6.png',
      brand: 'Nike',
      name: 'Adidas NMD_XR1 Primeknit Clear Granite W',
      size: '40',
      price: 799.0,
    ),
  ];

  List<BestSellingProduct> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _bestsellingproducts;
    searchController.addListener(() {
      _filterProducts(searchController.text);
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'NIKE BRAND',
          style: TextStyle(color: AppColors.icon),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/filter.svg'),
            onPressed: () {
              // Your onPressed functionality here
            },
          ),
        ],
        iconTheme: const IconThemeData(color: AppColors.icon),
      ),
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
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _bestSellingProduct(),
            ],
          ),
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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.75, // Adjust if needed
      ),
      itemCount: _filteredProducts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final product = _filteredProducts[index]; // Use filtered products

        return Container(
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
                      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 12.0, 8.0),
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
                          Text(
                            'Size: ${product.size}',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
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
        );
      },
    );
  }
}
