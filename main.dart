//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/models/Transaction.dart';
import 'package:untitled3/widget/transaction_list.dart';
import './new_transaction.dart';
import 'chart.dart';

void main() {
  runApp(New());
}
class New extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
            accentColor: Colors.yellowAccent,
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }
  final List<Transaction> _userTransaction = [
   //ransaction(id: 't1', title: 'Nike', cost:
   //000, date: DateTime.now()),
   //ransaction(
    //  id: 'r444', title: 'Nykaa eyeliner', cost: 500, date: DateTime.now())
  ];
void _deleteTransaction(String id){
  setState(() {
    _userTransaction.removeWhere((tx) => tx.id==id);
  });
}
  void _addTransaction(String txTitle, double Costtx,DateTime chosenDate) {
    final newtx = Transaction(title: txTitle,
        cost: Costtx,
        date: chosenDate,
        id: chosenDate.toString());
    setState(() {
      _userTransaction.add(newtx);
    });
  }

void _startAdd(BuildContext ctx){
  showModalBottomSheet(context: ctx, builder:(_){
    return GestureDetector(
    onTap:(){},

    child:NewTransaction(_addTransaction),
    behavior: HitTestBehavior.opaque,
    ); });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expense alert",style:GoogleFonts.anonymousPro()),

          backgroundColor: Theme.of(context).primaryColorLight,
          actions: [
            IconButton(onPressed:()=>_startAdd(context) , icon: Icon(Icons.add))
          ],
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Card(child: Container(width: 200,
                    height: 30,
                    color: Theme.of(context).primaryColor,
                    child: Text("We are here to assist you!!",style: GoogleFonts.quicksand(),)), elevation: 5,),
                TransactionList(_userTransaction,_deleteTransaction),
                Chart(_recentTransactions),

        ]),
          ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton:FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:()=>_startAdd(context) ,
        ),
    );
  }
}
