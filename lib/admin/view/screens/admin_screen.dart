import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'admin_articles_screen.dart';
import 'admin_fix_screen.dart';
import 'admin_orders_screen.dart';
import '../widgets/admin_button.dart';
import '/home/view/widgets/app_title_app_bar.dart';
import 'admin_news_screen.dart';
import 'admin_products_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: const AppTitleAppBar(textColor: Colors.black, title: 'Admin'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              AdminButton(
                title: 'Edit Articles',
                color: Colors.grey.shade600,
                onPressed: () {
                  //Go to all articles screen.
                  Navigator.pushNamed(context, AdminArticlesScreen.route);
                },
              ),
              AdminButton(
                title: 'Edit News',
                color: Colors.grey.shade600,
                onPressed: () {
                  //Go to all news screen.
                  Navigator.pushNamed(context, AdminNewsScreen.route);
                },
              ),
              AdminButton(
                title: 'Edit Products',
                color: Colors.grey.shade600,
                onPressed: () {
                  //Go to all products screen.
                  Navigator.pushNamed(context, AdminProductsScreen.route);
                },
              ),
              AdminButton(
                title: 'Orders',
                color: Colors.red.shade400,
                onPressed: () {
                  //Go to all orders screen.
                  Navigator.pushNamed(context, AdminOrdersScreen.route);
                },
              ),
              AdminButton(
                title: 'Fix request',
                color: Colors.blue.shade400,
                onPressed: () {
                  //Go to fix requests screen.
                  Navigator.pushNamed(context, AdminFixScreen.route);
                },
              ),
            ],
          ),
        ));
  }
}
