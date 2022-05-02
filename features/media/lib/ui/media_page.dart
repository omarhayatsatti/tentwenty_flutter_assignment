import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets/text.dart';
import 'package:widgets/widgets.dart';
import 'package:values/values.dart';

class MediaPage extends StatefulWidget {
  @override
  MediaPageState createState() => MediaPageState();
}

class MediaPageState extends State<MediaPage> {
  @override
  Widget build(BuildContext context) {
    return MediaPageView();
  }
}

class MediaPageView extends StatefulWidget {
  @override
  _MediaPageViewState createState() => _MediaPageViewState();
}

class _MediaPageViewState extends State<MediaPageView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: AppText(
      text: CString.pageComingSoon,
      textStyle: Style.roboto(
          color: AppColors.darkGrey, size: 16.0, fontWeight: FontWeight.w400),
      maxLines: 1,
      textAlign: TextAlign.center,
    ))));
  }
}
