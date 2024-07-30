import 'package:employee_managment/presentation/sign_up_screen/desktop.dart';
import 'package:employee_managment/presentation/sign_up_screen/mobile.dart';
import 'package:employee_managment/presentation/sign_up_screen/tablet.dart';
import 'package:employee_managment/global_widget/responsive_layout.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileBody: SignupMobile(), tabletBody:SignUpTablet() , desktopBody: SignUpDesktop(),

    );
  }
}