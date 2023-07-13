import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../const/dimension.dart';

class ButtonDefault extends StatelessWidget {
  String? title;
  Color? color;
  void Function()? onPressed;
  ButtonDefault({this.title, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: Dimensions.height50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
              fontSize: Dimensions.height14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.height12),
          ),
        ),
      ),
    );
  }
}
