import 'dart:async';

import 'package:demo_flutter_provider/ProviderPart3/setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ProviderPart3/uiset.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isEnabledShimmer = true;

  @override
  void initState() { 
    super.initState();
    Timer(Duration(milliseconds: 5000), () => setState(() => isEnabledShimmer = false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hacktiv8 Indonesia"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (BuildContext context) => SettingScreen()
                )
              );
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: isEnabledShimmer ? ShimmerCard(isEnabledShimmer: isEnabledShimmer) : ListItem(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UISet>(context);

    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration( 
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))
                ),
                child: ClipRRect(
                  child: Image.network(
                    'https://yt3.ggpht.com/a/AGF-l7_8MEQpzNpa-cbA2CKK5IlUHK_CJKSBnkqGHQ=s900-c-k-c0xffffffff-no-rj-mo',
                    width: 80,
                    height: 80,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                )
              ),
              Padding(padding: EdgeInsets.all(8)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Lorem ipsum dolor sit amet",
                        style: TextStyle(fontSize: ui.fontSize),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
                    Container(
                      child: Text("Lorem ipsum"),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 8.0)),
                    Container(
                      child: Text("14-08-2020"),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    Key key,
    @required this.isEnabledShimmer,
  }) : super(key: key);

  final bool isEnabledShimmer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Shimmer.fromColors(
          enabled: isEnabledShimmer,
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          period: Duration(milliseconds: 2000),
          child: Column(
            children: <Widget>[
              CardItemShimmer(),
              Padding(padding: EdgeInsets.all(8)),
              CardItemShimmer(),
              Padding(padding: EdgeInsets.all(8)),
              CardItemShimmer(),
              Padding(padding: EdgeInsets.all(8)),
              CardItemShimmer(),
              Padding(padding: EdgeInsets.all(8)),
              CardItemShimmer()
            ],
          )
        )
      ],
    );
  }
}

class CardItemShimmer extends StatelessWidget {
  const CardItemShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration( 
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))
          ),
        ),
        Padding(padding: EdgeInsets.all(8)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 8.0,
                color: Colors.white,
              ),
              Padding(padding: EdgeInsets.all(8)),
              Container(
                width: double.infinity,
                height: 8.0,
                color: Colors.white,
              ),
              Padding(padding: EdgeInsets.all(8)),
              Container(
                width: 40.0,
                height: 8.0,
                color: Colors.white,
              ),
            ],
          ),
        )
      ],
    );
  }
}