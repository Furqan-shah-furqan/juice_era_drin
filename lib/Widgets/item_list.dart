import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:juice_era_drin/Pages/cart_page.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:juice_era_drin/classes/ites.dart';

// GetX Controller for managing state
class ItemListController extends GetxController {
  var isCompletedList = <bool>[].obs;

  void initializeItems(int length) {
    isCompletedList.assignAll(List.filled(length, false));
  }

  void markAsCompleted(int index) {
    isCompletedList[index] = true;
  }
}

class ItemList extends StatelessWidget {
  final List<Items> items;
  final ItemListController controller =
      Get.put(ItemListController()); // Register controller

  ItemList({super.key, required this.items}) {
    controller.initializeItems(items.length); // Initialize items in controller
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 300.r,
          margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    items[index].image,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(width: 15.r),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index].name,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          10.r.verticalSpace,
                          Text(
                            items[index].description,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${items[index].price}',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "/",
                              style: TextStyle(
                                fontSize: 25.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  items[index].rating,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: Colors.orangeAccent,
                                  size: 20.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.r),
                        SizedBox(
                            width: double.infinity,
                            child: slideActionMethod(index)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget slideActionMethod(int index) {
    final CartController cartController = Get.find<CartController>();

    return Obx(() => SlideAction(
          height: 50.r,
          sliderRotate: false,
          sliderButtonIconPadding: 13.r,
          borderRadius: 12.r,
          elevation: 0,
          innerColor: Colors.orangeAccent,
          sliderButtonIcon: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 20.sp,
          ),
          outerColor: Colors.grey[200],
          textColor: Colors.black,
          enabled: !controller.isCompletedList[index],
          submittedIcon: Icon(
            Icons.check,
            size: 20.sp,
            color: Colors.orangeAccent,
          ),
          onSubmit: () {
            // Use Future.microtask to schedule this for after the build
            Future.microtask(() {
              cartController.addToCart(items[index]); // Add item to cart
              controller.markAsCompleted(index);
              print('Item added to cart: ${items[index].name}');
            });
            return Future.value(null); // Return a completed future
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10.r),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ));
  }
}
