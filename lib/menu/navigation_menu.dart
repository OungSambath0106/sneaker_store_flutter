import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:flutter_application_1/menu/contact_us.dart';
import 'package:flutter_application_1/screens/onboard_screen/onboarding_screen.dart';
import 'package:flutter_application_1/screens/profile/about_us.dart';
import 'package:flutter_application_1/screens/profile/edit_profile.dart';
import 'package:flutter_application_1/screens/profile/profile.dart';
import 'package:flutter_application_1/screens/profile/term_condition.dart';
import 'package:flutter_application_1/screens/promotion/promotion.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.bgColor,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Chea_Ichigo'),
              accountEmail: const Text('Chea0106@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset('assets/images/chea.png'),
                ),
              ),
              decoration: const BoxDecoration(color: AppColors.profile),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle,
                color: AppColors.icon,
              ),
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.phone_in_talk,
                color: AppColors.icon,
              ),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactUs(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                'assets/icons/promotion.png',
                color: AppColors.icon,
                width: 25.0,
                height: 25.0,
              ),
              title: const Text('Promotion'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PromotionScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.question_mark,
                color: AppColors.icon,
              ),
              title: const Text('FAQs'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.message,
                color: AppColors.icon,
              ),
              title: const Text('Feedback'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.list_alt,
                color: AppColors.icon,
              ),
              title: const Text('Terms of Use'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermCondition(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.share,
                color: AppColors.icon,
              ),
              title: const Text('Invite Friends'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: AppColors.icon,
              ),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.password,
                color: AppColors.icon,
              ),
              title: const Text('Change Password'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: AppColors.icon,
              ),
              title: const Text('Log out'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardingScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
