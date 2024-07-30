import 'package:employee_managment/core/constants/color_constants.dart';
import 'package:employee_managment/core/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

class SignUpEntryField extends StatelessWidget {
  const SignUpEntryField({
    super.key,
    required this.tittle,
    this.controller,
    this.validator,
    required this.fontsize,
  });
  final String tittle;
   final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
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
          validator: validator,

          controller: controller,
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
