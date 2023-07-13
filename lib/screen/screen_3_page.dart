import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/const/dimension.dart';
import 'package:suitmedia_test/reusable/sized_box_responsive.dart';
import 'package:suitmedia_test/reusable/text_poppins.dart';
import 'package:suitmedia_test/screen/screen_1_page.dart';
import 'package:suitmedia_test/screen/screen_2_page.dart';
import 'package:suitmedia_test/screen/screen_provider.dart';

class Screen3Page extends StatefulWidget {
  Screen3Page({super.key});

  @override
  State<Screen3Page> createState() => Screen3PageState();
}

class Screen3PageState extends State<Screen3Page> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ScreenProvider(),
        child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset('assets/image/back.png'),
              ),
              elevation: 0.5,
              backgroundColor: Colors.white,
              title: TextP(
                title: "Third Screen",
                font: FontWeight.w600,
                color: Colors.black,
              ),
              centerTitle: true,
            ),
            body: Consumer<ScreenProvider>(builder: (context, value, child) {
              return RefreshIndicator(
                onRefresh: value.refreshData,
                child: ListView(
                  children: [
                    shA(height: Dimensions.height10),
                    ListView.builder(
                      itemCount: value.data.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final data = value.data[index];
                        return Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.height20),
                            child: Column(
                              children: [
                                ListTile(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Screen2Page(
                                                name:
                                                    "${data.firstName} ${data.lastName}"))),
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.grey[300],
                                      backgroundImage: NetworkImage(
                                        '${data.avatar!}',
                                      ),
                                    ),
                                    title: TextP(
                                      title:
                                          "${data.firstName} ${data.lastName}",
                                      font: FontWeight.w600,
                                      color: Color(0xff04021D),
                                      size: Dimensions.height15,
                                    ),
                                    subtitle: TextP(
                                      title: "${data.email!.toUpperCase()}",
                                      font: FontWeight.w400,
                                      color: Color(0xff686777),
                                      size: Dimensions.height10,
                                    )),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey[200],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            })));
  }
}
