import 'package:flutter/material.dart';

import '../widgets/visit_tile.dart';

class SubjectDetailScreen extends StatelessWidget {

  final String studyName;
  final String subjectNumber;
  final String sex;
  final DateTime birthDate;

  const SubjectDetailScreen({
    super.key,
    required this.studyName,
    required this.subjectNumber,
    required this.sex,
    required this.birthDate,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(

        title: Text(
          "Subject $subjectNumber",
        ),

        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,

      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          Card(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            child: Padding(

              padding: const EdgeInsets.all(20),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const Text(

                    "Basic Information",

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),

                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Study : $studyName",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Subject : $subjectNumber",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Sex : $sex",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Birth Date : "
                    "${birthDate.year}-${birthDate.month}-${birthDate.day}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),

                ],

              ),

            ),

          ),

          const SizedBox(height: 30),

          const Text(

            "Visit Tracker",

            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),

          ),

          const SizedBox(height: 15),

          const VisitTile(index: 0),
          const VisitTile(index: 1),
          const VisitTile(index: 2),
          const VisitTile(index: 3),
          const VisitTile(index: 4),
          const VisitTile(index: 5),

        ],

      ),

    );

  }

}