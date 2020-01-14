import 'package:demo_flutter_provider/ProviderPart3/theme.dart';
import 'package:demo_flutter_provider/ProviderPart3/uiset.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerTheme = Provider.of<ThemeNotifier>(context);
    var providerUiSet = Provider.of<UISet>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Font Size"),
              subtitle: Slider(
                onChanged: (double value) {
                  providerUiSet.fontSize = value;
                },
                value: providerUiSet.sliderFontSize,
                min: 0.5,
              ),
            ),
            RaisedButton(
              child: Text("Change Theme"),
              onPressed: () => providerTheme.switchTheme(),
            )
          ],
        ),
      ),
    );
  }
}