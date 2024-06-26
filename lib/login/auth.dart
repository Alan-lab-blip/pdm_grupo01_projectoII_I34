import 'package:cfmbilheteria/route_nav/RouteNav.dart';
import 'package:cfmbilheteria/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RouteNav();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
