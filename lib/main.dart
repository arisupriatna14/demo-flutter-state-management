import 'package:demo_flutter_provider/action_button.dart';
import 'package:demo_flutter_provider/bloc/timer_bloc.dart';
import 'package:demo_flutter_provider/bloc/timer_state.dart';
import 'package:demo_flutter_provider/ticker.dart';
import 'package:demo_flutter_provider/wave_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(109, 234, 255, 1),
        accentColor: Color.fromRGBO(72, 74, 126, 1),
        brightness: Brightness.dark,
      ),
      home: BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: Timer(),
      )
    );
  }
}

class Timer extends StatelessWidget {
  const Timer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Timer")),
      body: Stack(
        children: <Widget>[
          Background(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(
                  child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (BuildContext context, state) {
                      final String minutesStr = ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
                      final String secondsStr = (state.duration % 60).floor().toString().padLeft(2, '0');
                      return Text(
                        "$minutesStr:$secondsStr",
                        style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
                      );
                    },
                  )
                ),
              ),
              BlocBuilder<TimerBloc, TimerState>(
                condition: (prevState, state) => state.runtimeType != prevState.runtimeType,
                builder: (BuildContext context, TimerState state) => ActionButton(),
              )
            ],
          ),
        ],
      )
    );
  }
}