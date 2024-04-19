import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:ui0/main.dart';

class nav1 extends StatefulWidget {
  var employee;
  nav1({Key? key, required this.employee}) : super(key: key);

  @override
  State<nav1> createState() => _nav1State();
}

class _nav1State extends State<nav1> {
  late SharedPreferences sharedPreferences;

  String CheckIn = '';
  String CheckOut = '';

  bool isSlideActionCompleted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecord();
  }

  void getRecord() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('Employees')
          .where('id', isEqualTo: User.username)
          .get();

      DocumentSnapshot snap2 = await FirebaseFirestore.instance
          .collection('Employees')
          .doc(snap.docs[0].id)
          .collection('Record')
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get();

      setState(() {
        CheckIn = snap2['Check In'];
        CheckOut = snap2['Check Out'];
      });
    } catch (e) {
      setState(() {
        CheckIn = '--/--';
        CheckOut = '--/--';
      });
    }
  }

  Color buttonof = Colors.red;
  Color buttonon = Colors.lightGreen;
  Color def1 = Colors.red;
  Color def2 = Colors.red;
  Color def3 = Colors.red;
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attendance Sheet',
          style:
              TextStyle(fontFamily: 'Nexa', color: Colors.white, fontSize: 32),
        ),
        toolbarHeight: 80,
        backgroundColor: Colors.blue[600],
        centerTitle: true,
      ),
      body: IndexedStack(
        index: currentindex,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/ui.png',
                  ),
                  fit: BoxFit.cover),
            ),
            child: ListView(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome,',
                      style: TextStyle(fontSize: 19),
                    ),
                    Text(
                      User.username + widget.employee,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Libre'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Card.outlined(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Column(
                      children: [
                        Text(
                          'Attendance this Month : Present/Total',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Nexa'),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Report',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue[700]),
                              minimumSize:
                                  MaterialStateProperty.all(Size(40, 40))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                  child: Text(
                    "Today's Attendance",
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 3,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(14, 0, 10, 10),
                height: 145,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 40, 15, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Check In",
                                style: TextStyle(
                                    fontFamily: 'Nexa',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26),
                              ),
                              Text(
                                "${CheckIn}",
                                style: TextStyle(
                                    fontFamily: 'Nexa',
                                    fontSize: 22,
                                    color: Colors.red[600],
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Column(
                            children: [
                              Text(
                                "Check Out",
                                style: TextStyle(
                                    fontFamily: 'Nexa',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26),
                              ),
                              Text(
                                "${CheckOut}",
                                style: TextStyle(
                                    fontFamily: 'Nexa',
                                    fontSize: 22,
                                    color: Colors.red[600],
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              CheckOut == '--/--'
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Builder(
                        builder: (context) {
                          final GlobalKey<SlideActionState> key = GlobalKey();

                          return SlideAction(
                            text: '     Slide To Mark Attendance',
                            textStyle:
                                TextStyle(fontSize: 20, color: Colors.white),
                            outerColor: Colors.blue[600],
                            key: key,
                            onSubmit: () async {
                              Timer(Duration(seconds: 1), () {
                                key.currentState!.reset();
                              });

                              await Future.delayed(Duration(seconds: 1));

                              QuerySnapshot snap = await FirebaseFirestore
                                  .instance
                                  .collection('Employees')
                                  .where('id', isEqualTo: User.username)
                                  .get();

                              DocumentSnapshot snap2 = await FirebaseFirestore
                                  .instance
                                  .collection('Employees')
                                  .doc(snap.docs[0].id)
                                  .collection('Record')
                                  .doc(DateFormat('dd MMMM yyyy')
                                      .format(DateTime.now()))
                                  .get();

                              try {
                                String checkIn = snap2['Check In'];

                                setState(() {
                                  CheckOut = DateFormat('hh:mm')
                                      .format(DateTime.now());
                                });

                                await FirebaseFirestore.instance
                                    .collection('Employees')
                                    .doc(snap.docs[0].id)
                                    .collection('Record')
                                    .doc(DateFormat('dd MMMM yyyy')
                                        .format(DateTime.now()))
                                    .update({
                                  'Check In': checkIn,
                                  'Check Out':
                                      DateFormat('hh:mm').format(DateTime.now())
                                });
                              } catch (e) {
                                setState(() {
                                  CheckIn = DateFormat('hh:mm')
                                      .format(DateTime.now());
                                });
                                await FirebaseFirestore.instance
                                    .collection('Employees')
                                    .doc(snap.docs[0].id)
                                    .collection('Record')
                                    .doc(DateFormat('dd MMMM yyyy')
                                        .format(DateTime.now()))
                                    .set({
                                  'Check In':
                                      DateFormat('hh:mm').format(DateTime.now())
                                });
                              }
                            },
                          );
                        },
                      ))
                  : Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 10, 0),
                      child: Text(
                        'Your Attendance Is Marked For Today',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Nexa',
                        ),
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[600])),
                onPressed: () async {
                  //   sharedPreferences = await SharedPreferences.getInstance();
                  // setState(() {
                  //     sharedPreferences.remove('emplyid');
                  // });
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ]),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/ui.png'), fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Card.outlined(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 15, 15, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today Tasks',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Nexa'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Table(
                          columnWidths: {
                            0: FlexColumnWidth(
                                40), // Adjust the value as needed
                            1: FlexColumnWidth(
                                40), // Adjust the value as needed
                            2: FlexColumnWidth(
                                40), // Adjust the value as needed
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.intrinsicHeight,
                          border: TableBorder.all(color: Colors.black87),
                          children: [
                            TableRow(
                                decoration: BoxDecoration(color: Colors.white),
                                children: [
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(14),
                                      child: Text(
                                        '#',
                                        style: TextStyle(fontSize: 28),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(14),
                                      child: Text(
                                        'Tasks',
                                        style: TextStyle(
                                            fontSize: 24, fontFamily: 'Nexa'),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(14),
                                      child: Text(
                                        'Status',
                                        style: TextStyle(
                                            fontSize: 23, fontFamily: 'Nexa'),
                                      ),
                                    ),
                                  ),
                                ]),
                            TableRow(
                                decoration: BoxDecoration(color: Colors.white),
                                children: [
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text('    1',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontFamily: 'Nexa')),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text('Task 1',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Nexa')),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            def1 = buttonon;
                                          });
                                        },
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(def1),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(10, 0))),
                                      ),
                                    ),
                                  ),
                                ]),
                            TableRow(
                                decoration: BoxDecoration(color: Colors.white),
                                children: [
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text('    2',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontFamily: 'Nexa')),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text('Task 2',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Nexa')),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            def2 = buttonon;
                                          });
                                        },
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(def2),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(10, 0))),
                                      ),
                                    ),
                                  ),
                                ]),
                            TableRow(
                                decoration: BoxDecoration(color: Colors.white),
                                children: [
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text('    3',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontFamily: 'Nexa')),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text('Task 3',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Nexa')),
                                    ),
                                  ),
                                  TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            def3 = buttonon;
                                          });
                                        },
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(def3),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    Size(10, 0))),
                                      ),
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Icon(
              Icons.analytics,
              size: 80,
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
          height: 75,
          selectedIndex: currentindex,
          destinations: [
            NavigationDestination(
                icon: Icon(
                  Icons.check,
                  color: Colors.black,
                ),
                label: 'Attend'),
            NavigationDestination(
                icon: Icon(
                  Icons.task,
                  color: Colors.black,
                ),
                label: 'Tasks'),
            NavigationDestination(
                icon: Icon(
                  Icons.history,
                  color: Colors.black,
                ),
                label: 'History'),
          ],
          onDestinationSelected: (value) {
            setState(() {
              currentindex = value;
            });
          }),
    );
  }
}
