import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/model/model_product.dart';
import 'package:flutter_application_1/screens/product/product_detail.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NikeScreen extends StatefulWidget {
  const NikeScreen({super.key});

  @override
  State<NikeScreen> createState() => _NikeScreenState();
}

class _NikeScreenState extends State<NikeScreen> {
  bool isSearchActive = false;
  TextEditingController searchController = TextEditingController();

  // Set values for Best Selling
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
      imagePath: 'assets/products/nikeshoes3.png',
      brand: 'Nike',
      name: 'Nike Dunk Low Pro SB',
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
      imagePath: 'assets/products/nikeshoes5.png',
      brand: 'Nike',
      name: 'Nike Air Force 1 Low Stars White Black',
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
      imagePath: 'assets/products/nikeshoes7.png',
      brand: 'Nike',
      name: 'Air Jordan 1 Retro High Off-White NRG',
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
  ];

  late List<BestSellingProduct> _relatedProducts;

  List<BestSellingProduct> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _relatedProducts = _bestsellingproducts.where((product) {
      return product.brand == 'Nike';
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
          relatedProducts: _relatedProducts,
        ),
      ),
    );
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = _bestsellingproducts.where((product) {
        // Corrected here
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
              _bestSellingProducts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bestSellingProducts() {
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
        childAspectRatio: 0.74,
      ),
      itemCount: _filteredProducts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final product = _filteredProducts[index];

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
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
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
}
