import 'package:flutter/material.dart';

class UnitBox extends StatelessWidget {
  final String label;
  final String subtext;

  const UnitBox({super.key, required this.label, required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Box with border and label
        Container( 
          
          width: 80, // increases the width of the box/label
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12), 
            border: Border.all(color: Colors.white, width: 0),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,//increases the height of the box/label
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 5),
        // Subtext shown below the box
        Text(
          subtext,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}