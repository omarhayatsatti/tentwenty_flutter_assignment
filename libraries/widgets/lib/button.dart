import 'package:flutter/material.dart';
import 'package:values/values.dart';
import 'package:widgets/widgets.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function onPress;
  final bool disabled;
  final double elevation;
  final double height;
  final double width;
  final Color color;
  final bool isRich;
  final String price;
  final TextStyle textStyle;
  final double borderRadius;

  const AppButton(
      {Key key,
      this.textStyle,
      this.label,
      this.onPress,
      this.color,
        this.isRich=false,
      this.height,
      this.width,
        this.price,
      this.elevation = 1,
      this.borderRadius,
      this.disabled=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
            elevation: elevation ?? 0,
            height: height ?? Dimens.buttonHeight,
            minWidth: width ?? 0,
            disabledColor: AppColors.darkGrey,
            color: color ?? AppColors.brownishGray,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius??10.0)
            ),

            onPressed: disabled?null:onPress,
            child: this.isRich?RichText(
              text: TextSpan(
                text: label,
                style: textStyle,
                children: <TextSpan>[
                  TextSpan(text: " | ", style: Style.archivo(color: AppColors.white, size: 20.0,fontWeight:FontWeight.w400)),
                  TextSpan(text: label,style: Style.archivo(color: AppColors.white, size: 16.0,fontWeight:FontWeight.w400)),
                ],
              ),
            ): Text(label ?? "",
                style: textStyle, textAlign: TextAlign.center))


    );
  }
}
