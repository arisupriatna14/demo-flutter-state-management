import 'package:demo_flutter_provider/bloc/authentication/authentication_bloc.dart';
import 'package:demo_flutter_provider/bloc/authentication/authentication_event.dart';
import 'package:demo_flutter_provider/bloc/authentication/authentication_state.dart';
import 'package:demo_flutter_provider/repository/user_repository.dart';
import 'package:demo_flutter_provider/screens/home_page_screen.dart';
import 'package:demo_flutter_provider/screens/login_page_screen.dart';
import 'package:demo_flutter_provider/screens/splash_screen.dart';
import 'package:demo_flutter_provider/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegatea extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    // TODO: implement onError
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegatea();
  final userRepository = UserRepository();

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)..add(AppStarted());
      },
      child: MyApp(userRepository: userRepository),
    )
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationUninitialized) {
            return SplashScreen();
          }

          if (state is AuthenticationAuthenticated) {
            return HomePageScreen();
          }

          if (state is AuthenticationUnauthenticated) {
            return LoginScreen(userRepository: userRepository);
          }

          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}
