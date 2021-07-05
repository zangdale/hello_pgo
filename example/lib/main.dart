import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hello_pgo/hello_pgo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  int _platformHelloNum = 0;
  String _platformHelloStr = '点击';

  // HelloGo _hello =new HelloGo();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await HelloPgo.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> initHelloNum() async {
    String platformHello;

    try {
      platformHello =
          await HelloPgo.hello(_platformHelloNum) ?? 'Unknown platform version';
    } on PlatformException {
      platformHello = 'Failed to get platform hello.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    _platformHelloNum++;

    setState(() {
      _platformHelloStr = platformHello;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(child: Column(
          children:[
          Text('Running on: $_platformVersion\n'),
          Text('$_platformHelloStr\n'),
          ElevatedButton(onPressed:  initHelloNum, child: Text('Hello'))
          ],
        ),
        )
      ),
    );
  }
}
