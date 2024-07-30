import 'package:employee_managment/repository/api/add_employees_screen/service/add_employee_screen_service.dart';
import 'package:employee_managment/repository/api/employee_list/model/employee_list_model.dart';
import 'package:get/get.dart';


class AddEmployeeController extends GetxController {
  var employees = <Datum>[].obs;
  var isLoading = true.obs;
  final AddEmployeeService addEmployeeService = AddEmployeeService();

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  Future<void> fetchEmployees() async {
    try {
      isLoading(true);
      employees.value = await addEmployeeService.fetchEmployees();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> addEmployee(Datum employee) async {
    try {
      await addEmployeeService.addEmployee(employee);
      fetchEmployees(); 
      Get.snackbar("Success", "Employee added successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}




