import 'package:employee_managment/core/constants/color_constants.dart';
import 'package:employee_managment/core/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

class LoginEntryField extends StatelessWidget {
  const LoginEntryField({
    super.key,
    required this.tittle,
   
    required this.fontsize,
  });
  final String tittle;
 
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle,
          style:
              GlTextStyles.robotoStyl(size: fontsize, weight: FontWeight.w400),
        ),
        TextFormField(
         
          decoration: InputDecoration(
            fillColor: ColorTheme.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: .5, color: ColorTheme.darkgreen.withOpacity(.5)),
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
