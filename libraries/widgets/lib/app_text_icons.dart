import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:values/values.dart';
import 'package:widgets/text.dart';
import 'flutter_svg_service.dart';

class AppTextIcons extends StatelessWidget {
  final String label;
  final Function onPress;
  final bool disabled;
  final double elevation;
  final double height;
  final double width;
  final Color color;
  final TextStyle textStyle;
  final double borderRadius;
  final Widget iconWidgetLeading;
  final bool iconWidgetEndHid;
  final bool iconStartHid;
  final EdgeInsetsGeometry padding;
  final double leftMargin;
  final Alignment alignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool isScrollingText;
  final int maxLines;

  const AppTextIcons(
      {Key key,
      this.textStyle,
      this.label,
      this.onPress,
      this.color,
      this.height,
      this.width,
      this.elevation = 1,
      this.borderRadius,
      this.alignment,
      this.leftMargin,
      this.iconWidgetLeading,
      this.iconWidgetEndHid = true,
      this.iconStartHid = true,
      this.crossAxisAlignment,
      this.isScrollingText = false,
      this.padding,
      this.disabled,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        GestureDetector(
            onTap: onPress,
            child: Container(
                width: getScreenWidth(context),
                padding: padding ??
                    EdgeInsets.only(bottom: 45.0, left: 21.0, right: 21.0),
                child: Align(
                    alignment: alignment ?? Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                          crossAxisAlignment ?? CrossAxisAlignment.center,
                      children: [
                        Visibility(
                            visible: iconStartHid ? true : false,
                            child: Container(
                                padding: EdgeInsets.only(top: 3.4),
                                child: iconWidgetLeading)),
                        Container(
                            margin: EdgeInsets.only(left: leftMargin ?? 19.0),
                            child: Container(
                              child: AppText(
                                      text: label ?? "",
                                      textStyle: textStyle,
                                      maxLines: maxLines,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                            )
                            ),
                        Visibility(
                            visible: iconWidgetEndHid ? true : false,
                            child: Container(
                                alignment: Alignment.center,
                                child: SvgWidget(imgPath:
                                  Assets.backArrowCs,
                                  alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                ))),
                      ],
                    )))),
      ],
    );
  }
}
