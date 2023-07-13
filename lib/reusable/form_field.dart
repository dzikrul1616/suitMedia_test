import 'package:flutter/material.dart';

import '../const/dimension.dart';

class FormFilled extends StatelessWidget {
  String? label;
  bool? obsecuretext;
  TextEditingController? controller;
  String? Function(String?)? validator;
  Function(String)? onChange;
  Function()? ontap;
  TextInputType textInput;
  int? maxLines;
  int? minLines;
  String? initialValue;
  bool? enabled;
  Color? color;
  FontWeight? fontWeight;
  FormFilled({
    this.label,
    this.obsecuretext = false,
    this.controller,
    this.validator,
    this.onChange,
    this.ontap,
    this.textInput = TextInputType.text,
    this.maxLines,
    this.minLines,
    this.initialValue,
    this.enabled,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height15),
          color: Colors.white),
      child: Center(
        child: TextFormField(
          obscureText: obsecuretext!,
          enabled: enabled,
          minLines: minLines,
          maxLines: maxLines,
          validator: validator,
          initialValue: initialValue,
          controller: controller,
          onChanged: onChange,
          keyboardType: textInput,
          onTap: ontap,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: fontWeight,
              color: Colors.black,
              fontSize: Dimensions.height14),
          decoration: InputDecoration(
              hintText: label,
              contentPadding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                  left: Dimensions.height20,
                  right: Dimensions.height20),
              hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(100, 104, 103, 119),
                  fontSize: Dimensions.height14),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: color),
        ),
      ),
    );
  }
}
