import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
    Container(
      height: 20,
        child: FittedBox(child:Text('\$${spendingAmount.toStringAsFixed(0)}'),)),
    SizedBox(
    height: 4,
    ),
    Container(
    height: 60,
    width: 10,
    child: Stack(
    children: [
    Container(padding: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
    border: Border.all(color: Theme.of(context).accentColor),
    color: Color.fromARGB(110, 60, 100, 220),
    borderRadius:BorderRadius.circular(10),
    )),
    FractionallySizedBox(heightFactor: spendingPctOfTotal,child: Container(
    decoration: BoxDecoration(color: Theme.of(context).accentColor,borderRadius: BorderRadius.circular(10),border: Border.all(color:Color.fromARGB(220,220,220,220)))

    ),)
    ],
    ),
    ),
    SizedBox(
    height: 4,
    ),
    Text(label),
    ]
    ,
    );
  }
}
