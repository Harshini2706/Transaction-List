import 'dart:core';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/models/Transaction.dart';
import 'package:untitled3/widget/chart_bar.dart';

class Chart extends StatelessWidget {
  double get maxSpending{
    return groupedTransactionValues.fold(0.0, (sum,item) {
      return sum+(item['cost']as double);
    });
  }
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum=0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum+=recentTransactions[i].cost;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {'day': DateFormat.E().format(weekDay).substring(0,3), 'cost': totalSum};
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(

        elevation: 5,
        child: Flexible(
          fit: FlexFit.tight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: groupedTransactionValues.map((data)
      {
          return ChartBar(data['day']as String,data['cost']as double,maxSpending==0.0?0.0:(data['cost']as double)/maxSpending);
      }).toList()
          ),
        ),
    );
  }
}
