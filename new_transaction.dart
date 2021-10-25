//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransaction;

  NewTransaction(this._addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TitleController = TextEditingController();
  final CostController = TextEditingController();
  DateTime _selectedDate;

  void submit() {
    final title = TitleController.text;
    final cost = double.parse(CostController.text);
    if ((cost <= 0) || (title.isEmpty)|| _selectedDate==null) {
      return;
    }

    widget._addTransaction(title, cost,_selectedDate);
    Navigator.of(context).pop();
  }
  void _showDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2021), lastDate: DateTime.now()).then((pickedDate) {
      if(pickedDate==null){
        return;
      }setState(() {
        _selectedDate=pickedDate;

      });
    });
    print('...');
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              decoration: InputDecoration(labelText: "Product "),
              controller: TitleController,
              onSubmitted: (_) => submit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "cost"),
              controller: CostController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit(),
            ),

               Row(

                children: [
                  Text(_selectedDate==null? 'Please choose the date' :'Picked Date ${DateFormat.yMd().format(_selectedDate)}'),
                  FlatButton(
                      onPressed:_showDatePicker ,
                      child: Text('Date picker',
                          style: GoogleFonts.zillaSlab(
                              color: Theme.of(context).primaryColorDark,


                          )))
                ],
              ),

            OutlinedButton(
              onPressed: submit,
              child: Text("Add me!!"),
            ),
          ]),
        ),
      ),
    );
  }

}
