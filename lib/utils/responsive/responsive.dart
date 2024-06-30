import 'package:flutter/material.dart';

class Responsive {
  /// for mobile
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 850;

  /// for tablet
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 850;

  /// for desktop
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;
}