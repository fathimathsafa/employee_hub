import 'package:employee_managment/global_widget/responsive_layout.dart';
import 'package:employee_managment/presentation/add_employee_Screen/desktop_add_employee.dart';
import 'package:employee_managment/presentation/add_employee_Screen/mobile_add_employee.dart';
import 'package:employee_managment/presentation/add_employee_Screen/tablet_add_employee.dart';
import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileBody:MobileAddEmployeeScreen() , tabletBody: TabletAddEmployeeScreen(), desktopBody: DesktopAddEmployeeScreen(),);
  }
}