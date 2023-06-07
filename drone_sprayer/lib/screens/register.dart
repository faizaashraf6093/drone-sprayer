import 'package:drone_sprayer/auth/verify_email.dart';
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
    bool isLoading = false;

    void handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      await registerUser(email, password);
      if (FirebaseAuth.instance.currentUser != null) {
        Get.to(const EmailVerification());
      }
      setState(() {
        isLoading = false;
      });
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

              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: isLoading ? null : handleSignUp,
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                ),
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
