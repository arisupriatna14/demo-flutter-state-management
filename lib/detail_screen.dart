import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final String imageUri;
  final String origin;

  const DetailScreen({
    Key key,
    @required this.name,
    @required this.imageUri,
    @required this.origin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Hero(
              child: Image.network(imageUri, height: 300, fit: BoxFit.cover),
              tag: name,
            ),
            Text(name),
            Text(origin)
          ],
        ),
      )
    );
  }
}