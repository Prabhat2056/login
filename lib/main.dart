import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:login/wrapper.dart';

void main() async {
  // Step 1: Make sure Flutter is ready for async operations
  WidgetsFlutterBinding.ensureInitialized();

  // Step 2: Initialize Firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAC5B__yvdOqhQBcN-XjaCo_788wzVkYNo",
      appId: "1:714160083757:android:74e0b11fe2a356ef49b9a4",
      messagingSenderId: "714160083757",
      projectId: "flutter-project-945cd",
      authDomain: "flutter-project-945cd.firebaseapp.com",
      storageBucket: "flutter-project-945cd.appspot.com",
    ),
  );

  // Step 3: Run your app after Firebase is ready
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Wrapper(),
      
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:login/login_page.dart';

// import 'home_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: const FirebaseOptions(
//        apiKey: "AIzaSyAC5B__yvdOqhQBcN-XjaCo_788wzVkYNo",
//       appId: "1:714160083757:android:74e0b11fe2a356ef49b9a4",
//              messagingSenderId: "714160083757",
//        projectId: "flutter-project-945cd",
//        authDomain: "flutter-project-945cd.firebaseapp.com",
//        databaseURL: 'https://flutter-project-945cd-default-rtdb.asia-southeast1.firebasedatabase.app',
//        storageBucket: "flutter-project-945cd.appspot.com",
//      ),
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Firebase Auth Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             );
//           }
//           if (snapshot.hasData) {
//             return const HomePage();
//           }
//           return const LoginPage();
//         },
//       ),
//     );
//   }
// }
