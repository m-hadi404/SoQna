import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/core/widgets/custom_button.dart';
import 'package:front_end/core/widgets/custom_text.dart';
import 'package:front_end/features/auth/presentation/controller/auth_bloc.dart';

import '../components/custom_textFormField.dart';

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String? firstName;
  String? lastName;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130.h,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.h, left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  CustomText(
                    text: 'Edit Profile',
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {},
            builder: (context, state) => Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 16.w, left: 16.w, bottom: 24.h),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.h),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: 60.h,
                                    foregroundImage:
                                        NetworkImage(state.user.image)),
                                SizedBox(
                                  width: 40.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 38.h,
                            ),
                            CustomTextFormField(
                              title: 'Frast Name',
                              hintText: state.user.firstName,
                              validatorFn: (value) {
                                if (value!.isEmpty || value.length < 4)
                                  return 'Please enter valid name.';
                                return null;
                              },
                              onSaved: (value) => firstName = value,
                            ),
                            SizedBox(
                              height: 38.h,
                            ),
                            CustomTextFormField(
                              title: 'Last Name',
                              hintText: state.user.lastName,
                              validatorFn: (value) {
                                if (value!.isEmpty || value.length < 4)
                                  return 'Please enter valid name.';
                                return null;
                              },
                              onSaved: (value) => lastName = value,
                            ),
                            SizedBox(
                              height: 38.h,
                            ),
                            Column(
                              children: [
                                CustomTextFormField(
                                  title: 'Email',
                                  hintText: state.user.email,
                                  keyboardType: TextInputType.emailAddress,
                                  validatorFn: (value) {
                                    if (value!.isEmpty)
                                      return 'Please enter valid email address.';
                                    return null;
                                  },
                                  onSaved: (value) => email = value,
                                ),
                                SizedBox(
                                  height: 38.h,
                                ),
                                CustomTextFormField(
                                  title: 'Password',
                                  hintText: '',
                                  obscureText: true,
                                  validatorFn: (value) {
                                    if (value!.isEmpty || value.length < 8)
                                      return 'Please enter valid password with at least 6 characters.';
                                    return null;
                                  },
                                  onSaved: (value) => password = value,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            _isLoading
                                ? CircularProgressIndicator()
                                : CustomButton(
                                    'SUBMIT',
                                    () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          _isLoading = true;
                                        });
                                        _formKey.currentState!.save();
                                        try {
                                          context.read<AuthBloc>().add(
                                              UpdateUserEvent(
                                                  id: state.user.id,
                                                  password:
                                                      password ?? "12345678"));
                                          _isLoading = false;
                                        } catch (e) {
                                          print(e);
                                        }
                                      }
                                    },
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
