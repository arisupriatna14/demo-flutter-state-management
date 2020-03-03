import 'package:demo_flutter_provider/bloc/authentication/authentication_bloc.dart';
import 'package:demo_flutter_provider/bloc/authentication/authentication_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home')
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Logout'),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            }
          )
        )
      ),
    );
  }
}