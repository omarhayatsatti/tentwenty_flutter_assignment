part of values;

class Style {
  static Function fontRegular =
      ({Color color, double size}) => _fontSyle(color, size, FontWeight.w400);
  static Function fontMedium =
      ({Color color, double size,TextDecoration decoration}) => _fontSyle(color, size, FontWeight.w500,decoration: decoration);

  static Function fontBold =
      ({Color color, double size}) => _fontSyle(color, size, FontWeight.w700);

  static Function roboto =
      ({Color color, double size, FontWeight fontWeight,double lineHeight}) => _robotoSyle(color, size, fontWeight,lineHeight);
  static Function archivo=({Color color, double size,FontWeight fontWeight,TextDecoration decoration, TextDecorationStyle decorationStyle =TextDecorationStyle.solid,double lineHeight }) => _archivoStyle(color, size, fontWeight??FontWeight.normal,decoration??TextDecoration.none,decorationStyle,lineHeight);
  static TextStyle _robotoSyle(
      Color color, double size, FontWeight fontWeight,double lineHeight) {
    return _textStyle(FontStyle.normal, color, size, fontWeight,lineHeight: lineHeight);
  }
  static Function fontNormal =
      ({Color color, double size}) => _fontSyle(color, size, FontWeight.normal);


  static TextStyle _fontSyle(
      Color color, double size, FontWeight fontWeight, {TextDecoration decoration}) {
    return _textStyle(FontStyle.normal, color, size, fontWeight,decoration: decoration);
  }
  static TextStyle _archivoStyle(
      Color color, double size, FontWeight fontWeight,TextDecoration decoration, TextDecorationStyle decorationStyle,double lineHeight) {
    return _textStyleArchivo(FontStyle.normal, color, size, fontWeight,decoration,decorationStyle,lineHeight);
  }
  static TextStyle _textStyle(FontStyle fontSyle, Color color, double size, FontWeight fontWeight,{TextDecoration decoration,double lineHeight}) {
    return GoogleFonts.poppins(
        fontStyle: fontSyle,
        fontWeight: fontWeight,
        fontSize: size,
        height: lineHeight,
        decoration: decoration,
        color: color);
  }

  static TextStyle _textStyleArchivo(FontStyle fontSyle, Color color, double size, FontWeight fontWeight,TextDecoration decoration,TextDecorationStyle decorationStyle,double lineHeight) {
    return GoogleFonts.archivo(
        fontStyle: fontSyle,
        fontWeight: fontWeight,
        decoration: decoration??TextDecoration.none,
        fontSize: size,
        height: lineHeight,
        decorationStyle: decorationStyle??TextDecorationStyle.solid,
        decorationThickness: 2,

        color: color);
  }

  static final TextStyle defaultTextStyle =
      GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 12.0,
          color: AppColors.brownishGray);

  static final TextStyle userNameStyle = TextStyle(
      fontSize: Dimens.accountBalanceViewHeight,
      fontFamily: Assets.fontFamily,
      color: Colors.white,
      fontWeight: FontWeight.w600);

  static final TextStyle locationButtonTxtStyle =
  GoogleFonts.roboto(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 18,
      color: AppColors.white);

  static final TextStyle manualLocationButtonTxtStyle =
  GoogleFonts.roboto(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: AppColors.blue);

  //Edit text hint style
  static final TextStyle editTxtHintStyle =
  GoogleFonts.roboto(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: AppColors.darkGrey);


  //editTextStyle style
  static final TextStyle editTextStyle =
  GoogleFonts.roboto(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: AppColors.brownishGray);



}


