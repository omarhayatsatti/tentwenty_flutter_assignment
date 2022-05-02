import 'package:flutter/cupertino.dart';
import 'package:navigation/navigation.dart';
import 'package:home/home.dart';
import 'package:watch/watch.dart';


final watchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

final movieDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MovieDetailPage(
      movieId:params["movieId"][0],
  );
});
