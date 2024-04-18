import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui0/navbar.dart';
import 'package:slide_to_act/slide_to_act.dart';

class attend extends StatefulWidget {
  var employee;
  attend({Key? key, required this.employee}) : super(key: key);

  @override
  State<attend> createState() => _attendState();
}

class _attendState extends State<attend> {
  Color buttonof = Colors.red;
  Color buttonon = Colors.lightGreen;
  Color def1 = Colors.red;
  Color def2 = Colors.red;
  Color def3 = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text(
          'Attendance Sheet',
          style:
              TextStyle(fontFamily: 'Nexa', color: Colors.white, fontSize: 32),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/ui.png'), fit: BoxFit.cover)),
          child: ListView(
            children: [
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
                      '${widget.employee} ,',
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
                          height: 20,
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
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Builder(
                    builder: (context) {
                      final GlobalKey<SlideActionState> key = GlobalKey();

                      return SlideAction(
                        text: '     Slide To Mark Attendance',
                        textStyle: TextStyle(fontSize: 20, color: Colors.white),
                        outerColor: Colors.blue[600],
                        key: key,
                        onSubmit: () {
                          key.currentState!.reset();
                        },
                      );
                    },
                  )),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                                  decoration:
                                      BoxDecoration(color: Colors.white),
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
                                  decoration:
                                      BoxDecoration(color: Colors.white),
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      def1),
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                      Size(10, 0))),
                                        ),
                                      ),
                                    ),
                                  ]),
                              TableRow(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      def2),
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                      Size(10, 0))),
                                        ),
                                      ),
                                    ),
                                  ]),
                              TableRow(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      def3),
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
              )
            ],
          )),
      bottomNavigationBar: nav(),
    );
  }
}
