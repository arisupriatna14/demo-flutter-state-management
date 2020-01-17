import 'package:demo_flutter_provider/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter BLoC"),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (BuildContext context, state) {
          return Center(
            child: Text(
              '$state',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        }
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed: () {
                counterBloc.add(CounterEvent.increment);
              },
              child: Icon(Icons.add)
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed: () {
                counterBloc.add(CounterEvent.decrement);
              },
              child: Icon(Icons.remove),
            ),
          )
        ],
      ),
    );
  }
}