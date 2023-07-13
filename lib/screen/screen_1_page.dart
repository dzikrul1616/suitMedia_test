import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/const/dimension.dart';
import 'package:suitmedia_test/reusable/button_default.dart';
import 'package:suitmedia_test/reusable/sized_box_responsive.dart';
import 'package:suitmedia_test/reusable/text_poppins.dart';
import 'package:suitmedia_test/screen/screen_2_page.dart';
import 'package:suitmedia_test/screen/screen_3_page.dart';
import 'package:suitmedia_test/screen/screen_provider.dart';

import '../reusable/form_field.dart';

class Screen1Page extends StatefulWidget {
  const Screen1Page({super.key});

  @override
  State<Screen1Page> createState() => Screen1PageState();
}

class Screen1PageState extends State<Screen1Page> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ScreenProvider(),
        child: Scaffold(
            body: Consumer<ScreenProvider>(builder: (context, value, child) {
          return Form(
            key: value.key,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Image.asset(
                          'assets/image/background.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimensions.height25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: Dimensions.height120,
                            height: Dimensions.height120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.height100),
                            ),
                            child: Center(
                              child: Image.asset('assets/image/profil.png'),
                            ),
                          ),
                          shA(height: Dimensions.height80),
                          FormFilled(
                            label: 'Name',
                            controller: value.nameController,
                            validator: (e) {
                              if (e!.isEmpty) {
                                return "Please Insert Name";
                              }
                            },
                          ),
                          shA(height: Dimensions.height20),
                          FormFilled(
                            label: 'Palindrome',
                            controller: value.sentenceController,
                            validator: (e) {
                              if (e!.isEmpty) {
                                return "Please Insert Palindrome";
                              }
                            },
                          ),
                          shA(height: Dimensions.height50),
                          ButtonDefault(
                            title: 'CHECK',
                            color: Color(0xff2B637B),
                            onPressed: () => value.check(context),
                          ),
                          shA(height: Dimensions.height20),
                          ButtonDefault(
                            title: 'NEXT',
                            color: Color(0xff2B637B),
                            onPressed: () => value.checkNext(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        })));
  }
}
