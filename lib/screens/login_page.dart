import 'package:cfmbilheteria/adminpainel/admin_painel.dart';
import 'package:cfmbilheteria/helper_functions/helper_functions.dart';
import 'package:cfmbilheteria/route_nav/RouteNav.dart';
import 'package:cfmbilheteria/screens/register_page.dart';
import 'package:cfmbilheteria/widgets/custom_button.dart';
import 'package:cfmbilheteria/widgets/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      if (context != null && context.findRenderObject()?.attached == true) {
        if (emailController.text.trim().contains('admin@gmail.com')) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => AdminPainel()),
              (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => RouteNav()),
              (route) => false);
        }
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
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
              const SizedBox(height: 50),
              Image.asset(
                'assets/logo.png',
                width: 150,
              ),
              const Text(
                'CFM ONLINE TICKET',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
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
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Esqueceu palavra passe ?',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Recuperar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CustomButtom(title: 'Entrar', onTap: login),
              const SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Não possui uma conta ?',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                        (route) => false);
                  },
                  child: const Text(
                    'Registrar',
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
