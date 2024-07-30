import 'package:employee_managment/repository/api/employee_list/model/employee_list_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeListService {
  final String apiUrl = "https://dummy.restapiexample.com/api/v1";

  Future<List<Datum>> fetchEmployees() async {
    final response = await http.get(Uri.parse('$apiUrl/employees'));
    print('Status Code: ${response.statusCode}'); 
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('API Call Success: Fetch Employees'); 
      return List<Datum>.from(data['data'].map((x) => Datum.fromJson(x)));
    } else {
      throw Exception("Failed to load employees");
    }
  }



  Future<void> updateEmployee(Datum employee) async {
    final response = await http.put(
      Uri.parse('$apiUrl/update/${employee.id}'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": employee.employeeName,
        "salary": employee.employeeSalary,
        "age": employee.employeeAge,
      }),
    );

    print('Status Code: ${response.statusCode}'); 
    if (response.statusCode == 200) {
      print('API Call Success: Update Employee'); 
    } else {
      throw Exception("Failed to update employee");
    }
  }

  Future<void> deleteEmployee(int id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/delete/$id'),
    );

    print('Status Code: ${response.statusCode}'); 
    if (response.statusCode == 200) {
      print('API Call Success: Delete Employee'); 
    } else {
      throw Exception("Failed to delete employee");
    }
  }
}
