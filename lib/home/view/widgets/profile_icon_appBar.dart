import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../profile/view/widgets/profile_image.dart';

class ProfileIconAppBar extends StatelessWidget {
  const ProfileIconAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child:
                ProfileImage(child: Container(), wildRadius: 15, radius: 14)),
        Positioned(
          bottom: -1.h,
          right: 3.w,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            radius: 6.h,
            child: CircleAvatar(
              radius: 5.h,
              backgroundColor: Colors.green,
            ),
          ),
        )
      ],
    );
  }
}
