// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  Future<void> _passwordReset() async {
    final String email = _emailController.text.trim();

    // Validation: Check if email field is empty
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email address.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset email sent. check your email!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
    } catch (error) {
      String errorMessage = 'An error occurred. Please try again later.';
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'user-not-found':
            errorMessage = 'No user found for that email.';
            break;
          case 'invalid-email':
            errorMessage = 'Invalid email address format.';
            break;
          default:
            errorMessage = 'Error: ${error.message}';
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        elevation: 0,
        title: const Text('Reset your password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your email and we will send a password reset link.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter your Email',
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[600]),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 15),
            MaterialButton(
              onPressed: _passwordReset,
              color: Colors.deepPurple[200],
              child: const Text('Reset Password'),
            )
          ],
        ),
      ),
    );
  }
}
