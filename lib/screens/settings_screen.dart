import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        children: const [

          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("알림 설정"),
          ),

          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text("Google Calendar 연동"),
          ),

          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text("다크모드"),
          ),

        ],
      ),
    );
  }
}