import 'package:employee_managment/global_widget/responsive_layout.dart';
import 'package:employee_managment/presentation/details_screen/desktop_details_screen.dart';
import 'package:employee_managment/presentation/details_screen/mobile_details_screen.dart';
import 'package:employee_managment/presentation/details_screen/tablet_details_screen.dart';
import 'package:employee_managment/repository/api/employee_list/model/employee_list_model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Datum employee;
   const DetailsScreen({super.key, required this.employee});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: MobileEmployeeDetailsScreen(employee: widget.employee,),
      tabletBody: TabletEmployeeDetailsScreen(employee: widget.employee,),
      desktopBody: DeasktopEmployeeDetailsScreen(employee: widget.employee,),
    );
  }
}