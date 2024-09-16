import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';

class TermCondition extends StatefulWidget {
  const TermCondition({super.key});

  @override
  State<TermCondition> createState() => _TermConditionState();
}

class _TermConditionState extends State<TermCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Term & Condition',
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
                "Acceptance of Terms",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.icon),
              ),
              SizedBox(height: 5),
              Text(
                "By accessing and using Shopping App, you agree to be bound by these Terms and Conditions. These Terms apply to all users of the App, including without limitation users who are browsers, vendors, customers, merchants, and/or contributors of content.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Eligibility",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.icon),
              ),
              SizedBox(height: 5),
              Text(
                "You must be at least 18 years old or the age of majority in your jurisdiction to use this App. By using the App, you represent and warrant that you have the legal capacity to enter into these Terms.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "User Accounts",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.icon),
              ),
              SizedBox(height: 5),
              Text(
                "Registration: To access certain features of the App, you may be required to create an account. You agree to provide accurate and complete information during the registration process and to keep your account information up to date.Account Security: You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account or any other breach of security.Termination: We reserve the right to suspend or terminate your account at our discretion, without notice, if we believe you have violated these Terms or engaged in any fraudulent, abusive, or unlawful activity.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Shipping and Delivery",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.icon),
              ),
              SizedBox(height: 5),
              Text(
                "We aim to deliver products within the estimated time frame provided at the time of purchase. However, delivery times are estimates and may vary. We are not responsible for delays caused by shipping carriers or other factors beyond our control.",
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
