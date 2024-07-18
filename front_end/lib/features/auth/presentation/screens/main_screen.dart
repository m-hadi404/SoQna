import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/core/network/api_constances.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/core/services/services_locator.dart';
import 'package:front_end/features/auth/presentation/controller/auth_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>()
        ..add(GetUsersEvent()),
        // ..add(CreateUserEvent(
        //     name: 'Mohamad',
        //     email: 'mohamad@gmail.com',
        //     password: '12345678',
        //     phone: '0987654324',
        //     avatar: ApiConstances.imageUrl("${1 + Random().nextInt(1000)}"),
        //     createdAt: DateTime.now().toString())),
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) =>
                previous.getUsersState != current.getUsersState,
            builder: (context, state) {
              switch (state.getUsersState) {
                case RequestState.loading:
                  return const SizedBox(
                    height: 250.0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case RequestState.loaded:
                  print(state.getUsers);
                  return Container(
                    child: Text("loded"),
                  );
                case RequestState.error:
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.getUsersMessage)));
                  return Container(
                    child: Text("erorr"),
                  );
              }
            }),
      ),
    );
  }
}
