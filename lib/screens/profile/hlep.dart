import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final List<ContactItem> contacts = [
    ContactItem(
      icon: Icons.message,
      title: "Chat",
      onTap: () {},
    ),
    ContactItem(
      icon: Icons.phone,
      title: "Phone",
      onTap: () {},
    ),
    ContactItem(
      icon: Icons.email,
      title: "Chea0106@gmail.com",
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Help',
          style: TextStyle(color: AppColors.icon),
        ),
        iconTheme: const IconThemeData(color: AppColors.icon),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.bgColor,
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return ListTile(
              leading: Icon(
                contact.icon,
                color: AppColors.icon,
              ),
              title: Text(contact.title),
              onTap: contact.onTap,
            );
          },
        ),
      ),
    );
  }
}

class ContactItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  ContactItem({required this.icon, required this.title, required this.onTap});
}
