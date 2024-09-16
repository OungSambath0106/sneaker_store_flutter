import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';

class LanguageSettingsScreen extends StatefulWidget {
  const LanguageSettingsScreen({super.key});

  @override
  State<LanguageSettingsScreen> createState() => _LanguageSettingsScreenState();
}

class _LanguageSettingsScreenState extends State<LanguageSettingsScreen> {
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Language',
          style: TextStyle(color: AppColors.icon),
        ),
        iconTheme: const IconThemeData(color: AppColors.icon),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.bgColor,
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                'assets/icons/cambodia.png',
                width: 25.0,
                height: 25.0,
              ),
              title: const Text(
                "Cambodia",
                style: TextStyle(color: AppColors.icon),
              ),
              onTap: () {
                setState(() {
                  selectedLanguage = "Cambodia";
                });
              },
              trailing: Radio<String>(
                value: "Cambodia",
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                  });
                },
                activeColor: AppColors.icon,
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/english.png',
                width: 25.0,
                height: 25.0,
              ),
              title: const Text(
                "English",
                style: TextStyle(color: AppColors.icon),
              ),
              onTap: () {
                setState(() {
                  selectedLanguage = "English";
                });
              },
              trailing: Radio<String>(
                value: "English",
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                  });
                },
                activeColor: AppColors.icon,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
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
                'Update',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
