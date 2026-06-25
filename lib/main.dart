import 'providers/visit_schedule_provider.dart';

import 'providers/visit_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';

import 'providers/schedule_provider.dart';
import 'providers/search_provider.dart';
import 'providers/subject_provider.dart';

void main() {

  runApp(

    MultiProvider(

      providers: [

  ChangeNotifierProvider(
    create: (_) => ScheduleProvider(),
  ),

  ChangeNotifierProvider(
    create: (_) => SearchProvider(),
  ),

  ChangeNotifierProvider(
    create: (_) => SubjectProvider(),
  ),

  ChangeNotifierProvider(
    create: (_) => VisitProvider(),
  ),

  ChangeNotifierProvider(
  create: (_) =>
      VisitScheduleProvider(),
),

],

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