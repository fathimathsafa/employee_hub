import 'package:employee_managment/presentation/employees_list_screen/controller/employee_list_controller.dart';
import 'package:employee_managment/presentation/log_in_screen/view/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  Get.put(
    EmployeeListController(),
  );
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey:"AIzaSyBanNDwtEZcMmWC6J57hXyh37BzOCFGL_A" , 
    appId:  "1:982486658790:android:003ea1614970a1eda1d527", 
    messagingSenderId: "",
     projectId: "employeehub-f0999")
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
