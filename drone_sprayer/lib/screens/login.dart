import 'package:drone_sprayer/widgets/btn.dart';
import 'package:drone_sprayer/widgets/custom_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({super.key, this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    void displayMessage(String error) {
      Get.defaultDialog(
          title: 'Error',
          content: Text(error, textAlign: TextAlign.center),
          actions: [
            TextButton(onPressed: () => Get.back(), child: const Text('OK'))
          ]);
    }

    void progressIndicator() {
      Get.dialog(const Center(
        child: CircularProgressIndicator(
          color: Colors.amber,
        ),
      ));
    }

    void signIn() async {
      progressIndicator();
      try {
        await loginUser(email, password);
        if (context.mounted) Get.back();
      } on FirebaseAuthException catch (e) {
        Get.back();
        displayMessage(e.message!);
      }
    }

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 350,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/images/login.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              MyTextField(
                controller: email,
                hintText: 'Enter Your Email',
                obscureText: false,
                icon: Icons.mail,
              ),
              MyTextField(
                controller: password,
                hintText: 'Enter Your Password',
                obscureText: true,
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 30,
              ),
              AuthButton(
                text: 'Login',
                callback: signIn,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential> loginUser(
      TextEditingController email, TextEditingController password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
    return userCredential;
  }
}
