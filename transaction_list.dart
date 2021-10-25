import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:untitled3/models/Transaction.dart';


class TransactionList extends StatelessWidget {
  final List <Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);


  @override
  Widget build(BuildContext context) {
    return Container(
      height:400,
      child: transactions.isEmpty?Column(children:[Text('No Transaction',
      style: GoogleFonts.dancingScript(),),
    Image.asset('assets/images/waiting.jpg',height: 270)
    ]):ListView.builder(
    itemBuilder: (ctx,index) {
      return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 4,
        ),
      child:ListTile(
        trailing: IconButton(icon:Icon(Icons.delete),
        color:Color.fromARGB(220,220,0,0), onPressed:()=>deleteTx(transactions[index].id) ,),
        leading: CircleAvatar(
          radius: 30,
          child:Padding(
          padding: EdgeInsets.all(15.0),
          child: FittedBox(

            child: Text('\$${transactions[index].cost}'),
          fit: BoxFit.contain,
          ),
        ),
        ),
        title: Text(transactions[index].title,style: GoogleFonts.benchNine(),),
        subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),

      ),
      );
    },
    itemCount: transactions.length,

    )
    );

  }
}
