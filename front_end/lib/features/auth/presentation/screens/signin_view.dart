import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/features/auth/presentation/controller/auth_bloc.dart';

import 'package:front_end/core/utils/colors.dart';
import '../components/custom_text.dart';
import '../components/custom_textFormField.dart';
import '../components/custom_button.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.signInState == RequestState.loaded) {
          Navigator.popAndPushNamed(context, '/');
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Sign In success')));
        }
      },
      child: OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 16.w, left: 16.w, top: 126.h, bottom: 42.h),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.h),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Welcome,',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.popAndPushNamed(
                                        context, '/signUp');
                                  },
                                  child: CustomText(
                                    text: 'Sign Up',
                                    fontSize: 18,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: 'Sign in to Continue',
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 48.h,
                            ),
                            CustomTextFormField(
                              controller: username,
                              title: 'Username',
                              hintText: 'Enter your username',
                              validatorFn: (value) {
                                if (value!.isEmpty)
                                  return 'Email invalid or not found';
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 38.h,
                            ),
                            CustomTextFormField(
                              controller: password,
                              title: 'Password',
                              hintText: '***********',
                              obscureText: true,
                              validatorFn: (value) {
                                if (value!.isEmpty)
                                  return 'Password is incorrect';
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomText(
                              text: 'Forgot Password?',
                              fontSize: 14,
                              alignment: Alignment.centerRight,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomButton(
                              'SIGN IN',
                              () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(SignInEvent(
                                      username: username.text,
                                      password: password.text));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonSocial extends StatelessWidget {
  final VoidCallback onPressedFn;
  final String image;
  final String title;

  const CustomButtonSocial({
    required this.onPressedFn,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressedFn,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/icons/$image.png',
              fit: BoxFit.cover,
              height: 20.h,
              width: 20.h,
            ),
            CustomText(
              text: title,
              fontSize: 14,
            ),
            Container(width: 20.h),
          ],
        ),
      ),
    );
  }
}
