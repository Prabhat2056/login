import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final TextEditingController _emailController = TextEditingController();
  //final TextEditingController _passwordController = TextEditingController();

  reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: _emailController.text.trim(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Email Field
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
             const SizedBox(height: 20),
            // TextFormField(
            //   controller: _passwordController,
            //   decoration: const InputDecoration(labelText: 'Password'),
            //   keyboardType: TextInputType.emailAddress,
            // ),

            // ElevatedButton(
            //   onPressed: () async {
            //     await reset();
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text('Password reset email sent!')),
            //     );
            //   },
            //   child: const Text('Reset Password'),
            // ),
            ElevatedButton(onPressed: (()=>reset()), child: Text("Reset Password")),
          ],
        ),
      ),

    );
  }
}