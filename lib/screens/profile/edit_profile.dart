import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = "Chea_Ichigo";
    _emailController.text = "Chea0106@gmail.com";
    _phoneController.text = "012 345 678";
    _addressController.text = "#06, #271 Street, Phnom Penh, Cambodia";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text(
          "My Profile",
          style: TextStyle(color: AppColors.icon),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.icon),
      ),
      body: Container(
        color: AppColors.bgColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Aligns fields to the start
            children: [
              Stack(
                alignment: Alignment
                    .bottomRight, // Align the button at the bottom-right corner of the avatar
                children: [
                  // Profile image
                  const CircleAvatar(
                    radius: 50.0, // Adjust the size as needed
                    backgroundImage: AssetImage('assets/images/chea.png'),
                  ),
                  // Edit button
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Handle edit profile image action
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              AppColors.icon, // Background color of the button
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white, // Color of the icon
                          size: 16.0, // Size of the icon
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26.0),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border:
                      OutlineInputBorder(), // Adds border around the text field
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border:
                      OutlineInputBorder(), // Adds border around the text field
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border:
                      OutlineInputBorder(), // Adds border around the text field
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _addressController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Address",
                  border:
                      OutlineInputBorder(), // Adds border around the text field
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _oldPasswordController,
                obscureText: true, // Hide the text
                decoration: const InputDecoration(
                  labelText: "Old Password",
                  border:
                      OutlineInputBorder(), // Adds border around the text field
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true, // Hide the text
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  border:
                      OutlineInputBorder(), // Adds border around the text field
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
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
              onPressed: () {
                // Handle the update action
              },
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
