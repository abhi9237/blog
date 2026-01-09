import 'package:flutter/material.dart';

class AppRoute {
  static MaterialPageRoute goRoute(Widget routeName) {
    return MaterialPageRoute(builder: (context) => routeName);
  }
}
