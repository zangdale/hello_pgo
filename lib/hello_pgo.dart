
import 'dart:async';

import 'package:flutter/services.dart';

class HelloPgo {
  static const MethodChannel _channel =
      const MethodChannel('hello_pgo');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> hello(int num) async {
    final String? version = await _channel.invokeMethod('getHello',num.toString());
    return version;
  }
}

class HelloGo {
  static const MethodChannel _channel = const MethodChannel('hello_go');
}
