import 'package:flutter/material.dart';

import 'auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    final isLoggedIn = await authService.isLoggedIn();
    if (isLoggedIn) {
      // Перейти в основной экран
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login with Keycloak")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await authService.login();
            final token = await authService.getAccessToken();
            debugPrint('Access Token: $token');
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      appBar: AppBar(title: const Text("Welcome")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await authService.logout();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
