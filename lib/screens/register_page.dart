import 'package:cfmbilheteria/helper_functions/helper_functions.dart';
import 'package:cfmbilheteria/screens/home_page.dart';
import 'package:cfmbilheteria/screens/login_page.dart';
import 'package:cfmbilheteria/widgets/custom_button.dart';
import 'package:cfmbilheteria/widgets/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      ),
    );

    if (passwordController.text != confirmPasswordController.text) {
      displayMessageToUser("As senhas não coincidem", context);
      Navigator.pop(context);
      passwordController.clear();
      confirmPasswordController.clear();
    } else if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      displayMessageToUser("Preencha todos campos", context);
    } else {
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim());

        if (!userCredential!.user!.emailVerified) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {}
      } on FirebaseAuthException catch (e) {
        displayMessageToUser(e.code, context);
        passwordController.clear();
        confirmPasswordController.clear();
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF258150),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/logo.png',
                width: 150,
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              InputField(controller: emailController),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    'Palavra-passe',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              InputField(
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    'Confrimar Palavra-passe',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              InputField(
                controller: confirmPasswordController,
                obscureText: true,
              ),
              const SizedBox(height: 25),
              CustomButtom(title: 'Registrar', onTap: registerUser),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Já possui uma conta ?',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false);
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
