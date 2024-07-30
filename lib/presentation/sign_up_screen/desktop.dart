import 'package:employee_managment/core/constants/color_constants.dart';
import 'package:employee_managment/core/constants/text_style_constants.dart';
import 'package:employee_managment/presentation/log_in_screen/desktop_login.dart';
import 'package:employee_managment/presentation/log_in_screen/view/login_screen.dart';
import 'package:employee_managment/presentation/sign_up_screen/controller/signup_controller.dart';
import 'package:employee_managment/presentation/sign_up_screen/widgets/signup_entry_field.dart';
import 'package:flutter/material.dart';

class SignUpDesktop extends StatelessWidget {
   final email = TextEditingController();
  final pass = TextEditingController();
   SignUpDesktop({super.key});

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
                  height: size.width * .35,
                  width: size.width * .35,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/splash_screen/splash.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: size.width * .3,
                  width: size.width * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SIGN UP",
                        style: GlTextStyles.oswald(
                            size: 30,
                            color: ColorTheme.lightGreen,
                            weight: FontWeight.bold),
                      ),
                      SignUpEntryField(
                        tittle: 'Username',
                        fontsize: size.width * .012,
                      ),
                      SignUpEntryField(
                                          controller: email,

                        tittle: 'Email',
                        fontsize: size.width * .012,
                      ),
                      SignUpEntryField(
                                          controller: pass,

                        tittle: 'Password',
                        fontsize: size.width * .012,
                      ),
                      MaterialButton(
                        onPressed: () {
                         String emaill = email.text.trim();
                    String password = pass.text.trim();
                    SignUpFunctions()
                        .registerUser(email: emaill, pwd: password)
                        .then((response) {
                      if (response == null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(response)));
                      }
                    });
                        },
                        height: size.width * .035,
                        color: ColorTheme.lightGreen,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "SIGNUP",
                            style: GlTextStyles.robotoStyl(
                                size: size.width * .012,
                                weight: FontWeight.w600,
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
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              "Alraedy have an account? Login",
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
