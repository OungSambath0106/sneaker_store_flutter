import 'package:flutter/material.dart';

class SignupUser extends StatefulWidget {
  const SignupUser({super.key});

  @override
  State<SignupUser> createState() => _SignupUserState();
}

class _SignupUserState extends State<SignupUser> {
  bool isPassword = true;
  final FocusNode txt = FocusNode();

  void togglePassword() {
    setState(() {
      isPassword = !isPassword;
    });
  }

  @override
  void dispose() {
    txt.dispose();
    super.dispose();
  }

  Widget buildTextField({
    required String labelText,
    required Icon prefixIcon,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up User'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Image.asset(
                'assets/images/defult.png',
                width: 100,
                height: 100,
              ),
            ),
            buildTextField(
              labelText: 'Full Name',
              prefixIcon: const Icon(
                Icons.person,
                size: 32,
              ),
            ),
            buildTextField(
              labelText: 'UserName',
              prefixIcon: const Icon(
                Icons.person,
                size: 32,
              ),
            ),
            buildTextField(
              labelText: 'Password',
              prefixIcon: const Icon(
                Icons.lock_outline,
                size: 32,
              ),
              obscureText: isPassword,
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: GestureDetector(
                  onTap: togglePassword,
                  child: Icon(
                    isPassword
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 32,
                  ),
                ),
              ),
            ),
            buildTextField(
              labelText: 'Confirm Password',
              prefixIcon: const Icon(
                Icons.lock_outline,
                size: 32,
              ),
              obscureText: isPassword,
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: GestureDetector(
                  onTap: togglePassword,
                  child: Icon(
                    isPassword
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 32,
                  ),
                ),
              ),
            ),
            Container(
              height: 56,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  // Handle the button press here
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      home: SignupUser(),
    ));
