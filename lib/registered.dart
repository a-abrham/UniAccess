import 'package:flutter/material.dart';

class Registered extends StatelessWidget {
  const Registered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered PC'),
      ),
      body: const Center(
        child: Text('Registered pc list'),
      ),
    );
  }
}
