import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets/text.dart';
import 'package:widgets/widgets.dart';
import 'package:values/values.dart';

class DashBoardPage extends StatefulWidget {
  @override
  DashBoardPageState createState() => DashBoardPageState();
}

class DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return DashBoardPageView();
  }
}

class DashBoardPageView extends StatefulWidget {
  @override
  _DashBoardPageViewState createState() => _DashBoardPageViewState();
}

class _DashBoardPageViewState extends State<DashBoardPageView>
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
