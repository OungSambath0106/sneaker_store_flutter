import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/screens/home_screen/home_sreen.dart';
import 'package:flutter_application_1/screens/notification/notification.dart';
import 'package:flutter_application_1/screens/order/order.dart';
import 'package:flutter_application_1/screens/profile/profile.dart';

// Mocking user login status for this example
bool isLoggedIn = true; // You can replace this with actual login logic

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0; // Track the selected index

  // Define your screens here
  final List<Widget> _screens = [
    const HomeSreen(),
    const OrderHistoryScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: isLoggedIn ? _screens[_currentIndex] : const HomeSreen(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.bgColor,
        color: AppColors.navigationbar,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });

          if (index == 0) {
            // If index 0 (Home) is clicked, show MainScreen
            setState(() {
              _currentIndex = 0;
            });
          }
        },
        items: const [
          Icon(
            Icons.home,
            size: 33.0,
            color: AppColors.iconnavigationbar,
          ),
          Icon(
            Icons.shopping_cart,
            size: 33.0,
            color: AppColors.iconnavigationbar,
          ),
          Icon(
            Icons.notifications,
            size: 33.0,
            color: AppColors.iconnavigationbar,
          ),
          Icon(
            Icons.person,
            size: 33.0,
            color: AppColors.iconnavigationbar,
          ),
        ],
      ),
    );
  }
}
