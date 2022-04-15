import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'splash_screen.dart';
import 'welcome_screen.dart';
import 'home/view/screens/home_screen.dart';
import 'login/view/screens/login_screen.dart';
import 'admin/view/screens/admin_articles_screen.dart';
import 'admin/view/screens/admin_fix_screen.dart';
import 'admin/view/screens/admin_news_screen.dart';
import 'admin/view/screens/admin_orders_screen.dart';
import 'admin/view/screens/admin_products_screen.dart';
import 'fix/bloc/fix_bloc.dart';
import 'fix/data/repository/fix_repository.dart';
import 'news/bloc/articles_bloc.dart';
import 'news/bloc/news_bloc.dart';
import 'news/data/repository/articles_repository.dart';
import 'news/data/repository/news_repository.dart';
import 'profile/bloc/profile_image_bloc.dart';
import 'profile/bloc/user_bloc.dart';
import 'profile/data/repository/image_repository.dart';
import 'profile/data/repository/profile_repository.dart';
import 'profile/view/screens/my_orders_screen.dart';
import 'store/bloc/cart_bloc.dart';
import 'store/bloc/order_bloc.dart';
import 'store/bloc/products_bloc.dart';
import '/store/bloc/payment_bloc.dart';
import 'store/view/screens/cart_screen.dart';
import '/store/view/screens/payment_screen.dart';
import 'store/data/repository/cart_repository.dart';
import 'store/data/repository/order_repository.dart';
import 'store/data/repository/products_repository.dart';
import '/store/data/repository/payment_repository.dart';
import '/store/view/screens/order_information_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NewsBloc(
              NewsRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => ArticlesBloc(
              ArticlesRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => ProductsBloc(
              ProductsRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => CartBloc(
              CartRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              ProfileRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => ProfileImageBloc(
              ImageRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => OrderBloc(
              OrderRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => FixBloc(
              FixRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => PaymentBloc(
              PaymentRepository(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Prosthetic',
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.route,
          routes: {
            SplashScreen.route: (context) => const SplashScreen(),
            WelcomeScreen.route: (context) => const WelcomeScreen(),
            LogInScreen.route: (context) => const LogInScreen(),
            HomeScreen.route: (context) => const HomeScreen(),
            CartScreen.route: (context) => const CartScreen(),
            AdminArticlesScreen.route: (context) => const AdminArticlesScreen(),
            AdminNewsScreen.route: (context) => const AdminNewsScreen(),
            AdminProductsScreen.route: (context) => const AdminProductsScreen(),
            AdminOrdersScreen.route: (context) => const AdminOrdersScreen(),
            AdminFixScreen.route: (context) => const AdminFixScreen(),
            MyOrdersScreen.route: (context) => const MyOrdersScreen(),
            PaymentScreen.route: (context) => const PaymentScreen(),
            OrderInformationScreen.route: (context) => OrderInformationScreen(),
          },
        ),
      ),
    );
  }
}
