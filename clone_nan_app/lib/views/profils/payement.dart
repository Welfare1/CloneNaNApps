import 'package:flutter/material.dart';

class Payement extends StatelessWidget {
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July'
  ];
  final List<int> payments = [50000, 0, 25000, 0, 25000, 0, 0];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DataTable(
            columns: [
              DataColumn(label: Text('Month')),
              DataColumn(label: Text('Mount (FCFA)')),
            ],
            rows: List.generate(months.length, (index) {
              return DataRow(cells: [
                DataCell(Text(months[index])),
                DataCell(Text(payments[index].toString())),
              ]);
            }),
          ),
          // SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(border: Border.all(width: .5)),
            child: Column(
              children: [
                Text("Total Mount : 100000 FCFA"),
                Text("Remaining paid: 60000 FCFA"),
              ],
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: Text("Make a payement"))
        ],
      ),
    );
  }
}
