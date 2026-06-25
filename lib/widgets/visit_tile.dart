import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/visit_provider.dart';

class VisitTile extends StatelessWidget {
  final int index;

  const VisitTile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<VisitProvider>(
      builder: (context, provider, child) {
        final visit = provider.visits[index];

        return CheckboxListTile(
          value: visit.completed,

          title: Text(
            visit.name,
            style: TextStyle(
              decoration: visit.completed
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),

          activeColor: Colors.indigo,

          onChanged: (_) {
            provider.toggleVisit(index);
          },
        );
      },
    );
  }
}