import 'package:credix_app/shared/widgets/background.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Background(
        child: Center(
          child: Text('Hello!'),
        ),
      ),
    );
  }
}
