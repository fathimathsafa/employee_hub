import 'package:employee_managment/core/constants/color_constants.dart';
import 'package:employee_managment/core/constants/text_style_constants.dart';
import 'package:employee_managment/presentation/log_in_screen/tablet_login.dart';
import 'package:employee_managment/presentation/log_in_screen/view/login_screen.dart';
import 'package:employee_managment/presentation/sign_up_screen/controller/signup_controller.dart';
import 'package:employee_managment/presentation/sign_up_screen/widgets/signup_entry_field.dart';
import 'package:flutter/material.dart';

class SignUpTablet extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();
  SignUpTablet({
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
                  height: size.width * .2,
                  width: size.width * .2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/splash_screen/splash.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: size.width * .4,
                  width: size.width * .35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "SIGN UP",
                          style: GlTextStyles.oswald(size: 40),
                        ),
                      ),
                      Expanded(
                        child: SignUpEntryField(
                          tittle: 'Username',
                          fontsize: size.width * .015,
                        ),
                      ),
                      Expanded(
                        child: SignUpEntryField(
                          controller: email,
                          tittle: 'Email',
                          fontsize: size.width * .015,
                        ),
                      ),
                      Expanded(
                          child: SignUpEntryField(
                        controller: pass,
                        tittle: "Password",
                        fontsize: size.width * .015,
                      )),
                      SizedBox(
                        height: size.height * .01,
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(response)));
                            }
                          });
                        },
                        height: size.width * .05,
                        color: ColorTheme.lightGreen,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "SIGN UP",
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
