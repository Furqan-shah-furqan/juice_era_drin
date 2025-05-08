import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:juice_era_drin/Pages/cart_page.dart';
import 'package:juice_era_drin/Home/home.dart';
import 'package:juice_era_drin/Pages/settings_page.dart';

// Controller for Bottom Navigation
class BottomNavController extends GetxController {
  var currentIndex = 0.obs; // Observable variable

  void changePage(int index) {
    currentIndex.value = index;
  }
}

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> _pages = [
    const Home(),
    const CartPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Row(
            children: [
              Expanded(
                child: GNav(
                  selectedIndex: controller.currentIndex.value,
                  onTabChange: (index) {
                    controller.changePage(index); // Update the current index
                  },                  
                  tabBorderRadius: 12.r,
                  tabBackgroundColor: Colors.orangeAccent,
                  color: Colors.grey[600],
                  activeColor: Colors.white,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                  curve: Curves.linear,
                  padding: EdgeInsets.symmetric(horizontal: 25.r, vertical: 10.r),
                  tabMargin: EdgeInsets.all(10.r),
                  iconSize: 25.sp,
                  tabs: const [
                    GButton(icon: Icons.home, text: 'Home'),
                    GButton(icon: Icons.shopping_cart_outlined, text: 'Cart'),
                    GButton(icon: Icons.settings, text: 'Setting'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}