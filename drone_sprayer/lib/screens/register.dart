import 'package:drone_sprayer/auth/verify_email.dart';
import 'package:drone_sprayer/widgets/btn.dart';
import 'package:drone_sprayer/widgets/custom_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  final Function()? onTap;
  const Register({super.key, this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController confirm = TextEditingController();

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

    void signUp() async {
      if (password.text != confirm.text) {
        displayMessage('Passwords do not match');
        return;
      }
      progressIndicator();
      try {
        await registerUser(email, password);
        if (context.mounted) Get.back();
      } on FirebaseAuthException catch (e) {
        Get.back();
        displayMessage(e.message!);
      }

      if (FirebaseAuth.instance.currentUser != null &&
          password.text == confirm.text) {
        Get.to(const EmailVerification());
      }
    }

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/images/signup.png'),
                    fit: BoxFit.contain,
                  ),
                ),
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
                obscureText: false,
                icon: Icons.lock,
              ),
              MyTextField(
                controller: confirm,
                hintText: 'Confirm Your Password',
                obscureText: false,
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 30,
              ),
              AuthButton(
                text: 'Register',
                callback: signUp,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential> registerUser(
      TextEditingController email, TextEditingController password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text);

    return userCredential;
  }
}
