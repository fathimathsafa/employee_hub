import 'package:employee_managment/presentation/log_in_screen/desktop_login.dart';
import 'package:employee_managment/presentation/log_in_screen/mobile_login.dart';
import 'package:employee_managment/presentation/log_in_screen/tablet_login.dart';
import 'package:employee_managment/global_widget/responsive_layout.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: LoginMobile(),
      tabletBody: LoginTablet(),
      desktopBody: LoginDesktop(),
    );
  }
}
