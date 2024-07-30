import 'package:employee_managment/core/constants/color_constants.dart';
import 'package:employee_managment/core/constants/text_style_constants.dart';
import 'package:employee_managment/presentation/bottomnavigation_screen/view/bottom_navigation_screen.dart';
import 'package:employee_managment/presentation/log_in_screen/controller/login_controller.dart';
import 'package:employee_managment/presentation/sign_up_screen/view/sign_up_screen.dart';
import 'package:employee_managment/presentation/sign_up_screen/widgets/signup_entry_field.dart';
import 'package:flutter/material.dart';

class LoginMobile extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();
  LoginMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.white,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 50.0, right: 50, top: 20, bottom: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/splash_screen/splash.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Center(
                    child: Text("LOGIN", style: GlTextStyles.oswald(size: 30))),
                const SizedBox(
                  height: 30,
                ),
                SignUpEntryField(
                  controller: email,
                  tittle: 'Email',
                  fontsize: 14,
                ),
                const SizedBox(
                  height: 14,
                ),
                SignUpEntryField(
                  controller: pass,
                  tittle: 'Password',
                  fontsize: 14,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                   
                    LoginFunctions()
                        .loginUser(
                            emaill: email.text.trim(), pwd: pass.text.trim())
                        .then((response) {
                      if (response == null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BottomNavigationScreen()));
                      }
                    });
                  },
                  height: 50,
                  color: ColorTheme.lightGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: GlTextStyles.robotoStyl(
                          size: 16,
                          weight: FontWeight.bold,
                          color: ColorTheme.darkgreen),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: Text(
                        "Don't have an account? SignUp",
                        style: TextStyle(color: ColorTheme.darkgreen),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
