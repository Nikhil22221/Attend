import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ui0/attend.dart';
import 'package:ui0/biom.dart';
import 'package:ui0/firebase_options.dart';
import 'package:ui0/login.dart';
import 'package:ui0/num.dart';
import 'package:ui0/otpscreen1.dart';
import 'package:ui0/otpscreen2.dart';

void main() async{

    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      initialRoute: 'otp1',
      routes: {
        'num': (context) => Num(),
        'login': (context) => login(),
        'otp1': (context) => otp1(),
        'otp2': (context) => otp2(
              verificationid: '',
            ),
        'attend': (context) => attend(
              employee: null,
            ),
        'biom': (context) => biom(),
      },
    );
  }
}
