import 'package:demo_flutter_provider/detail_screen.dart';
import 'package:demo_flutter_provider/model/animal.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
        itemCount: dataAnimal.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: dataAnimal[index].name,
                    child: ClipRRect(
                      child: Image.network(
                        dataAnimal[index].imageUri,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          dataAnimal[index].name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.pin_drop),
                            Text(dataAnimal[index].origin)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) =>
                    DetailScreen(
                      name: dataAnimal[index].name,
                      origin: dataAnimal[index].origin,
                      imageUri: dataAnimal[index].imageUri,
                    )
                )
              );
            },
          );
        },
      )
    );
  }
}
