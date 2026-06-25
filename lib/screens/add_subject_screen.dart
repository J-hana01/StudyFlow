import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';
import 'add_subject_screen.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text(
          "Subjects",
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.indigo,

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),

        onPressed: () {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
                  const AddSubjectScreen(),

            ),

          );

        },

      ),

      body: Consumer<SubjectProvider>(

        builder: (
            context,
            provider,
            child,
            ) {

          if (provider.subjects.isEmpty) {

            return const Center(

              child: Text(
                "등록된 Subject가 없습니다.",
              ),

            );

          }

          return ListView.builder(

            padding: const EdgeInsets.all(20),

            itemCount: provider.subjects.length,

            itemBuilder: (context, index) {

              final subject =
              provider.subjects[index];

              return Card(

                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(20),
                ),

                child: ListTile(

                  leading: CircleAvatar(

                    backgroundColor:
                    Colors.indigo,

                    child: Text(

                      subject.subjectNumber,

                      style: const TextStyle(
                        color: Colors.white,
                      ),

                    ),

                  ),

                  title: Text(
                    subject.subjectNumber,
                  ),

                  subtitle: Text(

                    "${subject.sex}\n"
                        "${subject.birthDate.year}-"
                        "${subject.birthDate.month}-"
                        "${subject.birthDate.day}",

                  ),

                ),

              );

            },

          );

        },

      ),

    );

  }
}