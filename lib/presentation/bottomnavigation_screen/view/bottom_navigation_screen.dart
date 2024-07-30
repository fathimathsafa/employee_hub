import 'package:employee_managment/global_widget/responsive_layout.dart';
import 'package:employee_managment/presentation/bottomnavigation_screen/desktop_bottom_Navigation.dart';
import 'package:employee_managment/presentation/bottomnavigation_screen/mobile_bottom_navigation.dart';
import 'package:employee_managment/presentation/bottomnavigation_screen/tablet_bottom_naviggation.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: MobileBottomNavigationScreen(),
      tabletBody: TabletBottomNavigationScreen(),
      desktopBody: DesktopBottomNavigationScreen(),
    );
  }
}