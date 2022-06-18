// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'quotes.dart';

class QuotesCard extends StatelessWidget {
  final Quotes quote;
  final Function delete;
  QuotesCard({ required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(quote.first_text,
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 2.0,),
            Text(quote.second_text,
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.amber,
              ),
            ),
            FlatButton.icon(
              onPressed: (){delete();},
              label: Text('delete quote'),
              icon: Icon(Icons.delete),
             )
          ],
        ),
      ),
    );
  }
}