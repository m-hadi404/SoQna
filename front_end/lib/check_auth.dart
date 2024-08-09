import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/enums.dart';
import 'features/auth/presentation/controller/auth_bloc.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isAuthorizedState == RequestState.loaded) {
          if (state.isAuthorized == true) {
            Navigator.pushNamed(context, '/');
          } else {
            Navigator.pushNamed(context, '/signIn');
          }
        }
      },
      buildWhen: (previous, current) => previous.getUserState != current.getUserState,
      builder: (context, state) {
        return Scaffold(body: Builder(builder: (context) {
          switch (state.isAuthorizedState) {
            case RequestState.loading:
              return const SizedBox(
                height: 250.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case RequestState.loaded:
              return const SizedBox(
                height: 250.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case RequestState.error:
              print(state.isAuthorizedMessage);
              Navigator.pushNamed(context, '/signIn');
              return Container();
          }
        }));
      },
    );
  }
}
