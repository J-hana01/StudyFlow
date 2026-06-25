import 'package:flutter/material.dart';

class VisitWindowScreen extends StatefulWidget {

  const VisitWindowScreen({super.key});

  @override
  State<VisitWindowScreen> createState() =>
      _VisitWindowScreenState();

}

class _VisitWindowScreenState
    extends State<VisitWindowScreen> {

  DateTime baselineDate = DateTime.now();

  DateTime startDate = DateTime.now();

  DateTime endDate = DateTime.now();

  void calculateWindow() {

    DateTime targetDate =
        baselineDate.add(
      const Duration(days: 84),
    );

    startDate =
        targetDate.subtract(
      const Duration(days: 7),
    );

    endDate =
        targetDate.add(
      const Duration(days: 14),
    );

    setState(() {});
  }

  Future<void> selectBaselineDate() async {

    final picked =
        await showDatePicker(

      context: context,

      initialDate: baselineDate,

      firstDate: DateTime(2020),

      lastDate: DateTime(2100),

    );

    if (picked != null) {

      baselineDate = picked;

      calculateWindow();

    }

  }

  @override
  void initState() {

    super.initState();

    calculateWindow();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(

        title: const Text(
          "Visit Window",
        ),

        backgroundColor: Colors.indigo,

        foregroundColor: Colors.white,

      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            ElevatedButton(

              onPressed:
                  selectBaselineDate,

              child: const Text(
                "Select Baseline Date",
              ),

            ),

            const SizedBox(height: 30),

            Text(
              "Baseline : "
              "${baselineDate.year}-${baselineDate.month}-${baselineDate.day}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "V4",
              style: TextStyle(
                fontSize: 25,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Allowed Start\n"
              "${startDate.year}-${startDate.month}-${startDate.day}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Allowed End\n"
              "${endDate.year}-${endDate.month}-${endDate.day}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

          ],

        ),

      ),

    );

  }

}