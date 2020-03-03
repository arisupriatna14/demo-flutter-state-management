import 'package:demo_flutter_provider/bloc/authentication/authentication_bloc.dart';
import 'package:demo_flutter_provider/bloc/login/login_bloc.dart';
import 'package:demo_flutter_provider/repository/user_repository.dart';
import 'package:demo_flutter_provider/screens/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;
  const LoginScreen({Key key, @required this.userRepository})
    : assert(userRepository != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            userRepository: userRepository,
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)
          );
        },
        child: LoginForm(),
      ),
    );
  }
}