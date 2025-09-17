// Future<void> _signup() async {
  //   if (!_formKey.currentState!.validate()) return;

  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //           email: _emailController.text.trim(),
  //           password: _passwordController.text.trim(),
  //         );

  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userCredential.user!.uid)
  //         .set({
  //           'name': _nameController.text.trim(),
  //           'email': _emailController.text.trim(),
  //           'createdAt': Timestamp.now(),
  //         });

  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Signup Successful!'),
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //       await Future.delayed(const Duration(seconds: 2));
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (_) => const LoginPage()),
  //       );
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(
  //         context,
  //       ).showSnackBar(SnackBar(content: Text(e.message ?? 'Signup failed')));
  //     }
  //   } catch (e) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(
  //         context,
  //       ).showSnackBar(SnackBar(content: Text('Unexpected error: $e')));
  //     }
  //   } finally {
  //     if (mounted) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }

  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     // 1. Create user in Firebase Auth
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim(),
  //     );

  //     // 2. Save extra info in Firestore
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userCredential.user!.uid)
  //         .set({
  //       'name': _nameController.text.trim(),
  //       'email': _emailController.text.trim(),
  //       'createdAt': Timestamp.now(),
  //     });

  //     if (mounted) {
  //       // Show success SnackBar
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Signup Successful!'),
  //           duration: Duration(seconds: 2), // show for 2 seconds
  //         ),
  //       );

  //       // Wait for SnackBar to disappear
  //       await Future.delayed(const Duration(seconds: 2));

  //       // Navigate to LoginPage
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const LoginPage()),
  //       );
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     String message;
  //     if (e.code == 'email-already-in-use') {
  //       message = 'Email already in use.';
  //     } else if (e.code == 'weak-password') {
  //       message = 'Password is too weak.';
  //     } else {
  //       message = 'Error: ${e.message}';
  //     }

  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(message)),
  //       );
  //     }
  //   } finally {
  //     if (mounted) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }



  // import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:login/login_page.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   bool _isLoading = false;

//   Future<void> _signup() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         // 1. Create user in Firebase Auth
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(
//               email: _emailController.text.trim(),
//               password: _passwordController.text.trim(),
//             );

//         // 2. Save extra info in Firestore
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(userCredential.user!.uid)
//             .set({
//               'name': _nameController.text.trim(),
//               'email': _emailController.text.trim(),
//               'createdAt': Timestamp.now(),
//             });

//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(const SnackBar(content: Text('Signup Successful!')));

//         // ✅ Navigate to Login Page
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const LoginPage()),
//         );
//       } on FirebaseAuthException catch (e) {
//         String message = '';
//         if (e.code == 'email-already-in-use') {
//           message = 'Email already in use.';
//         } else if (e.code == 'weak-password') {
//           message = 'Password is too weak.';
//         } else {
//           message = 'Error: ${e.message}';
//         }
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text(message)));
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Signup')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Name'),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please enter your name' : null,
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please enter your email' : null,
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) =>
//                     value!.length < 6 ? 'Password must be 6+ chars' : null,
//               ),
//               const SizedBox(height: 20),
//               _isLoading
//                   ? const CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: _signup,
//                       child: const Text('Sign Up'),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'home_page.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false;

//   Future<void> _signup() async {
//     if (_nameController.text.isEmpty ||
//         _emailController.text.isEmpty ||
//         _passwordController.text.isEmpty) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('All fields required')));
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userCredential.user!.uid)
//           .set({
//         'name': _nameController.text.trim(),
//         'email': _emailController.text.trim(),
//         'createdAt': Timestamp.now(),
//       });

//       // ignore: use_build_context_synchronously
//       // ScaffoldMessenger.of(context)
//       //     .showSnackBar(const SnackBar(content: Text('Signup Successful!')));
//       // Navigate to HomePage after successful signup

//       Navigator.pushReplacement(
//           // ignore: use_build_context_synchronously
//           context, MaterialPageRoute(builder: (_) => const HomePage()));
//     } on FirebaseAuthException catch (e) {
//       String message = '';
//       if (e.code == 'email-already-in-use') {
//         message = 'Email already in use';
//       } else if (e.code == 'weak-password') {
//         message = 'Password too weak';
//       } else {
//         message = e.message ?? 'Signup failed';
//       }
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(message)));
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Sign Up')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             _isLoading
//                 ? const CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: _signup, child: const Text('Sign Up')),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:login/login_page.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   bool _isLoading = false;

//   Future<void> _signup() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       // 1. Create user in Firebase Auth
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       // 2. Save extra info in Firestore
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userCredential.user!.uid)
//           .set({
//         'name': _nameController.text.trim(),
//         'email': _emailController.text.trim(),
//         'createdAt': Timestamp.now(),
//       });

//       // ✅ Show success message and navigate to LoginPage
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Signup Successful!'),
//           duration: Duration(seconds: 2),
//           ),
//         );

//         await Future.delayed(const Duration(seconds: 2));
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const LoginPage()),
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       String message;
//       if (e.code == 'email-already-in-use') {
//         message = 'Email already in use.';
//       } else if (e.code == 'weak-password') {
//         message = 'Password is too weak.';
//       } else {
//         message = 'Error: ${e.message}';
//       }

//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(message)),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Signup')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               // Name Field
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Name'),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please enter your name' : null,
//               ),

//               // Email Field
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please enter your email' : null,
//               ),

//               // Password Field
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) =>
//                     value!.length < 6 ? 'Password must be 6+ chars' : null,
//               ),

//               const SizedBox(height: 20),

//               // Signup Button / Loading
//               _isLoading
//                   ? const CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: _signup,
//                       child: const Text('Sign Up'),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }