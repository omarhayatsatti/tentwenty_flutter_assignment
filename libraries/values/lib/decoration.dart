part of values;

class AppDecoration {
  static final BoxDecoration greenGradient = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00985C), Color(0xFF21D95F)]),
  );
  static final BoxDecoration cardDetailGradient = BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [Color(0xFFFFFFFF), Color(0xFFdefcec)]),
      boxShadow: [
        BoxShadow(
          color: AppColors.brownishGray,
          offset: Offset(0, 25), //(x,y)
          blurRadius: 20.0,
        ),
      ]);

  static const BoxDecoration searchDecoration = BoxDecoration(
    color: AppColors.sGrey,
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  );
  static const BoxDecoration boxDecorationCs = BoxDecoration(
    color: AppColors.reqBoxColorCs,
    borderRadius: BorderRadius.all(Radius.circular(9.0)),
  );
  static final BoxDecoration searchMainDecoration = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  static final BoxDecoration searchProductsDecoration = BoxDecoration(
    color: AppColors.sGrey,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
  static final BoxDecoration plusDecoration = BoxDecoration(
    color: AppColors.green,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  );
  static final BoxDecoration minDecoration = BoxDecoration(
    color: AppColors.minusColor,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  );
  static final BoxDecoration locationOptionBoxDecoration = BoxDecoration(
    color: AppColors.offWhite,
    border: Border.all(
        color: AppColors.dividerColorNew, style: BorderStyle.solid, width: 1),
    //borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ),
  );
  static final BoxDecoration locationOptionBoxDecorationNew = BoxDecoration(
    color: Color(0xFFe6eff0),
    border: Border.all(
        color: AppColors.dividerColorNew, style: BorderStyle.solid, width: 1),
    //borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ),
  );
  static final BoxDecoration boxDecorationWhite = BoxDecoration(
    color: AppColors.white,
    border: Border.all(
        color: AppColors.dividerColorNew, style: BorderStyle.solid, width: 1),
    //borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ),
  );
  static final BoxDecoration boxDecorationCounterCheckOut = BoxDecoration(
    color: AppColors.transparent,
    border: Border.all(color: AppColors.borderColorCheckoutCounter,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(20))
    //borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ),
  );
  static final BoxDecoration boxDecorationDisLike = BoxDecoration(
    color: AppColors.dividerColor,
    border: Border.all(color: AppColors.borderColorFeedBack,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(8))
    //borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ),
  );
  static final BoxDecoration boxDecorationSelectLike = BoxDecoration(
      color: AppColors.likeBackColor,
      border: Border.all(color: AppColors.borderColorFeedBackLikeSelect,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(8))
    //borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ),
  );
  static final BoxDecoration boxDecorationSelectDisLike = BoxDecoration(
      color: AppColors.removeButtonColor,
      border: Border.all(color: AppColors.borderColorFeedBackDisLikeSelect,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(8))
    //borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ),
  );

  static final BoxDecoration boxDecorationLike = BoxDecoration(
      color: AppColors.transparent,
      border: Border.all(color: AppColors.borderColorFeedBack,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(8))
    //borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ),
  );
  static final BoxDecoration boxDecorationSize = BoxDecoration(
    color: AppColors.boxDecorationSizeColor,
    border: Border.all(color: AppColors.lightGrey,style: BorderStyle.solid,width: 2),
    borderRadius: BorderRadius.only(topLeft:Radius.circular(12.0) ,bottomLeft:Radius.circular(12.0) ),
    //borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ),
  );

  static final BoxDecoration boxDecorationGrey = BoxDecoration(
    color: AppColors.white,
    border: Border.all(color: AppColors.lightGrey,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(12))
    //borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ),
  );
  static final BoxDecoration boxDecorationGreen = BoxDecoration(
    color: AppColors.transparent,
    border: Border.all(color: AppColors.green,style: BorderStyle.solid,width: 2),
    borderRadius: BorderRadius.all(Radius.circular(12))
    //borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ),
  );
  static final BoxDecoration boxDecorationAddCard = BoxDecoration(
    color: AppColors.addCardButtonColor,
    border: Border.all(
        color: AppColors.addCardButtonColor,
        style: BorderStyle.solid,
        width: 1),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );
  static final BoxDecoration locationOptionBoxDecorationOld = BoxDecoration(
    color: AppColors.white,
    //border: Border.all(color: AppColors.white,style: BorderStyle.solid,width: 1),
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
  );
  static final BoxDecoration bottomNavigationBarContainer = BoxDecoration(
      color: AppColors.darkGrey,
      //border: Border.all(color: AppColors.white,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.all(Radius.circular(27)),
        
      );

  static final BoxDecoration topSheetBoxDecoration = BoxDecoration(
      color: AppColors.white,
      //border: Border.all(color: AppColors.white,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0)),
      boxShadow: [
        BoxShadow(
          color: AppColors.textGrey.withOpacity(0.5),
          blurRadius: 10,
          //spreadRadius: 20,
          offset: Offset(0, 3), //(x,y)
        ),
      ]);

  static final BoxDecoration boxDecorationNewAddress = BoxDecoration(
      color: AppColors.white,
      //border: Border.all(color: AppColors.white,style: BorderStyle.solid,width: 1),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(
          color: AppColors.textGrey.withOpacity(0.5),
          blurRadius: 10,
          //spreadRadius: 20,
          offset: Offset(0, 3), //(x,y)
        ),
      ]);

  static final BoxDecoration moduleTopicSlider = BoxDecoration(
    color: const Color(0xffffffff),
//    boxShadow: [
//      BoxShadow(
//        color: Colors.black,
//        blurRadius: 2.0,
//        spreadRadius: 0.0,
//        offset: Offset(2.0, 2.0), // shadow direction: bottom right
//      )
//    ],

    boxShadow: <BoxShadow>[
      BoxShadow(color: Colors.black, blurRadius: 2.0, offset: Offset(0.0, 0.75))
    ],

    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15), topRight: Radius.circular(15)),
  );

  static final BoxDecoration lessonCards = BoxDecoration(
    color: const Color(0xffffffff),
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)),
  );

  static final BoxDecoration lessonCardsDate = BoxDecoration(
    border: Border.all(
        color: AppColors.lightBlueColor, width: 1, style: BorderStyle.solid),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  );

  static final BoxDecoration lessonCardsOrderInfo = BoxDecoration(
    border: Border.all(
        color: AppColors.dimGreen, width: 1, style: BorderStyle.solid),
    color: AppColors.dimGreen,
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  );
  static final BoxDecoration lessonCardsPinkDime = BoxDecoration(
    border: Border.all(
        color: AppColors.pinkDime, width: 1, style: BorderStyle.solid),
    color: AppColors.pinkDime,
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  );
  static final BoxDecoration lessonCardsNew = BoxDecoration(
    border: Border.all(
        color: AppColors.acctDividerColor, width: 1, style: BorderStyle.solid),
    color: AppColors.white,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)),
  );

  static final BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)),
  );

  static final BoxDecoration lessonCardsOrders = BoxDecoration(
      color: const Color(0xffffffff),
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: AppColors.textGrey.withOpacity(0.5),
          blurRadius: 10,
          //spreadRadius: 20,
          offset: Offset(0, 3), //(x,y)
        ),
      ]);

  static final BoxDecoration lockedTopicMessageContainer = BoxDecoration(
    color: const Color(0xffffd43b),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  static final BoxDecoration topicLockedDectoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFF916E),
          Color(0xFFFF7E6C),
          Color(0xFFFF6969),
          Color(0xFFFF5266)
        ]),
  );

  static final BoxDecoration topicInProgressDectoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF6C63FF),
          Color(0xFF7064FE),
          Color(0xFF7565FD),
          Color(0xFF7B66FB),
          Color(0xFF8067FA),
          Color(0xFF8568F9),
          Color(0xFF8969F8),
          Color(0xFF8E6AF7),
          Color(0xFF946CF5),
          Color(0xFF9B6EF3),
          Color(0xFFA270F1)
        ]),
  );

  static final BoxDecoration topicCompleteDectoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF2DE0A4),
          Color(0xFF25D5A8),
          Color(0xFF1DCBAB),
          Color(0xFF0BB3B3)
        ]),
  );

  static final BoxDecoration wrongAnswerDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFF916E),
          Color(0xFFFF7E6C),
          Color(0xFFFF6969),
          Color(0xFFFF5266)
        ]),
  );

  static final BoxDecoration completePorgressionDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF21D4FD),
          Color(0xFF34B7FE),
          Color(0xFF4C93FE),
          Color(0xFF6968FF)
        ]),
  );

  static final triviaGradiant = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF6C63FF),
        Color(0xFF7C67FB),
        Color(0xFF8A6AF7),
        Color(0xFFA270F1)
      ]);

  static final streakGradiant = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF674BBC),
        Color(0xFF704EC5),
        Color(0xFF7B52CF),
        Color(0xFF8656DA),
        Color(0xFF915AE5),
        Color(0xFF995DED),
        Color(0xFFA15FF5)
      ]);

  static final moduleGradiant = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF21D4FD),
        Color(0xFF28CAFD),
        Color(0xFF2FBFFD),
        Color(0xFF37B3FD),
        Color(0xFF3FA7FD),
        Color(0xFF479BFD),
        Color(0xFF508EFD),
        Color(0xFF5685FD),
        Color(0xFF5E78FE),
        Color(0xFF5E78FE),
        Color(0xFF6C63FF)
      ]);
}
