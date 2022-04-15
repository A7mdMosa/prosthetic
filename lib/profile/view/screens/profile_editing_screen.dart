import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/user_bloc.dart';
import '../widgets/profile_image.dart';
import '../../data/models/user_model.dart';
import '../../bloc/profile_image_bloc.dart';
import '../../../admin/view/widgets/new_text_form_field.dart';

class ProfileEditingScreen extends StatelessWidget {
  ProfileEditingScreen({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  'Are you sure ?',
                ),
                content: const Text(
                  'Do you wanna save the changes ? ',
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'Yes',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        _form.currentState!.save();
                        //Hide the keyboard.
                        FocusManager.instance.primaryFocus?.unfocus();
                        //Update user data.
                        BlocProvider.of<UserBloc>(context)
                            .add(UserUpdateEvent(newUserModel: userModel));
                        //Load profile Image.
                        BlocProvider.of<ProfileImageBloc>(context)
                            .add(ProfileImageGetEvent());
                        Navigator.pop(context);
                        Navigator.pop(context);
                        print('valid');
                      } else {
                        print('not valid');
                        Navigator.pop(context);
                      }
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'No',
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Form(
            key: _form,
            child: ListView(
              children: [
                InkWell(
                  onTap: () {
                    //Add Image.
                    BlocProvider.of<ProfileImageBloc>(context)
                        .add(ProfileImageLoadedEvent());
                    //LoadImage
                    BlocProvider.of<ProfileImageBloc>(context)
                        .add(ProfileImageGetEvent());
                  },
                  child: CircleAvatar(
                    radius: 83.h,
                    backgroundColor: const Color(0xffFB9482),
                    child: ProfileImage(
                        wildRadius: 83,
                        radius: 80,
                        child: ClipOval(
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                            child: Center(
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 40.h,
                                color: Colors.orange.shade900,
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                TextButton(
                    child: Text(
                      'Remove',
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            'Are you sure ?',
                          ),
                          content: const Text(
                            'Do you wanna remove your profile picture ? ',
                          ),
                          actions: [
                            TextButton(
                              child: Text(
                                'Yes',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              onPressed: () {
                                //Remove image.
                                BlocProvider.of<ProfileImageBloc>(context)
                                    .add(ProfileImageRemoveEvent());
                                //Update image.
                                BlocProvider.of<ProfileImageBloc>(context)
                                    .add(ProfileImageGetEvent());
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text(
                                'No',
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 10.h,
                ),
                NewTextFormField(
                  label: 'First Name',
                  initialValue: userModel.firstName,
                  onSaved: (value) {
                    userModel.firstName = value!;
                  },
                  textInputType: TextInputType.name,
                ),
                NewTextFormField(
                  label: 'Last Name',
                  initialValue: userModel.lastName,
                  onSaved: (value) {
                    userModel.lastName = value!;
                  },
                  textInputType: TextInputType.name,
                ),
                NewTextFormField(
                  label: 'Job',
                  initialValue: userModel.job,
                  onSaved: (value) {
                    userModel.job = value!;
                  },
                  textInputType: TextInputType.name,
                ),
                NewTextFormField(
                  label: 'Age',
                  initialValue: userModel.age.toString(),
                  onSaved: (value) {
                    userModel.age = int.parse(value!);
                  },
                  textInputType: TextInputType.number,
                ),
                NewTextFormField(
                  label: 'Your prosthetic Limb',
                  initialValue: userModel.prostheticLimb.toString(),
                  onSaved: (value) {
                    userModel.prostheticLimb = value!;
                  },
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: 20.h,
                ),
                MaterialButton(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.orange.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                    minWidth: 370.w,
                    height: 60.h,
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        _form.currentState!.save();
                        //Hide the keyboard.
                        FocusManager.instance.primaryFocus?.unfocus();
                        //Update user data.
                        BlocProvider.of<UserBloc>(context)
                            .add(UserUpdateEvent(newUserModel: userModel));
                        //Loading image.
                        BlocProvider.of<ProfileImageBloc>(context)
                            .add(ProfileImageGetEvent());
                        Navigator.pop(context);
                        print('valid');
                      } else {
                        print('not valid');
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
