// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'quotes.dart';
import 'quote_card.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var score_num;
  var score_str;
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  List<Quotes> quotes = [
    Quotes(first_text: 'Hello world My name is Matan', second_text: 'first line'),
    Quotes(first_text: 'Hii I\'m line 2', second_text: 'second line'),
    Quotes(first_text: 'Hii I\'\\m line 3', second_text: 'third line'),
  ];

  _MyAppState() {
    score_num = 0;
    score_str = myFormat.format(score_num);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState((){
              score_num += 150000;
              score_str = myFormat.format(score_num);
            });
          },
          backgroundColor: Colors.grey[900],
          child:Icon(
                  Icons.add,
                  color: Colors.black
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Center(
            child: Text('My Profile',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 3.0,
            )),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/a123.jpg'),
                  ),
              ),
              Divider(
                color: Colors.black,
                height: 10.0,
                thickness: 3.0,
              ),
              SizedBox(height: 10.0),
              Text('NAME',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 12.0,
                ),),
              Text('Matan Lazimi',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 16.0,
                  )
              ),
              SizedBox(height: 10.0,),
              Text('Score',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 12.0,
                ),),
              Text(score_str.toString(),
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 16.0,
                  )
              ),
              SizedBox(height: 10.0,),
              Row(
                children: [
                  Icon(Icons.email
                  ),
                  SizedBox(width: 5.0,),
                  Text('matanla1@ac.sce.ac.il',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 16.0,
                      )
                  )
                ],
              ),
              Column(
                children: quotes.map((quote) => QuotesCard(
                    quote: quote,
                    delete: () {
                      setState(() {
                      quotes.remove(quote);
                    });},
                )).toList()
              ),


            ]
          ),
        ),
      )
      ,
    );
  }
}