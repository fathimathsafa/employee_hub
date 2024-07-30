import 'package:employee_managment/core/constants/color_constants.dart';
import 'package:employee_managment/core/constants/text_style_constants.dart';
import 'package:employee_managment/presentation/bottomnavigation_screen/view/bottom_navigation_screen.dart';
import 'package:employee_managment/repository/api/employee_list/model/employee_list_model.dart';
import 'package:flutter/material.dart';

class DeasktopEmployeeDetailsScreen extends StatelessWidget {
  final Datum employee;

  const DeasktopEmployeeDetailsScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.lightGreen,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorTheme.darkgreen,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomNavigationScreen()));
          },
        ),
        centerTitle: true,
        title: Text(
          'EMPLOYEE HUB',
          style: GlTextStyles.oswald(
              size: 20, weight: FontWeight.bold, color: ColorTheme.darkgreen),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Name: ${employee.employeeName}',
              style: GlTextStyles.interStyl(
                  size: 25,
                  weight: FontWeight.bold,
                  color: ColorTheme.darkgreen),
            ),
            Text(
              'Salary: ${employee.employeeSalary}',
              style: GlTextStyles.interStyl(
                  size: 20,
                  weight: FontWeight.bold,
                  color: ColorTheme.darkgreen),
            ),
            Text(
              'Age: ${employee.employeeAge}',
              style: GlTextStyles.interStyl(
                  size: 20,
                  weight: FontWeight.bold,
                  color: ColorTheme.darkgreen),
            ),
          ],
        ),
      ),
    );
  }
}
