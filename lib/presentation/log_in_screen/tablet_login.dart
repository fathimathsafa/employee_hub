import 'package:employee_managment/core/constants/color_constants.dart';
import 'package:employee_managment/core/constants/text_style_constants.dart';
import 'package:employee_managment/presentation/bottomnavigation_screen/tablet_bottom_naviggation.dart';
import 'package:employee_managment/presentation/bottomnavigation_screen/view/bottom_navigation_screen.dart';
import 'package:employee_managment/presentation/log_in_screen/controller/login_controller.dart';
import 'package:employee_managment/presentation/sign_up_screen/tablet.dart';
import 'package:employee_managment/presentation/sign_up_screen/view/sign_up_screen.dart';
import 'package:employee_managment/presentation/sign_up_screen/widgets/signup_entry_field.dart';
import 'package:flutter/material.dart';

class LoginTablet extends StatelessWidget {
   final email = TextEditingController();
  final pass = TextEditingController();
   LoginTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorTheme.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.width * .3,
                  width: size.width * .3,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/splash_screen/splash.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: size.width * .4,
                  width: size.width * .35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "LOGIN",
                        style: GlTextStyles.oswald(size: 40),
                      ),
                      SignUpEntryField(
                        tittle: 'Email',
                                          controller: email,

                        fontsize: size.width * .013,
                      ),
                      SignUpEntryField(
                        tittle: "Password",
                                          controller: pass,

                        fontsize: size.width * .013,
                      ),
                      MaterialButton(
                        onPressed: () {
                           LoginFunctions()
                        .loginUser(
                            emaill: email.text.trim(), pwd: pass.text.trim())
                        .then((response) {
                      if (response == null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BottomNavigationScreen()));
                      }
                    });
                        },
                        height: size.width * .05,
                        color: ColorTheme.lightGreen,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: GlTextStyles.robotoStyl(
                                size: size.width * .013,
                                weight: FontWeight.bold,
                                color: ColorTheme.darkgreen),
                          ),
                        ),
                      ),
                       Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "Don't have an account? SignUp",
                        style: TextStyle(color: ColorTheme.darkgreen),
                      )),
                )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
