import 'package:employee_managment/core/constants/check_size.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key,
      required this.mobileBody,
      required this.tabletBody,
      required this.desktopBody});
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = MediaQuery.of(context).size.width;
        if (fnCheckMobile(width)) {
          return mobileBody;
        } else if (fnCheckTablet(width)) {
          return tabletBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
