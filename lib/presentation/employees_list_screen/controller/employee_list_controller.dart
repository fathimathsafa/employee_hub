import 'package:employee_managment/repository/api/employee_list/model/employee_list_model.dart';
import 'package:employee_managment/repository/api/employee_list/service/employee_service.dart';
import 'package:get/get.dart';


class EmployeeListController extends GetxController {
  var employees = <Datum>[].obs;
  var isLoading = true.obs;
  final EmployeeListService employeeListService = EmployeeListService();

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  Future<void> fetchEmployees() async {
    try {
      isLoading(true);
      employees.value = await employeeListService.fetchEmployees();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

 Future<void> updateEmployee(Datum employee) async {
    try {
      await employeeListService.updateEmployee(employee);
      fetchEmployees(); 
      Get.snackbar("Success", "Employee updated successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> deleteEmployee(int id) async {
    try {
      await employeeListService.deleteEmployee(id);
      employees.removeWhere((employee) => employee.id == id);
      Get.snackbar("Success", "Employee deleted successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}