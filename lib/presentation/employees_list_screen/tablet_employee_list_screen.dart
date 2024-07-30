import 'package:employee_managment/core/constants/color_constants.dart';
import 'package:employee_managment/core/constants/text_style_constants.dart';
import 'package:employee_managment/presentation/details_screen/view/details_screen.dart';
import 'package:employee_managment/presentation/employees_list_screen/controller/employee_list_controller.dart';
import 'package:employee_managment/repository/api/employee_list/model/employee_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabletEmployeeListScreen extends StatelessWidget {
  final EmployeeListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          itemCount: controller.employees.length,
          itemBuilder: (context, index) {
            var employee = controller.employees[index];
            return ListTile(
              title: Text(
                employee.employeeName ?? '',
                style: GlTextStyles.interStyl(
                    color: ColorTheme.darkgreen,
                    size: 20,
                    weight: FontWeight.bold),
              ),
              subtitle: Text(
                'Salary: ${employee.employeeSalary}, Age: ${employee.employeeAge}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: ColorTheme.darkgreen,
                    ),
                    onPressed: () {
                      showEditDialog(context, employee);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: ColorTheme.darkgreen,
                    ),
                    onPressed: () {
                      controller.deleteEmployee(employee.id!);
                    },
                  ),
                ],
              ),
              onTap: () {
                Get.to(() => DetailsScreen(employee: employee));
              },
            );
          },
        );
      }
    });
  }

  void showEditDialog(BuildContext context, Datum employee) {
    final nameController = TextEditingController(text: employee.employeeName);
    final salaryController =
        TextEditingController(text: employee.employeeSalary.toString());
    final ageController =
        TextEditingController(text: employee.employeeAge.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'EDIT EMPLOYEE',
            style: GlTextStyles.interStyl(
                size: 20, weight: FontWeight.bold, color: ColorTheme.darkgreen),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(),
              ),
              TextField(
                controller: salaryController,
                decoration: InputDecoration(),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                employee.employeeName = nameController.text;
                employee.employeeSalary = int.parse(salaryController.text);
                employee.employeeAge = int.parse(ageController.text);
                controller.updateEmployee(employee);
                Get.back();
              },
              child: Text(
                'EDIT',
                style: GlTextStyles.interStyl(
                    size: 15,
                    weight: FontWeight.bold,
                    color: ColorTheme.darkgreen),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('CANCEL',
                  style: GlTextStyles.interStyl(
                      size: 15,
                      weight: FontWeight.bold,
                      color: ColorTheme.darkgreen)),
            ),
          ],
        );
      },
    );
  }
}
