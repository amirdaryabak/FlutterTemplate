import 'dart:async';
import 'package:flutter/material.dart';

class SearchDelayOnChange {
  final int seconds;
  Timer? _timer;

  SearchDelayOnChange({this.seconds = 1});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(seconds: seconds), action);
  }
}