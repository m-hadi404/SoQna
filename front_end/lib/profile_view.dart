import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/core/widgets/custom_text.dart';

import 'features/auth/presentation/controller/auth_bloc.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                height: 80.h,
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: 24.h, left: 16.w, right: 16.w),
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
                        text: 'PROFILE',
                        fontSize: 24,
                        alignment: Alignment.bottomCenter,
                      ),
                      Container(
                        width: 24,
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h, right: 16.w, left: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 60.h,
                              foregroundImage: NetworkImage(state.user.image)),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            children: [
                              CustomText(
                                text:
                                    "${state.user.firstName} ${state.user.firstName}",
                                fontSize: 26,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              CustomText(
                                text: state.user.email,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      CustomListTile(
                        iconName: '1',
                        title: 'Edit Profile',
                        onTapFn: () {
                          Navigator.pushNamed(context, '/editProfile');
                        },
                      ),
                      CustomListTile(
                        iconName: '2',
                        title: 'Order History',
                        onTapFn: () {
                          Navigator.pushNamed(context, '/orders');
                          
                        },
                      ),
                      CustomListTile(
                        iconName: '3',
                        title: 'Cards',
                        onTapFn: () {
                          Navigator.pushNamed(context, '/cart');
                          
                        },
                      ),
                      CustomListTile(
                        iconName: '4',
                        title: 'Log Out',
                        onTapFn: () {
                          context.read<AuthBloc>().add(LogoutEvent());
                          Navigator.popAndPushNamed(context, '/signIn');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String iconName;
  final String title;
  final VoidCallback onTapFn;

  const CustomListTile({
    required this.iconName,
    required this.title,
    required this.onTapFn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTapFn,
          leading: Image.asset(
            'assets/images/icons/menu_icons/$iconName.png',
            height: 40.h,
            width: 40.h,
          ),
          title: CustomText(
            text: title,
            fontSize: 18,
          ),
          trailing: title == 'Log Out'
              ? null
              : Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
