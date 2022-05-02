part of values;

class AppDecoration {
  static final BoxDecoration greenGradient = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00985C), Color(0xFF21D95F)]),
  );

  static final BoxDecoration watchTrailerDecoration = BoxDecoration(
    color: AppColors.transparent,
      border: Border.all(color: AppColors.blue, style: BorderStyle.solid, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );

  static final BoxDecoration bottomNavigationBarContainer = BoxDecoration(
      color: AppColors.darkGrey,
      //border: Border.all(color: AppColors.white,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(27)),

      );

  static final BoxDecoration boxDecorationAction = BoxDecoration(
      color: AppColors.genresAction,

      //border: Border.all(color: AppColors.white,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)));
  static final BoxDecoration boxDecorationT = BoxDecoration(
      color: AppColors.genresT,

      //border: Border.all(color: AppColors.white,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)));
  static final BoxDecoration boxDecorationS = BoxDecoration(
      color: AppColors.genresS,

      //border: Border.all(color: AppColors.white,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)));

  static final BoxDecoration boxDecorationF = BoxDecoration(
      color: AppColors.genresF,

      //border: Border.all(color: AppColors.white,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)));


























}
