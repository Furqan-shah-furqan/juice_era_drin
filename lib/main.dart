import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juice_era_drin/Pages/cart_page.dart';
import 'package:juice_era_drin/Home/home.dart';
import 'package:juice_era_drin/Home/bottom_nav.dart';
import 'package:juice_era_drin/Pages/settings_page.dart';

void main() {
  Get.put(CartController());
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is ready
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: ()=>BottomNav()),
            GetPage(name:'/Home', page: ()=> Home()),
            GetPage(name: '/CartPage', page: () => CartPage(),
            transition: Transition.fadeIn,),
            GetPage(name: '/SettingsPage', page: () => SettingsPage()),
          ]
        );
      },
      child: BottomNav(),
    );
  }
}
