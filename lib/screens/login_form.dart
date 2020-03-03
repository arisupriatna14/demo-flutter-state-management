import 'package:demo_flutter_provider/bloc/login/login_bloc.dart';
import 'package:demo_flutter_provider/bloc/login/login_event.dart';
import 'package:demo_flutter_provider/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text
        )
      );
    }

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (BuildContext context, LoginState state) {
        return Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'username'),
                controller: _usernameController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'password'),
                controller: _passwordController,
                obscureText: true,
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: () => state is! LoginLoading ? _onLoginButtonPressed() : null
              ),
              Container(
                child: state is LoginLoading ? CircularProgressIndicator() : null,
              )
            ],
          )
        );
      },
    );
  }
}