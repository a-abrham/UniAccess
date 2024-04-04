// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'student_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController universityIdController = TextEditingController();
  final TextEditingController yourIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    final universityId = universityIdController.text;
    final yourId = yourIdController.text;
    final password = passwordController.text;

    if (universityId.isEmpty || yourId.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Make sure you filled the provided fields!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      try {
        final response = await http.post(
          Uri.parse('http://10.0.2.2:3005/login'),
          body: {
            'universityId': universityId,
            'yourId': yourId,
            'password': password,
          },
        );

        if (response.statusCode == 200) {
          debugPrint('Success');
          debugPrint(response.body);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    StudentPage(student_details: response.body)),
          );
        } else {
          debugPrint('Failed');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login failed. Please check your credentials.'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
        }
      } catch (e) {
        debugPrint('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please check your connection.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: const Text(
                  'Login to UNIAccess',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: universityIdController,
                decoration: InputDecoration(
                  labelText: 'University ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Enter your university ID',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon:
                      Icon(Icons.school_outlined, color: Colors.grey[600]),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: yourIdController,
                decoration: InputDecoration(
                  labelText: 'Your ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Enter your ID',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon:
                      Icon(Icons.perm_identity, color: Colors.grey[600]),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Enter your Password',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Log In'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
