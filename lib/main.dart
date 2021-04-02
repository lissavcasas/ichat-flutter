import 'package:chat_app/src/routes/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//void main() => runApp(MyApp());
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: MaterialColor(
          0xff4346E9,
          {
            50: Color(0XFF333AA5),
            100: Color(0XFF333AA5),
            200: Color(0XFF333AA5),
            300: Color(0XFF333AA5),
            500: Color(0XFF333AA5),
            600: Color(0XFF333AA5),
            700: Color(0XFF333AA5),
            800: Color(0XFF333AA5),
            900: Color(0XFF333AA5),
          },
        ),
      ),
      initialRoute: 'splash_page',
      routes: getApplicationRoutes(),
    );
  }
}
