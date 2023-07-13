import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/const/dimension.dart';
import 'package:suitmedia_test/reusable/button_default.dart';
import 'package:suitmedia_test/reusable/sized_box_responsive.dart';
import 'package:suitmedia_test/reusable/text_poppins.dart';
import 'package:suitmedia_test/screen/screen_1_page.dart';
import 'package:suitmedia_test/screen/screen_3_page.dart';
import 'package:suitmedia_test/screen/screen_provider.dart';

class Screen2Page extends StatefulWidget {
  String? name;
  Screen2Page({required this.name});

  @override
  State<Screen2Page> createState() => Screen2PageState();
}

class Screen2PageState extends State<Screen2Page> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ScreenProvider(),
        child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Screen1Page())),
                child: Image.asset('assets/image/back.png'),
              ),
              elevation: 0.5,
              backgroundColor: Colors.white,
              title: TextP(
                title: "Second Second",
                font: FontWeight.w600,
                color: Colors.black,
              ),
              centerTitle: true,
            ),
            body: Consumer<ScreenProvider>(builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.all(Dimensions.height20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextP(
                      title: 'Welcome',
                      size: Dimensions.height12,
                      font: FontWeight.w400,
                      color: Color(0xff04021D),
                    ),
                    TextP(
                      title: 'John Doe',
                      size: Dimensions.height18,
                      font: FontWeight.w600,
                      color: Color(0xff04021D),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextP(
                        title: widget.name == ''
                            ? 'Selected User Name'
                            : '${widget.name}',
                        size: Dimensions.height18,
                        font: FontWeight.w600,
                        color: Color(0xff04021D),
                        align: TextAlign.center,
                      ),
                    ),
                    shA(height: Dimensions.height20),
                    Spacer(),
                    ButtonDefault(
                      title: 'Choose a User',
                      color: Color(0xff2B637B),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Screen3Page())),
                    ),
                  ],
                ),
              );
            })));
  }
}
