import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class TextP extends StatelessWidget {
  String? title;
  double? size;
  Color? color;
  FontWeight? font;
  TextAlign? align;
  TextOverflow? over;
  TextP({this.title, this.size, this.color, this.font, this.align, this.over});

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(
          fontSize: size,
          fontWeight: font!,
          fontFamily: 'Poppins',
          overflow: over,
          color: color),
      textAlign: align,
    );
  }
}
