import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: AppColors.icon),
        ),
        iconTheme: const IconThemeData(color: AppColors.icon),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.bgColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: const [
              Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.icon,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Welcome to BEFREE STORE! Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the app.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Data Security",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.icon,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "We implement industry-standard security measures to protect your information from unauthorized access, disclosure, alteration, or destruction. However, please note that no method of transmission over the internet or method of electronic storage is 100% secure.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Children's Privacy",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.icon,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Our app is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under 13. If we become aware that we have collected information from a child under 13, we will take steps to delete it.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Changes to This Privacy Policy",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.icon,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "We may update this Privacy Policy from time to time. Any changes will be posted on this page, and the Last Update 16-Sep-2024 date will be revised. We encourage you to review this Privacy Policy periodically to stay informed about how we are protecting your information.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
