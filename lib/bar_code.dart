import 'package:flutter/material.dart';

class StuBarCode extends StatelessWidget {
  const StuBarCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: const Image(
        image: AssetImage('asset/a.png'),
        height: 140,
        width: 250,
      ),
    );
  }
}
