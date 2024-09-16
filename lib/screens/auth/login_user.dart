import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screens/auth/verify_otp_screen.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  bool ispassword = true;
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  TextEditingController controllerPhoneNumber = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  void toggle_password() {
    setState(() {
      ispassword = !ispassword;
    });
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                child: Image.asset(
                  'assets/images/sneaker.png',
                  width: 200,
                  height: 200,
                ),
              ),
              const Center(
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required Phone Number';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  hintText: 'Phone number',
                  prefixIcon: const SizedBox(
                    child: CountryCodePicker(
                      initialSelection: '+855',
                      favorite: ['+855', 'KH'],
                      showFlag: true,
                      textStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF683212),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  if (_keyForm.currentState!.validate()) {
                    String strNumber = controllerPhoneNumber.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("PhoneNumber: $strNumber"),
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerifyOtpScreen(),
                      ),
                      (route) => false,
                    );
                  }
                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              // OR text
              const Center(
                child: Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              SignInButton(
                image: Image.asset('assets/images/google.png'),
                imageWidth: 25,
                imageHeight: 25,
                text: 'Sign in with Google',
                color: Colors.white,
                textColor: Colors.black,
                iconColor: Colors.red,
              ),
              const SizedBox(height: 10),
              const SignInButton(
                icon: Icons.facebook,
                text: 'Sign in with Facebook',
                color: Colors.blue,
                textColor: Colors.white,
                iconColor: Colors.white,
              ),
              const SizedBox(height: 10),
              const SignInButton(
                icon: Icons.apple,
                text: 'Sign in with Apple ID',
                color: Colors.black,
                textColor: Colors.white,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color color;
  final Color textColor;
  final Color iconColor;
  final Image? image;
  final double? imageWidth;
  final double? imageHeight;

  const SignInButton({
    super.key,
    this.icon,
    required this.text,
    required this.color,
    required this.textColor,
    required this.iconColor,
    this.image,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () {},
      icon: image != null
          ? SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: image!,
            )
          : Icon(icon, color: iconColor),
      label: Text(
        text,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
    );
  }
}
