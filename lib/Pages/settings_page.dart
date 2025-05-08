import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juice_era_drin/Home/bottom_nav.dart';

// ignore: must_be_immutable
class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  List<Map<String, dynamic>> items = [
    {'icon': Icons.settings, 'title': 'General'},
    {'icon': Icons.switch_account, 'title': 'Switch Account'},
    {'icon': Icons.notifications, 'title': 'Notifications'},
    {'icon': Icons.payment, 'title': 'Payment'},
    {'icon': Icons.help_outline, 'title': 'Help'},
    {'icon': Icons.live_help, 'title': 'About'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(30.r))),
          toolbarHeight: 120.r,
          backgroundColor: Colors.orangeAccent,
          iconTheme: IconThemeData(color: Colors.white, size: 25.sp),
          leading: IconButton(
            onPressed: (){
               Get.offAllNamed('/CartPage');
            // Access controller after navigation is complete
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.find<BottomNavController>().changePage(0);
            });
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 10.r),
            child: Text(
              'Settings',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          )),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20.r),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                    child: ListTile(
                      minTileHeight: 60.r,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.r),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      tileColor: Colors.grey[100],
                      title: Text(
                        items[index]['title'].toString(),
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Icon(
                        items[index]['icon'],
                        color: Colors.grey[600],
                        size: 25.sp,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
