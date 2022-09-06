import 'package:flutter/material.dart';

class ResponsiveUtil {
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  /* static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 800 &&
      MediaQuery.of(context).size.width < 1200;*/
}

enum DeviceType { desktop, mobile, tablet }
