import 'package:employee_managment/core/constants/color_constants.dart';
import 'package:employee_managment/core/constants/text_style_constants.dart';
import 'package:employee_managment/presentation/log_in_screen/mobile_login.dart';
import 'package:employee_managment/presentation/log_in_screen/view/login_screen.dart';
import 'package:employee_managment/presentation/sign_up_screen/controller/signup_controller.dart';
import 'package:employee_managment/presentation/sign_up_screen/widgets/signup_entry_field.dart';
import 'package:flutter/material.dart';

class SignupMobile extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();
  SignupMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.white,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 50.0, right: 50, top: 50, bottom: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/splash_screen/splash.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Center(
                  child: Text("SIGNUP", style: GlTextStyles.oswald(size: 30)),
                ),
                const SizedBox(
                  height: 30,
                ),
                SignUpEntryField(
                  tittle: 'Username',
                  fontsize: 14,
                ),
                const SizedBox(
                  height: 14,
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
                  height: 20,
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
                  height: 50,
                  color: ColorTheme.lightGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      "SIGNUP",
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
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Alraedy have an account? Login",
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
