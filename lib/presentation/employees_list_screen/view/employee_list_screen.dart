import 'package:employee_managment/global_widget/responsive_layout.dart';
import 'package:employee_managment/presentation/employees_list_screen/desktop_employee_list_screen.dart';
import 'package:employee_managment/presentation/employees_list_screen/mobile_employee_list.dart';
import 'package:employee_managment/presentation/employees_list_screen/tablet_employee_list_screen.dart';
import 'package:flutter/material.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileBody: MobileEmployeeListScreen(), tabletBody: TabletEmployeeListScreen(), desktopBody: DesktopEmployeeListScreen(),);
  }
}