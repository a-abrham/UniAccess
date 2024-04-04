// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final Map<String, dynamic> studentDetailsMap;

  const EditProfilePage({super.key, required this.studentDetailsMap});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _departmentController;
  late TextEditingController _idController;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.studentDetailsMap['name']);
    _departmentController =
        TextEditingController(text: widget.studentDetailsMap['department']);
    _idController = TextEditingController(text: widget.studentDetailsMap['id']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _departmentController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _departmentController,
              decoration: const InputDecoration(labelText: 'Department'),
            ),
            TextFormField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'ID'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
