import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui0/attend.dart';
import 'package:ui0/biom.dart';
import 'package:ui0/firebase_options.dart';
import 'package:ui0/login.dart';
import 'package:ui0/navbar1.dart';
import 'package:ui0/num.dart';
import 'package:ui0/otpscreen1.dart';
import 'package:ui0/otpscreen2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: 'auth',
      routes: {
        'auth': (context) => Authcheck(),
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
        'nav1': (context) => nav1(
              employee: null,
            ),
      },
    );
  }
}

class User {
  static String username = "";
  static String eid = "";
}

class Authcheck extends StatefulWidget {
  const Authcheck({super.key});

  @override
  State<Authcheck> createState() => _AuthcheckState();
}

class _AuthcheckState extends State<Authcheck> {
  bool UserAvailable = false;
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    sharedPreferences = await SharedPreferences.getInstance();

    try {
      if (sharedPreferences.getString('emplyid') != Null) {
        setState(() {
          User.username = sharedPreferences.getString('emplyid')!;
          UserAvailable = true;
        });
      }
    } catch (e) {
      setState(() {
        UserAvailable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (UserAvailable) {
      return nav1(employee: '');
    } else {
      return login();
    }
    ;
  }
}
