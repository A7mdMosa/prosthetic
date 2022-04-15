import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/product.dart';
import '../widgets/add_to_cart_button.dart';
import '../widgets/cart_icon_app_bar.dart';
import '../../../home/view/widgets/profile_icon_appBar.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String route = '/product_details_screen';
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 5.h, right: 5.w, left: 5.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              children: [
                const BackButton(
                  color: Colors.black,
                ),
                SizedBox(
                  width: 200.w,
                  child: Text(
                    'Product Details',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                const CartIconAppBar(),
                SizedBox(
                  width: 20.w,
                ),
                const ProfileIconAppBar(),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 350.h,
                          width: 320.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.h),
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Text(
                            product.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Signika',
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.orange.shade900),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: Text(
                            product.description1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Signika',
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: Text(
                            product.description2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Signika',
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: Text(
                            product.description3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Signika',
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: Text(
                            product.description4,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Signika',
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: Text(
                            product.description5,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Signika',
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    right: 15.w,
                    left: 15.w,
                    //Add to cart.
                    child: AddToCartButton(product: product),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
