import 'package:demo_flutter_provider/color_bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ColorBloc bloc = ColorBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC without Package"),
      ),
      body: StreamBuilder(
        stream: bloc.stateStream,
        initialData: Colors.amber,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Center(
            child: AnimatedContainer(
              width: 200,
              height: 200,
              duration: Duration(milliseconds: 500),
              color: snapshot.data,
            ),
          );
        },  
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_amber);
            },
            backgroundColor: Colors.amber
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_light_blue);
            },
            backgroundColor: Colors.lightBlue
          )
        ],
      ),
    );
  }
}
