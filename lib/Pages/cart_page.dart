import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juice_era_drin/Home/bottom_nav.dart';
import 'package:juice_era_drin/Widgets/cart_card.dart';
import 'package:juice_era_drin/classes/ites.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Items>[].obs;
  var itemQuantities = <Items, int>{}.obs;
  var itemTotalPrices = <Items, double>{}.obs;

  // Add to cart
  void addToCart(Items item) {
    if (!cartItems.contains(item)) {
      cartItems.add(item);
      itemQuantities[item] = 1; // Default quantity = 1
      itemTotalPrices[item] = item.price;
    } else {
      itemQuantities[item] = (itemQuantities[item] ?? 0) + 1;
      itemTotalPrices[item] = (itemQuantities[item] ?? 0) * item.price;
    }
  }

  // Remove from cart
  void removeFromCart(Items item) {
    if (cartItems.contains(item)) {
      cartItems.remove(item);
      itemQuantities.remove(item);
      itemTotalPrices.remove(item);
    }
  }

  // Increment quantity
  void incrementQuantity(Items item) {
    if (itemQuantities.containsKey(item)) {
      itemQuantities[item] = (itemQuantities[item] ?? 0) + 1;
      itemTotalPrices[item] = (itemQuantities[item] ?? 0) * item.price;
      update(); // Notify listeners
    }
  }

  // Decrement quantity
  void decrementQuantity(Items item) {
    if (itemQuantities.containsKey(item) && itemQuantities[item]! > 1) {
      itemQuantities[item] = (itemQuantities[item] ?? 0) - 1;
      itemTotalPrices[item] = (itemQuantities[item] ?? 0) * item.price;
      update(); // Notify listeners
    }
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController cartController = Get.find<CartController>();

  // Bottom Sheet Start -------------------------------------------------------
  Future openBottomSheet(int index) {
    return showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.3),
      context: context,
      builder: (context) {
        return Container(
          margin: EdgeInsets.only(top: 10.r),
          height: 500.r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
              color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Prevents shrinking
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  height: 300.r,
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            itemsList[index].image,
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.r),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(itemsList[index].name,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis)),
                                  10.r.verticalSpace,
                                  Text(itemsList[index].description,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold))
                                ]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$ ${itemsList[index].price}',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold)),
                                    Text("/",
                                        style: TextStyle(fontSize: 25.sp)),
                                    Row(
                                      children: [
                                        Text(itemsList[index].rating,
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold)),
                                        Icon(Icons.star_rate_rounded,
                                            color: Colors.orangeAccent,
                                            size: 20.sp),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 80.r,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                child: MaterialButton(
                  color: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                  onPressed: () {},
                  child: Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  // Bottom Sheet End -------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.offAllNamed('/home');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.find<BottomNavController>().changePage(0);
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 10.r, bottom: 20.r, left: 20.r, right: 20.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Juice',
                            style: TextStyle(
                                fontSize: 35.sp, fontWeight: FontWeight.bold)),
                        Text('EraDrin',
                            style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey))
                      ]),
                  Image.asset('assets/images/drawer.png',
                      height: 40.r, width: 40.r),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartController.cartItems[index];
                        return CartCard(
                          cardImage: item.image,
                          cardPrice: (cartController.itemTotalPrices[item] ??
                                  item.price)
                              .toString(),
                          cardFavIcon: Icons.favorite,
                          cardFavIconColor: Colors.red,
                          cardFavIcontapped: () {
                            item.isFavorite.toggle();
                          },
                          cardDeleteIcon: Icons.delete,
                          cardDeleteIcontapped: () {
                            cartController.removeFromCart(item);
                          },
                          cardText: 'Buy Now',
                          addToCartTapped: () {
                            openBottomSheet(index);
                          },
                          cardRatingIcon: Icons.star_rate_rounded,
                          cardRating: item.rating,
                          quantity:
                              cartController.itemQuantities[item].toString(),
                          quantityIncrement: () {
                            cartController.incrementQuantity(item);
                          },
                          quantityDecrement: () {
                            cartController.decrementQuantity(item);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
