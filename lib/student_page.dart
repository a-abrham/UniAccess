import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uniaccess/header.dart';
import 'package:uniaccess/student_form.dart';

class StudentPage extends StatelessWidget {
  final String student_details;

  const StudentPage({super.key, required this.student_details});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> studentDetailsMap = jsonDecode(student_details);

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('UNIAccess'),
            centerTitle: true,
            backgroundColor: Colors.greenAccent,
          ),
          body: Column(
            children: [
              Header(university: studentDetailsMap['university']),
              StudentForm(
                name: studentDetailsMap['name'],
                department: studentDetailsMap['department'],
                id: studentDetailsMap['id'],
              )
            ],
          )),
    );
  }
}
