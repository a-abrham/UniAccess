import 'package:flutter/material.dart';

class StudentForm extends StatelessWidget {
  final String name, department, id;

  const StudentForm(
      {super.key,
      required this.name,
      required this.department,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('asset/e.webp'),
                radius: 40,
              ),
            ),
            const Divider(
              height: 30,
              color: Colors.black,
            ),
            const Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(
                letterSpacing: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'ID',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              id,
              style: const TextStyle(
                letterSpacing: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'DEPARTMENT',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              department,
              style: const TextStyle(
                letterSpacing: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
