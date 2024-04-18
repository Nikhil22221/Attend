import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Num extends StatefulWidget {
  const Num({super.key});

  @override
  State<Num> createState() => _NumState();
}

class _NumState extends State<Num> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/ui.png'), fit: BoxFit.cover)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 5, 40, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logoh.png',
                    width: 120,
                    height: 120,
                  ),
                  Text(
                    'Welcome To Attend Ease',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nexa'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'App By Team 1000101',
                    style: TextStyle(fontSize: 19, color: Colors.black87),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(70, 10, 0, 10),
              child: Column(
                children: [
                  Container(
                    width: 300,
                    child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 30, 0, 30),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.security,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('Secure Data',
                                      style: TextStyle(fontSize: 18))
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.camera,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('Selfie Authorization',
                                      style: TextStyle(fontSize: 18))
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.timelapse,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('Real Time Tracking',
                                      style: TextStyle(fontSize: 18))
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.task_sharp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Manage Tasks',
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Column(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[400]),
                          minimumSize: MaterialStateProperty.all(Size(80, 60))),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'biom');
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login To Your Employee Account',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            'assets/right.png',
                            height: 32,
                            width: 32,
                            color: Colors.white,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
