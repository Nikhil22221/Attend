import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui0/main.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  void initState() {
    super.initState();
    getID();
  }

  void getID() async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('Employees')
        .where('id', isEqualTo: User.username)
        .get();

    setState(() {
      User.eid = snap.docs[0].id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              'History Page',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Nexa',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Stack(
            children: [
              Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    'Pick A Month',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(20, 15, 50, 0),
                child: Text(
                  DateFormat('MMMM').format(DateTime.now()),
                  style: TextStyle(
                      fontSize: 29,
                      fontFamily: 'Nexa',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Employees')
                  .doc(User.eid)
                  .collection('Record')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Text(
                          snap[index]['Check In'],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  // While waiting for data to load, you can show a loading indicator
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
