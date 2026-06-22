import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../providers/schedule_provider.dart';
import '../models/schedule.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  bool isSameDate(DateTime a, DateTime b) {

    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Calendar"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Consumer<ScheduleProvider>(

        builder: (context, provider, child) {

          List<Schedule> selectedSchedules = provider.schedules.where(

            (schedule) => isSameDate(
              schedule.dateTime,
              selectedDay,
            ),

          ).toList();

          return Column(

            children: [

              TableCalendar(

                firstDay: DateTime(2024),
                lastDay: DateTime(2035),
                focusedDay: focusedDay,

                selectedDayPredicate: (day) {

                  return isSameDay(
                    selectedDay,
                    day,
                  );

                },

                onDaySelected: (selected, focused) {

                  setState(() {

                    selectedDay = selected;
                    focusedDay = focused;

                  });

                },

                eventLoader: (day) {

                  return provider.schedules.where(

                    (schedule) => isSameDate(
                      schedule.dateTime,
                      day,
                    ),

                  ).toList();

                },

              ),

              const SizedBox(height: 20),

              Expanded(

                child: selectedSchedules.isEmpty

                    ? const Center(

                        child: Text(
                          "일정이 없습니다.",
                        ),

                      )

                    : ListView.builder(

                        itemCount: selectedSchedules.length,

                        itemBuilder: (context, index) {

                          Schedule schedule =
                              selectedSchedules[index];

                          return Card(

                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
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
                                schedule.studyName,
                              ),

                            ),

                          );

                        },

                      ),

              ),

            ],

          );

        },

      ),

    );

  }

}