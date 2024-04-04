import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String university;

  const Header({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: const Image(
            image: AssetImage('asset/bduLogo.jpg'),
            height: 60,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 24, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: university,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' University'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
