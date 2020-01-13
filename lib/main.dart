import 'package:demo_flutter_provider/ProviderPart2/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo_flutter_provider/application_color.dart';
import 'package:provider/provider.dart';

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
      home: CartScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ApplicationColor(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<ApplicationColor>(
            builder: (BuildContext context, ApplicationColor value, _) {
              return Text(
                "Provider State Management",
                style: TextStyle(
                  color: value.color
                ),
              );
            },
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<ApplicationColor>(
              builder: (BuildContext context, ApplicationColor value, Widget child) {
                return AnimatedContainer(
                  width: 300,
                  height: 300,
                  color: value.color,
                  duration: Duration(milliseconds: 500)
                );
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(6),
                  child: Text("AB"),
                ),
                Consumer<ApplicationColor>(
                  builder: (BuildContext context, ApplicationColor value, Widget child) {
                    return Switch(
                      value: value.isLightBlue,
                      onChanged: (newValue) => value.isLightBlue = newValue
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  child: Text("LB"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}