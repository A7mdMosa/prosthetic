import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../admin/view/screens/admin_screen.dart';
import '../../../fix/view/screens/fix_screen.dart';
import '../../data/location.dart';
import '../../../news/view/screens/news_screen.dart';
import '../../../store/view/screens/store_screen.dart';
import '../../../profile/view/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home_screen';
  //TODO:the admin uid should be here
  static const String adminUid = 'xxxxxxx';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Location location = Location();
  int _selectedIndex = 0;
  final _firebaseAuth = FirebaseAuth.instance;

  final List<Widget> _pages = [
    const NewsScreen(),
    const StoreScreen(),
    const FixScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0)).then((value) async {
      //Get the user location.
      await location.getLocation();
    });
  }

  bool isAdmin() {
    if (_firebaseAuth.currentUser!.uid == HomeScreen.adminUid) {
      //Add the admin screen.
      _pages.add(const AdminScreen());
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
        unselectedIconTheme:
            IconThemeData(color: Colors.black.withOpacity(0.3), size: 30.sp),
        selectedIconTheme: IconThemeData(color: Colors.black, size: 30.sp),
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.store_rounded), label: 'Store'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.build_rounded), label: 'Fix'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile'),
          if (isAdmin())
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'settings'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
      ),
    );
  }
}
