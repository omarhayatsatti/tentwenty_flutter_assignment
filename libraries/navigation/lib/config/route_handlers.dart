import 'package:flutter/cupertino.dart';
import 'package:navigation/navigation.dart';
import 'package:splash/watch.dart';

final watchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MainPage();
});


