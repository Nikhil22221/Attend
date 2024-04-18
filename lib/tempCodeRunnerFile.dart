
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
