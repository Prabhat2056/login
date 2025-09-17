// import 'package:flutter/material.dart';

// class FirebaseDbButtons extends StatefulWidget {
//   const FirebaseDbButtons({super.key});

//   @override
//   State<FirebaseDbButtons> createState() => _FirebaseDbButtonsState();
// }

// class _FirebaseDbButtonsState extends State<FirebaseDbButtons> {
//   @override
//   Widget build(BuildContext context) {
//     return AppPaddingScaffold(
//       children: [
//         ButtonWidget(
//           label: 'Create',
//           callback: () {
//             DatabaseService.create(path: 'data1', data: {'name': 'John Doe'});
//           }
//         ),
//         SizedBox(height: 10),
//         ButtonWidget(
//           label: 'Read',
//           callback: () {}
//         ),
//         SizedBox(height: 10),
//         ButtonWidget(
//           label: 'Update',
//           callback: () {}
//         ),
//         SizedBox(height: 10),
//         ButtonWidget(
//           label: 'Delete',
//           callback: () {}
//         ),
//       ]
//     );
//   }
  
//   Widget AppPaddingScaffold({required List<dynamic> children}) {}
// };