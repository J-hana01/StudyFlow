import 'package:flutter/material.dart';

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Study"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: const [

          ListTile(
            title: Text("ABC-101"),
            subtitle: Text("Subject 001 ~ 010"),
          ),

          ListTile(
            title: Text("XYZ-202"),
            subtitle: Text("Subject 001 ~ 005"),
          ),

        ],
      ),
    );
  }
}