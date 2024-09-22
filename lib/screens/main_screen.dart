import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/menu/navigation_menu.dart';
import 'package:flutter_application_1/screens/Favorite/favorite_screen.dart';
import 'package:flutter_application_1/screens/home_screen/home_sreen.dart';
import 'package:flutter_application_1/screens/new_order_screen.dart';
import 'package:flutter_application_1/screens/popular_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> imgList = [
    'assets/banners/banner1.png',
    'assets/banners/banner2.png',
    'assets/banners/banner3.png',
    'assets/banners/banner4.png',
    'assets/banners/banner5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'THE SNEAKER',
          style: TextStyle(color: AppColors.icon),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.qr_code),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: ListTile(
                  leading: Icon(Icons.add_shopping_cart),
                  title: Text('New Order'),
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Popular Items'),
                ),
              ),
              const PopupMenuItem(
                value: 3,
                child: ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  title: Text('Favorite Items'),
                ),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 1:
                  // go to new order
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewOrderScreen(),
                    ),
                  );
                  break;
                case 2:
                  // go to popular items
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PopularScreen(),
                    ),
                  );
                  break;
                case 3:
                  // go to favorite items
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WishlistScreen(),
                    ),
                  );
                  break;
              }
            },
          ),
        ],
        iconTheme: const IconThemeData(color: AppColors.icon),
      ),
      drawer: const NavigationMenu(),
      body: Container(
        color: AppColors.bgColor,
        child: Stack(
          children: <Widget>[
            ListView(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              children: <Widget>[
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CarouselSlider(
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
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                                width: 1000,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    buildGridItem('Cosmetic', 'assets/images/cosmetic.png'),
                    buildGridItem('Sneaker', 'assets/images/sneaker.png'),
                    buildGridItem('Restaurant', 'assets/images/delivery.png'),
                    buildGridItem(
                        'Car Service', 'assets/images/cab_service.png'),
                    buildGridItem('Food Grocery', 'assets/images/food.png'),
                    buildGridItem('Parcel', 'assets/images/parcel.png'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridItem(String title, String imagePath) {
    return SizedBox(
      width: 160,
      height: 180,
      child: Card(
        color: AppColors.container,
        child: InkWell(
          onTap: () {
            if (title == 'Sneaker') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeSreen()),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
