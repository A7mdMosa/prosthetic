import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_orders_screen.dart';
import '../../bloc/user_bloc.dart';
import 'profile_editing_screen.dart';
import '../../../welcome_screen.dart';
import '../widgets/profile_image.dart';
import '../../data/models/user_model.dart';
import '../../bloc/profile_image_bloc.dart';
import '../widgets/profile_widget_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel userModel = UserModel(
      id: '',
      firstName: '',
      lastName: '',
      email: '',
      age: 0,
      image: '',
      job: '',
      prostheticLimb: '',
      location: '');
  @override
  void initState() {
    super.initState();
    //Loading user information.
    BlocProvider.of<UserBloc>(context).add(UserLoadingEvent());
    //Loading profile image.
    BlocProvider.of<ProfileImageBloc>(context).add(ProfileImageGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15.h),
            child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              if (state is UserLoadedState) {
                userModel = state.userModel;
              }
              return Column(
                children: [
                  Stack(
                    children: [
                      ProfileImage(
                        wildRadius: 83,
                        radius: 80,
                        child: Container(),
                      ),
                      Positioned(
                        bottom: 7.h,
                        right: 7.w,
                        child: SvgPicture.asset(
                          'assets/images/profile/icon.svg',
                          height: 30.h,
                          width: 30.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text('${userModel.firstName} ${userModel.lastName}',
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF272727),
                      )),
                  Text(
                    userModel.job,
                    style: TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFFA1A1A1),
                    ),
                  ),
                ],
              );
            }),
          ),
          SizedBox(height: 16.h),
          ProfileWidgetItem(
            image: 'assets/images/profile/profile.svg',
            title: 'Edit Profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => ProfileEditingScreen(
                        userModel: userModel,
                      )),
                ),
              );
            },
          ),
          ProfileWidgetItem(
            image: 'assets/images/profile/star.svg',
            title: 'My Orders',
            onTap: () {
              Navigator.pushNamed(context, MyOrdersScreen.route);
            },
          ),
          Divider(
            endIndent: 32.w,
            indent: 32.w,
          ),
          ProfileWidgetItem(
            image: 'assets/images/profile/logout.svg',
            title: 'Log Out',
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text(
                          'ARE YOU SURE ?',
                          style: TextStyle(
                            fontFamily: 'Signika',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.orange.shade900,
                          ),
                        ),
                        content: Text(
                          'You want to logout ?',
                          style: TextStyle(
                            fontFamily: 'Signika',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        actions: [
                          TextButton(
                              child: Text(
                                'YES',
                                style: TextStyle(
                                  fontFamily: 'Signika',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.orange.shade900,
                                ),
                              ),
                              onPressed: () {
                                BlocProvider.of<UserBloc>(context)
                                    .add(UserLogoutEvent());
                                Navigator.pushReplacementNamed(
                                    context, WelcomeScreen.route);
                              }),
                          TextButton(
                            child: Text(
                              'NO',
                              style: TextStyle(
                                fontFamily: 'Signika',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ));
            },
          ),
        ],
      ),
    );
  }
}
