import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  final List<String> bannerImages = [
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
          'Promotion',
          style: TextStyle(color: AppColors.icon),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.icon),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
        color: AppColors.bgColor,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: bannerImages.length, // Use the length of your banner list
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  bannerImages[
                      index], // Use the banner path at the current index
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 2.4,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
