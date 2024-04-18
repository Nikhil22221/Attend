import 'package:flutter/material.dart';
import 'package:ui0/attend.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image(
                    image: AssetImage('assets/circle.png'),
                    width: 190,
                    height: 190,
                  ),
                  Text(
                    'Employee Details Verification',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nexa'),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Enter Your Details To Check Your Attendance',
                    style: TextStyle(fontSize: 15, fontFamily: 'Nexa'),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black), // Border Color
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    width: 370,
                    height: 65,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: 'Employee ID', border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 380,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue[400]),
                            minimumSize:
                                MaterialStateProperty.all(Size(80, 60))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => attend(
                                      employee:
                                          nameController.text.toString())));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Continue To Attendance Page',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
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
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
