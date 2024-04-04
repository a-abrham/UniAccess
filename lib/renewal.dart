import 'package:flutter/material.dart';

class Renewal extends StatelessWidget {
  const Renewal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Renew ID'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Renew ID'),
        ),
      ),
    );
  }
}
