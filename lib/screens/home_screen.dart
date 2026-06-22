import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/schedule_provider.dart';
import '../widgets/schedule_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text(
          "StudyFlow",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Good Morning ☀️",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "오늘 일정",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Consumer<ScheduleProvider>(
              builder: (context, provider, child) {

                if (provider.schedules.isEmpty) {

                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "등록된 일정이 없습니다.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );

                }

                return Column(
                  children: provider.schedules
                      .map(
                        (schedule) => ScheduleCard(
                          schedule: schedule,
                        ),
                      )
                      .toList(),
                );

              },
            ),

            const SizedBox(height: 30),

            const Text(
              "다가오는 일정",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              color: Colors.orange.shade50,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: const ListTile(

                leading: CircleAvatar(
                  backgroundColor: Colors.orange,

                  child: Icon(
                    Icons.warning,
                    color: Colors.white,
                  ),
                ),

                title: Text(
                  "지속심의 제출",
                ),

                subtitle: Text(
                  "D-1",
                ),

              ),

            ),

          ],

        ),

      ),

    );
  }
}