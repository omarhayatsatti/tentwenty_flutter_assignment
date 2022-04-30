import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

import 'helperFunction/helper_functions.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

int getImageHeight(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.height * percent).toInt();
}

int getImageWidth(BuildContext context, double percent) {
  return (MediaQuery.of(context).size.width * percent).toInt();
}

String getImageUrl(String url, int width, int height) {
  if (!isNullOrEmpty(url) && url.contains('s3')) {
    // this is because in some cases we are having an image from s3 bucket which causes problem while passing width and height
    return "$url";
  } else {
    return "$url/$width/$height";
  }
}


double notchBottomPadding(BuildContext context) {
  double padding = MediaQuery.of(context).viewPadding.bottom;
  if (Platform.isIOS)
    return padding / 2;
  else {
    if (padding == 0) {
      padding = getScreenHeight(context) * 0.01;
    } else
      padding = padding / 2;
    return padding;
  }
}
