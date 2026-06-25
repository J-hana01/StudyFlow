import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/visit_schedule_provider.dart';

class VisitScheduleScreen extends StatelessWidget {

  const VisitScheduleScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(

        title: const Text(
          "Visit Schedule",
        ),

        backgroundColor: Colors.indigo,

        foregroundColor: Colors.white,

      ),

      body: Consumer<VisitScheduleProvider>(

        builder: (
          context,
          provider,
          child,
        ) {

          return ListView.builder(

            padding: const EdgeInsets.all(20),

            itemCount: provider.visits.length,

            itemBuilder: (
              context,
              index,
            ) {

              final visit =
                  provider.visits[index];

              final targetDate =
                  provider.getTargetDate(
                      visit);

              final startDate =
                  provider.getStartDate(
                      visit);

              final endDate =
                  provider.getEndDate(
                      visit);

              return Card(

                shape:
                    RoundedRectangleBorder(

                  borderRadius:
                      BorderRadius.circular(
                          20),

                ),

                margin:
                    const EdgeInsets.only(
                  bottom: 15,
                ),

                child: Padding(

                  padding:
                      const EdgeInsets.all(
                          20),

                  child: Column(

                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Text(

                        visit.visitName,

                        style:
                            const TextStyle(

                          fontSize: 24,

                          fontWeight:
                              FontWeight.bold,

                        ),

                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      Text(
                        "Target Day : ${visit.targetDay}",
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        "Target Date\n"
                        "${targetDate.year}-${targetDate.month}-${targetDate.day}",
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        "Window\n"
                        "${startDate.year}-${startDate.month}-${startDate.day}"
                        "\n~\n"
                        "${endDate.year}-${endDate.month}-${endDate.day}",
                      )
                      const SizedBox(
  height: 15,
),

ElevatedButton(

  onPressed: () async {

    final selectedDate =
        await showDatePicker(

      context: context,

      initialDate: DateTime.now(),

      firstDate: DateTime(2020),

      lastDate: DateTime(2100),

    );

    if (selectedDate != null) {

      provider.completeVisit(
        index,
        selectedDate,
      );

    }

  },

  child: const Text(
    "Complete Visit",
  ),

),,

                    ],

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