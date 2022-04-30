import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:values/values.dart';
import 'package:widgets/widgets.dart';

class BottomNavigationBarCustom extends StatelessWidget {
  final Function onTap1;
  final Function onTap2;
  final Function onTap3;
  final Function onTap4;
  final int selectedIndex;
  const BottomNavigationBarCustom(
      {Key key,
        this.onTap1,
        this.onTap2,
        this.onTap3,
        this.onTap4,
        this.selectedIndex = 0
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(5),
      child: Container(
          height: 60,
        padding: EdgeInsets.only(left: 20,right: 20),
        decoration: AppDecoration.bottomNavigationBarContainer,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: onTap1,
              child: Container(
                padding: EdgeInsets.only(left: 5,right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                      child:SvgWidget(fit: BoxFit.contain,imgPath: Assets.dashBoard,color: selectedIndex==0?AppColors.white:AppColors.white.withOpacity(0.54),)),
                  Container(
                    margin: EdgeInsets.only(top: 7.0),
                    child:
                    AppText(
                      text: CString.dashBoard,
                      textStyle: Style.roboto(
                          color: selectedIndex==0?AppColors.white:AppColors.white.withOpacity(0.54),
                          size: 10.0,
                          fontWeight: FontWeight.w400),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),),

                ],),
              ),
            ),
            InkWell(
              onTap: onTap2,
              child: Container(
                padding: EdgeInsets.only(left: 5,right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child:SvgWidget(fit: BoxFit.contain,imgPath: Assets.watch,color: selectedIndex==1?AppColors.white:AppColors.white.withOpacity(0.54),)),
                    Container(
                      margin: EdgeInsets.only(top: 7.0),
                      child:
                      AppText(
                        text: CString.watch,
                        textStyle: Style.roboto(
                            color: selectedIndex==1?AppColors.white:AppColors.white.withOpacity(0.54),
                            size: 10.0,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),),

                  ],),
              ),
            ),
            InkWell(
              onTap: onTap3,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(

                        child:SvgWidget(fit: BoxFit.contain,imgPath: Assets.media,color: selectedIndex==2?AppColors.white:AppColors.white.withOpacity(0.54),)),
                    Container(
                      margin: EdgeInsets.only(top: 7.0),
                      child:
                      AppText(
                        text: CString.media,
                        textStyle: Style.roboto(
                            color: selectedIndex==2?AppColors.white:AppColors.white.withOpacity(0.54),
                            size: 10.0,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),),

                  ],),
              ),
            ),
            InkWell(
              onTap: onTap4,
              child: Container(
                padding: EdgeInsets.only(left: 5,right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child:SvgWidget(fit: BoxFit.contain,imgPath: Assets.dashBoard,color: selectedIndex==3?AppColors.white:AppColors.white.withOpacity(0.54),)),
                    Container(
                      margin: EdgeInsets.only(top: 7.0),
                      child:
                      AppText(
                        text: CString.more,
                        textStyle: Style.roboto(
                            color: selectedIndex==3?AppColors.white:AppColors.white.withOpacity(0.54),
                            size: 10.0,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),),

                  ],),
              ),
            )


          ],)
      ));
  }
}