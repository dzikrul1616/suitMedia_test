import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class shA extends StatelessWidget {
  double? height;
  shA({required this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class swA extends StatelessWidget {
  double? height;
  swA({required this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: height,
    );
  }
}
