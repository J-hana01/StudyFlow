import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/schedule.dart';
import '../providers/schedule_provider.dart';
import '../screens/edit_schedule_screen.dart';

class ScheduleCard extends StatelessWidget {
  final Schedule schedule;

  const ScheduleCard({
    super.key,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),

        title: Text(
          "${schedule.subjectNumber} ${schedule.visit}",
        ),

        subtitle: Text(
          "${schedule.studyName}\n"
          "${schedule.dateTime.year}-${schedule.dateTime.month}-${schedule.dateTime.day}",
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,

          children: [

            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.indigo,
              ),

              onPressed: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (_) => EditScheduleScreen(
                      schedule: schedule,
                    ),

                  ),

                );

              },

            ),

            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),

              onPressed: () async {

                await context
                    .read<ScheduleProvider>()
                    .removeSchedule(schedule);

              },

            ),

          ],

        ),

      ),

    );
  }
}