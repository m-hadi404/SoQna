import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/features/auth/presentation/controller/auth_bloc.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/core/utils/colors.dart';


import '../components/custom_text.dart';
import '../components/custom_textFormField.dart';
import '../components/custom_button.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.signUpState == RequestState.loaded) {
          Navigator.popAndPushNamed(context, '/');
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Sign Up success')));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  right: 16.w, left: 16.w, top: 32.h, bottom: 44.h),
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
                              children: [
                                CustomText(
                                  text: 'Sign Up',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.popAndPushNamed(
                                        context, '/signIn');
                                  },
                                  child: CustomText(
                                    text: 'I have account',
                                    fontSize: 14,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 48.h,
                            ),
                            CustomTextFormField(
                              controller: firstName,
                              title: 'First Name',
                              hintText: 'Enter your first name',
                              validatorFn: (value) {
                                if (value!.isEmpty || value.length < 3)
                                  return 'Please enter valid first name.';
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 38.h,
                            ),
                            CustomTextFormField(
                              controller: lastName,
                              title: 'Last Name',
                              hintText: 'Enter your full name',
                              validatorFn: (value) {
                                if (value!.isEmpty || value.length < 3)
                                  return 'Please enter valid last name.';
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 38.h,
                            ),
                            CustomTextFormField(
                              controller: email,
                              title: 'Email',
                              hintText: 'email@example.com',
                              keyboardType: TextInputType.emailAddress,
                              validatorFn: (value) {
                                if (value!.isEmpty)
                                  return 'Please enter valid email address.';
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 38.h,
                            ),
                            CustomTextFormField(
                              controller: username,
                              title: 'Username',
                              hintText: 'enter your Username',
                              validatorFn: (value) {
                                if (value!.isEmpty)
                                  return 'Please enter valid email address.';
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
                                if (value!.isEmpty || value.length < 6)
                                  return 'Please enter valid password with at least 6 characters.';
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 60.h,
                            ),
                            CustomButton(
                              'SIGN UP',
                              () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(SignUpEvent(
                                      username: username.text,
                                      password: password.text,
                                      email: email.text,
                                      firstName: firstName.text,
                                      lastName: lastName.text));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
