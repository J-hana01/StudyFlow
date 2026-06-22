import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';
import 'providers/schedule_provider.dart';

void main() {
  runApp(

    ChangeNotifierProvider(

      create: (context) => ScheduleProvider(),

      child: MaterialApp(

        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          colorSchemeSeed: Colors.indigo,
          useMaterial3: true,
        ),

        home: MainScreen(),

      ),

    ),

  );
}