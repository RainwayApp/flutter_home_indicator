import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:home_indicator/home_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isHidden = false;

  Future<void> _fetchIsHidden() async {
    final isHidden = await HomeIndicator.isHidden();
    setState(() {
      _isHidden = isHidden;
    });
  }

  Future<void> _hideHomeIndicator() async {
    await HomeIndicator.hide();
    _fetchIsHidden();
  }

  Future<void> _showHomeIndicator() async {
    await HomeIndicator.show();
    _fetchIsHidden();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HomeIndicator example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(onPressed: _hideHomeIndicator, child: Text('Hide')),
              RaisedButton(onPressed: _showHomeIndicator, child: Text('Show')),
              Text("(The indicator might take a second to disappear.)"),
              Text("HomeIndicator.isHidden() == $_isHidden"),
            ],
          ),
        ),
      ),
    );
  }
}
