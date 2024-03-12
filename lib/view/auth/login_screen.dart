import 'package:accounting_bunny/controller/auth/auth_controller.dart';
import 'package:accounting_bunny/style/text_styles.dart';
import 'package:accounting_bunny/view/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authController = AuthController();
  final _formKey = GlobalKey<FormState>();

  String _user = "";
  String _pass = "";

  void _handleSubmit() {
    final data = {"email": _user, "pass": _pass};

    _authController.login(data).then((value) {
      if (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error logging in")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(
              "assets/images/circle-bg.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text("Login", style: CustomTextStyle.headingLargeBold.style),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextFormField(
                onChanged: (text) => _user = text,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email field is Empty";
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextFormField(
                obscureText: true,
                onChanged: (text) => _pass = text,
                decoration: const InputDecoration(
                  hintText: "Enter your password",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Password field is Empty";
                  }

                  return null;
                },
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _handleSubmit();
                  }
                },
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
