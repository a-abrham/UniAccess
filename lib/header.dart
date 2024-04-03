import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: const Image(
            image: AssetImage('asset/a.jpg'),
            height: 60,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 15, 0),
          child: RichText(
            text: const TextSpan(
              text: 'Welcome ',
              style: TextStyle(fontSize: 24, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: 'Dear BDU',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' Student!'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
