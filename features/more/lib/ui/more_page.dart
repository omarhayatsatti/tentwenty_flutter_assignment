import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets/text.dart';
import 'package:widgets/widgets.dart';
import 'package:values/values.dart';

class MorePage extends StatefulWidget {
  @override
  MorePageState createState() => MorePageState();
}

class MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return MorePageView();
  }
}

class MorePageView extends StatefulWidget {
  @override
  _MorePageViewState createState() => _MorePageViewState();
}

class _MorePageViewState extends State<MorePageView>
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
