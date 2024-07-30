import 'package:employee_managment/core/constants/color_constants.dart';
import 'package:employee_managment/core/constants/text_style_constants.dart';
import 'package:employee_managment/presentation/add_employee_Screen/view/add_employee_screen.dart';
import 'package:employee_managment/presentation/bottomnavigation_screen/controller/log_out_controller.dart';
import 'package:employee_managment/presentation/employees_list_screen/view/employee_list_screen.dart';
import 'package:employee_managment/presentation/log_in_screen/view/login_screen.dart';
import 'package:flutter/material.dart';



class TabletBottomNavigationScreen extends StatefulWidget {
  const TabletBottomNavigationScreen({super.key});

  @override
  _TabletBottomNavigationScreenState createState() =>
      _TabletBottomNavigationScreenState();
}

class _TabletBottomNavigationScreenState
    extends State<TabletBottomNavigationScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const EmployeeListScreen(),
   const AddEmployeeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: (){
            LogOutFunctions().logoutuser().then((value)=>
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginScreen())));
          }, icon: Icon(Icons.logout_outlined,color: ColorTheme.darkgreen,))
        ],
        backgroundColor: ColorTheme.lightGreen,
        leading:const Icon(null),
        centerTitle: true,
        title: Text(
          'EMPLOYEE HUB',
          style: GlTextStyles.oswald(
              size: 20, weight: FontWeight.bold, color: ColorTheme.darkgreen),
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorTheme.lightGreen,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: ColorTheme.darkgreen,
            ),
            label: 'EMPLOYEE LISTt',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: ColorTheme.darkgreen,
            ),
            label: 'ADD EMPLOYEE',
          ),
        ],
        selectedLabelStyle:
            GlTextStyles.interStyl(color: ColorTheme.darkgreen, size: 10),
        unselectedLabelStyle:
            GlTextStyles.interStyl(color: ColorTheme.darkgreen, size: 10),
      ),
    );
  }
}
