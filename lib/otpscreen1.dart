import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui0/otpscreen2.dart';

class otp1 extends StatefulWidget {
  const otp1({super.key});

  @override
  State<otp1> createState() => _otp1State();
}

class _otp1State extends State<otp1> {
  TextEditingController countrycode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var phone = '';

    @override
    void initState() {
      // TODO: implement initState
      countrycode.text = '+91';
      super.initState();
    }

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/ui.png'), fit: BoxFit.cover)),
      child: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/phone.png'),
                width: 300,
                height: 300,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Phone Verification ',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nexa'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                ' Before we begin, lets get your phone registered !',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '+91'),
                      ),
                    ),
                    SizedBox(
                      width: 0,
                    ),
                    Text(
                      " | ",
                      style: TextStyle(fontSize: 30, color: Colors.grey[850]),
                    ),
                    Expanded(
                      child: TextField(
                        controller: countrycode,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Phone No'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException ex) {},
                        codeSent: (String verificationId, int? resendtoken) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      otp2(verificationid: verificationId)));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                        phoneNumber: countrycode.text.toString());
                  },
                  child: Text(
                    'Send the code',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[700])),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
