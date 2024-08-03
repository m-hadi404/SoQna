import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/core/utils/enums.dart';
import 'package:front_end/core/services/services_locator.dart';
import 'package:front_end/features/auth/presentation/controller/auth_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>()
        ..add(SignInEvent(
            username: 'emilys',
            password: 'emilyspass')),
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) =>
                previous.signInState != current.signInState,
            builder: (context, state) {
              switch (state.signInState) {
                case RequestState.loading:
                  return const SizedBox(
                    height: 250.0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case RequestState.loaded:
                  print(state.user);
                  return Column(
                    children: [
                      Container(
                        child: Text("loaded"),
                      ),
                      ElevatedButton(onPressed: () async{
                      }, child: Text('token'))
                    ],
                  );
                case RequestState.error:
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.signUpMessage)));
                  return Container(
                    child: Text("erorr"),
                  );
              }
            }),
      ),
    );
  }
}
