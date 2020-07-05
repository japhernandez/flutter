import 'package:chat/pages/home.dart';
import 'package:chat/pages/login.dart';
import 'package:chat/pages/sign_up.dart';
import 'package:chat/pages/splash.dart';
import 'package:chat/providers/me.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Me(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashPage(),
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'signup': (BuildContext context) => SignUpPage(),
          'home': (BuildContext context) => HomePage(),
          'splash': (BuildContext context) => SplashPage(),
        },
      ),
    );
  }
}
