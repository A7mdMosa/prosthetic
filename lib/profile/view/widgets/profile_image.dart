import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/profile_image_bloc.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required this.child,
    required this.wildRadius,
    required this.radius,
  }) : super(key: key);

  final Widget child;
  final int wildRadius;
  final int radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: wildRadius.h,
      backgroundColor: const Color(0xffFB9482),
      //Load profile image.
      child: BlocBuilder<ProfileImageBloc, ProfileImageState>(
        builder: (context, state) {
          if (state is ProfileImageGetUrlState) {
            return CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              backgroundImage: NetworkImage(
                state.url,
              ),
              radius: radius.h,
              child: child,
            );
          }
          return CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage: const AssetImage(
              'assets/images/profile/profile.png',
            ),
            radius: radius.h,
            child: child,
          );
        },
      ),
    );
  }
}
