import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/text_input_field.dart';
import '../../../home/view/screens/home_screen.dart';
import '../../../profile/data/models/user_model.dart';
import '../../shared_preferences/login_shared_preferences.dart';
import '../../../profile/data/repository/profile_repository.dart';

class LogInScreen extends StatefulWidget {
  static const String route = '/login_screen';
  static const String logIn = 'log_in';
  static const String signUp = 'sign_up';

  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey();

  String firstName = '';
  String lastName = '';
  String prostheticLimb = '';
  int age = 0;
  String email = '';
  String password = '';
  String confirmPassword = '';
  String auth = '';
  bool isLoading = false;

  bool isSignup() {
    if (auth == LogInScreen.signUp) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _submit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      if (isSignup()) {
        try {
          UserCredential result = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
          //Save user data online.
          await ProfileRepository().setUserData(
            user: UserModel(
                id: result.user!.uid,
                firstName: firstName,
                lastName: lastName,
                email: email,
                age: age,
                image: '',
                job: '',
                location: '',
                prostheticLimb: prostheticLimb),
          );
          Navigator.pushNamed(context, HomeScreen.route);
          //Save user data locally to log in again.
          await LoginSharedPreferences.savePref(email, password);
        } catch (e) {
          //The user is badly Formatted.
          if (e.toString() ==
              '[firebase_auth/invalid-email] The email address is badly formatted.') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('The email address is badly formatted'),
              ),
            );
          }
          print(e);
        }
      } else {
        try {
          //Create new account.
          await _auth.signInWithEmailAndPassword(
              email: email, password: password);
          Navigator.pushNamed(context, HomeScreen.route);
          //Save user data locally to log in again.
          await LoginSharedPreferences.savePref(email, password);
        } catch (e) {
          if (e.toString() ==
              '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    'There is no user record corresponding to this identifier'),
              ),
            );
          }
          print(e);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //For displaying login or signup screen.
    auth = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 5.h,
              left: 90.w,
              right: 90.w,
            ),
            child: Image.asset(
              'assets/images/splash_image.png',
              fit: BoxFit.contain,
              height: 50.h,
              width: 100.w,
            ),
          ),
          Text(
            'Prosthetic',
            style: TextStyle(
              fontFamily: 'Redressed',
              fontSize: 30.sp,
              color: Colors.orange.shade700,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            isSignup() ? 'Sign Up' : 'Log In',
            style: TextStyle(
              fontFamily: 'Signika',
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: Colors.orange.shade700,
            ),
          ),
          Form(
            key: _formKey,
            child: Expanded(
              child: ListView(
                children: [
                  if (isSignup() == true)
                    TextInputField(
                      textInputType: TextInputType.name,
                      obscureText: false,
                      title: 'First Name',
                      onSave: (value) {
                        firstName = value!;
                      },
                      onChange: (value) {
                        firstName = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length < 2) {
                          return 'please input your First Name';
                        }
                        return null;
                      },
                    ),
                  if (isSignup() == true)
                    TextInputField(
                      textInputType: TextInputType.name,
                      obscureText: false,
                      title: 'Last Name',
                      onSave: (value) {
                        lastName = value!;
                      },
                      onChange: (value) {
                        lastName = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length < 2) {
                          return 'please input your Last Name';
                        }
                        return null;
                      },
                    ),
                  if (isSignup() == true)
                    TextInputField(
                        textInputType: TextInputType.number,
                        title: 'Age',
                        onSave: (value) {
                          age = int.parse(value!);
                        },
                        onChange: (value) {
                          age = int.parse(value!);
                        },
                        validator: (value) {
                          if (value!.isEmpty || int.parse(value) > 100) {
                            return 'please input your correct age';
                          }
                          return null;
                        },
                        obscureText: false),
                  TextInputField(
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                    title: 'E-Mail',
                    onSave: (value) {
                      email = value!;
                    },
                    onChange: (value) {
                      email = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                      return null;
                    },
                  ),
                  TextInputField(
                    textInputType: TextInputType.text,
                    obscureText: true,
                    title: 'Password',
                    onSave: (value) {
                      password = value!;
                    },
                    onChange: (value) {
                      password = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'the password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  if (isSignup() == true)
                    TextInputField(
                      textInputType: TextInputType.text,
                      obscureText: true,
                      title: 'confirm password',
                      onSave: (value) {
                        confirmPassword = value!;
                      },
                      onChange: (value) {
                        confirmPassword = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || confirmPassword != password) {
                          return 'password and confirm password must be match.';
                        }
                        return null;
                      },
                    ),
                  if (isSignup() == true)
                    TextInputField(
                      textInputType: TextInputType.name,
                      obscureText: false,
                      title: 'The prosthetic limb you use',
                      onSave: (value) {
                        prostheticLimb = value!;
                      },
                      onChange: (value) {
                        prostheticLimb = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return 'please input the prosthetic Limb you use';
                        }
                        return null;
                      },
                    ),
                  SizedBox(height: 20.h),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50.w, vertical: 8.h),
                      child: MaterialButton(
                          child: isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontFamily: 'Signika',
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    letterSpacing: 2,
                                  ),
                                ),
                          color: const Color(0xffFC791C),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          minWidth: 270.w,
                          height: 65.h,
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await _submit(context);
                            setState(() {
                              isLoading = false;
                            });
                          })),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
