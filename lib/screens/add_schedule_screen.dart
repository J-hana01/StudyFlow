import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/schedule.dart';
import '../providers/schedule_provider.dart';

class AddScheduleScreen extends StatefulWidget {
  const AddScheduleScreen({super.key});

  @override
  State<AddScheduleScreen> createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends State<AddScheduleScreen> {

  final studyController = TextEditingController();
  final subjectController = TextEditingController();
  final visitController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> pickDate() async {

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (picked != null) {

      setState(() {

        selectedDate = picked;

      });

    }

  }

  Future<void> pickTime() async {

    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null) {

      setState(() {

        selectedTime = picked;

      });

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Add Schedule"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: studyController,
              decoration: const InputDecoration(
                labelText: "Study Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: subjectController,
              decoration: const InputDecoration(
                labelText: "Subject Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: visitController,
              decoration: const InputDecoration(
                labelText: "Visit",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ListTile(
              tileColor: Colors.white,
              title: const Text("Date"),
              subtitle: Text(
                "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
              ),
              trailing: const Icon(Icons.calendar_month),
              onTap: pickDate,
            ),

            const SizedBox(height: 15),

            ListTile(
              tileColor: Colors.white,
              title: const Text("Time"),
              subtitle: Text(
                selectedTime.format(context),
              ),
              trailing: const Icon(Icons.access_time),
              onTap: pickTime,
            ),

            const SizedBox(height: 30),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {

                  DateTime dateTime = DateTime(

                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute,

                  );

                  Schedule schedule = Schedule(

                    studyName: studyController.text,
                    subjectNumber: subjectController.text,
                    visit: visitController.text,
                    dateTime: dateTime,

                  );

                  context.read<ScheduleProvider>()
                      .addSchedule(schedule);

                  ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(
                      content: Text(
                        "일정이 저장되었습니다.",
                      ),
                    ),

                  );

                },

                child: const Text(
                  "Save",
                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}