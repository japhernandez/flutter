import 'package:components/src/pages/alert.dart';
import 'package:components/src/pages/avatar.dart';
import 'package:components/src/pages/card.dart';
import 'package:components/src/pages/home.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage()
  };
}
