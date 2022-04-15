import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/product.dart';
import '../screens/product_details_screen.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ProductDetailsScreen(
                  product: product,
                )),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 180.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.h),
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 5.h, bottom: 1.h, right: 8.w, left: 8.w),
              child: Text(
                product.title,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                '\$${product.price.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.orange.shade900,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
