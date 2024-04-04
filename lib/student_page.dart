// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uniaccess/bar_code.dart';
import 'package:uniaccess/editpage.dart';
import 'package:uniaccess/header.dart';
import 'package:uniaccess/registered.dart';
import 'package:uniaccess/renewal.dart';
import 'package:uniaccess/student_form.dart';

class StudentPage extends StatelessWidget {
  final String student_details;

  const StudentPage({super.key, required this.student_details});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> studentDetailsMap = jsonDecode(student_details);
    String name = studentDetailsMap['name'];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent[300],
        appBar: AppBar(
          title: const Text('UNIAccess'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                ),
                child: Text('$name\'s profile'),
              ),
              ListTile(
                title: const Text('Renew ID'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Renewal()),
                  );
                },
              ),
              ListTile(
                title: const Text('Registered PC'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Registered()),
                  );
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                university: studentDetailsMap['university'],
                logo: studentDetailsMap['logo'],
              ),
              StudentForm(
                name: studentDetailsMap['name'],
                department: studentDetailsMap['department'],
                id: studentDetailsMap['id'],
                propic: studentDetailsMap['propic'],
              ),
              const StuBarCode(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    EditProfilePage(studentDetailsMap: studentDetailsMap),
              ),
            );
          },
          backgroundColor: Colors.greenAccent,
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
