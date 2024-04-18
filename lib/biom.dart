import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ui0/num.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class biom extends StatefulWidget {
  const biom({super.key});

  @override
  State<biom> createState() => _biomState();
}

class _biomState extends State<biom> {
  final LocalAuthentication auth = LocalAuthentication();

  check() async {
    bool isAvailable;
    isAvailable = await auth.canCheckBiometrics;
    print(isAvailable);

    if (isAvailable) {
      bool result = await auth.authenticate(
        localizedReason: 'Scan Your Fingerprint To Proceed',
      );

      if (result) {
        Navigator.pushReplacementNamed(context, 'login');
      } else {
        print('Permissiom Denied');
      }
    } else {
      print('Fingerprint Sensor Not Detected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/1.png'), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Text(
                  'Biometric',
                  style: TextStyle(fontSize: 60, fontFamily: 'Nexa'),
                ),
              ),
              Lottie.asset('Animations/anim.json',
                  width: 300, height: 300, fit: BoxFit.cover),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Fingerprint Auth',
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Nexa',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: Text(
                        'Authenticate Your Fingerprint To Go To ',
                        style: TextStyle(fontSize: 18, fontFamily: 'Nexa'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: Text(
                        'The Attendance Page ',
                        style: TextStyle(fontSize: 18, fontFamily: 'Nexa'),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 300,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: () {
                          check();
                        },
                        child: Text(
                          'Authenticate',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue[400])),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
