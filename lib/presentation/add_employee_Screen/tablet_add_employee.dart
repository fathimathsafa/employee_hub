import 'package:employee_managment/core/constants/color_constants.dart';
import 'package:employee_managment/core/constants/text_style_constants.dart';
import 'package:employee_managment/presentation/add_employee_Screen/controller/add_employee_controller.dart';
import 'package:employee_managment/repository/api/employee_list/model/employee_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabletAddEmployeeScreen extends StatelessWidget {
  final AddEmployeeController controller = Get.put(AddEmployeeController());
  final nameController = TextEditingController();
  final salaryController = TextEditingController();
  final ageController = TextEditingController();

  TabletAddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              TextField(
                controller: salaryController,
                decoration: InputDecoration(
                    labelText: 'Salary',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: size.height * .03,
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: size.height * .03),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.lightGreen),
                onPressed: () {
                  var newEmployee = Datum(
                    employeeName: nameController.text,
                    employeeSalary: int.parse(salaryController.text),
                    employeeAge: int.parse(ageController.text),
                  );
                  controller.addEmployee(newEmployee);
                  Get.back();
                },
                child: Text(
                  'ADD EMPLOYEE',
                  style: GlTextStyles.interStyl(
                      size: 20,
                      weight: FontWeight.bold,
                      color: ColorTheme.darkgreen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
