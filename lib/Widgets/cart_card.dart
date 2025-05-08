import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CartCard extends StatelessWidget {
  final dynamic cardImage;
  final dynamic cardPrice;
  final dynamic cardFavIcon;
  final dynamic cardFavIconColor;
  final dynamic cardFavIcontapped;
  final dynamic cardDeleteIcon;
  final dynamic cardDeleteIcontapped;
  final dynamic cardRating;
  final dynamic cardRatingIcon;
  final dynamic cardText;
  final dynamic addToCartTapped;

  // Quantity controls
  final dynamic quantityIncrement;
  final dynamic quantity;
  final dynamic quantityDecrement;

  const CartCard({
    super.key,
    this.cardImage,
    this.cardPrice,
    this.cardFavIcon,
    this.cardFavIconColor,
    this.cardRating,
    this.cardRatingIcon,
    this.cardText,
    this.cardFavIcontapped,
    this.addToCartTapped,
    this.cardDeleteIcon,
    this.cardDeleteIcontapped,
    this.quantityIncrement,
    this.quantity,
    this.quantityDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.all(20.r),
                  height: 250.r,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.asset(
                          cardImage,
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.r),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: cardFavIcontapped,
                                  icon: Icon(
                                    cardFavIcon,
                                    size: 25.sp,
                                  ),
                                  color: cardFavIconColor,
                                ),
                                IconButton(
                                  onPressed: cardDeleteIcontapped,
                                  icon: Icon(
                                    color: Colors.red[400],
                                    cardDeleteIcon,
                                    size: 25.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(7.r),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          31, 131, 131, 131),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          '\$ ',
                                          style: TextStyle(
                                            fontSize: 22.sp,
                                            color: Colors.orangeAccent,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          cardPrice,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(7.r),
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(31, 92, 92, 92),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          cardRating,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          cardRatingIcon,
                                          color: Colors.orangeAccent,
                                          size: 30.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: GestureDetector(
                                    onTap: addToCartTapped,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            31, 131, 131, 131),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      padding: EdgeInsets.all(7.r),
                                      child: Text(
                                        cardText,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
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
              // Quantity controls
              Expanded(
                child: Center(
                  child: Container(
                    height: 250.r,
                    width: 50.r,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(31, 92, 92, 92),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: quantityIncrement,
                          icon: Icon(
                            Icons.add,
                            size: 20.sp,
                          ),
                        ),
                        Text(
                          quantity,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: quantityDecrement,
                          icon: Icon(
                            Icons.remove,
                            size: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
