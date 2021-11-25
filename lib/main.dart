import 'screens/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/login.dart';
import 'screens/fingerprint_login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Loader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: Color.fromRGBO(72, 84, 108, 1),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: Colors.teal),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(72, 84, 108, 1),
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.blueAccent,
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}