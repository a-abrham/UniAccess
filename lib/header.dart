import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String university, logo;

  const Header({super.key, required this.university, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: Image(
            image: AssetImage(logo),
            height: 60,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 24, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: university,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' University'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
