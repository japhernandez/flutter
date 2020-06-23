import 'package:components/src/pages/alert.dart';
import 'package:components/src/pages/avatar.dart';
import 'package:components/src/pages/home_temp.dart';
import 'package:flutter/material.dart';
import 'package:components/src/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Componentes App',
        debugShowCheckedModeBanner: false,
        // home: HomePage(),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => HomePage(),
          'alert': (BuildContext context) => AlertPage(),
          'avatar': (BuildContext context) => AvatarPage()
        });
  }
}
