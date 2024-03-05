import 'package:flutter/material.dart';

class AppColor {
  static const Color azureRadiance = Color(0xFF0B86E6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color osloGray = Color(0xFF949A9A);

  static const MaterialColor azureRadianceSwatch = MaterialColor(0xFF0B86E6, _azureRadianceMap);

  static const Map<int, Color> _azureRadianceMap = {
    50: Color.fromRGBO(11, 134, 231, .1),
    100: Color.fromRGBO(11, 134, 231, .2),
    200: Color.fromRGBO(11, 134, 231, .3),
    300: Color.fromRGBO(11, 134, 231, .4),
    400: Color.fromRGBO(11, 134, 231, .5),
    500: Color.fromRGBO(11, 134, 231, .6),
    600: Color.fromRGBO(11, 134, 231, .7),
    700: Color.fromRGBO(11, 134, 231, .8),
    800: Color.fromRGBO(11, 134, 231, .9),
    900: Color.fromRGBO(11, 134, 231, 1),
  };
}