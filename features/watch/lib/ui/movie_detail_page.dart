import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/network.dart';
import 'package:widgets/text.dart';
import 'package:widgets/widgets.dart';
import 'package:values/values.dart';
import '../blocs/movie_detail_bloc/movie_detail_bloc.dart';
import '../blocs/upcomingmovie_bloc/upcomingmovies_bloc.dart';
import '../blocs/upcomingmovie_loadmore_bloc/upcomingmovie_loadmore_bloc.dart';

class MovieDetailPage extends StatefulWidget {
  String movieId = "";

  MovieDetailPage({this.movieId});

  @override
  MovieDetailPageState createState() => MovieDetailPageState(movieId: movieId);
}

class MovieDetailPageState extends State<MovieDetailPage> {
  String movieId = "";

  MovieDetailPageState({this.movieId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<MovieDetailBloc>(
        create: (context) => MovieDetailBloc(),
      ),
    ], child: MovieDetailPageView(movieId: movieId));
  }
}

class MovieDetailPageView extends StatefulWidget {
  String movieId = "";

  MovieDetailPageView({this.movieId});

  @override
  _MovieDetailPageViewState createState() => _MovieDetailPageViewState();
}

class _MovieDetailPageViewState extends State<MovieDetailPageView>
    with TickerProviderStateMixin {
  MovieDetailBloc _movieDetailBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<MovieDetailBloc, MovieDetailState>(
            listener: (context, state) {
      // if(state is ActiveOrderError){
      //   showDialogMessage(message: state.message,context: context);
      // }
    }, builder: (context, state) {
      if (state is MovieDetailLoading) {
        return Column(children: [
          Expanded(
            child: LoadingDots(),
          )
        ]);
      }else if (state is MovieDetailLoaded) {
        var response = state.movieDetailResponse;
        return Column(
          children: [
            Expanded(
              flex: 5,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                child: Stack(
                  children: [
                    Hero(
                      tag: 'movieId${widget.movieId}',
                      child: NetworkImageService(
                        fit: BoxFit.cover,
                        imageUrl: response.posterPath!=null?ApiConstant.baseUrlImage+response.posterPath:"https://cdn.pixabay.com/photo/2019/04/24/21/55/cinema-4153289__340.jpg",
                        isMovieDetailPage: false,
                        imageWidth: getScreenWidth(context),
                        imageHeight:
                        getScreenHeight(context) * 0.30,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.90),
                            BlendMode.dstATop),
                        isListingBanner: true,
                        errorWidget: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Container(
                              child: SvgWidget(
                                imgPath: Assets.dashBoard,
                              )),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 48.0,left: 12),
                          child: SvgWidget(fit: BoxFit.contain,imgPath: Assets.backArrowCs),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 48.0,left: 12),
                            child: Container(child:AppText(
                              text: CString.watch,
                              textStyle: Style.roboto(
                                  color: AppColors.white, size: 16.0, fontWeight: FontWeight.w500),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            )))
                      ],
                    ),
                    Positioned(
                      bottom:34.0,
                      left: 60.0,
                      right: 60.0,
                      child: Align(
                        alignment: Alignment.center,
                        //color: AppColors.red50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(child: AppText(
                              text: response.title,
                              textStyle: Style.roboto(
                                  color: AppColors.white, size: 16.0, fontWeight: FontWeight.w500),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            )),
                            Container(
                                margin: EdgeInsets.only(top: 12.0),
                                child: AppText(
                                  text: "In theaters december 22, 2021",
                                  textStyle: Style.roboto(
                                      color: AppColors.white, size: 16.0, fontWeight: FontWeight.w500),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                )),
                            Container(
                                margin: EdgeInsets.only(top: 15.0),
                                child: AppButton(
                                    color: AppColors.blue,
                                    borderRadius: 10.0,
                                    width: getScreenWidth(context)*.62,
                                    height: Dimens.buttonHeightTickets,
                                    label: CString.getTickets,
                                    textStyle: Style.roboto(
                                        color: AppColors.white,
                                        size: 18.0),
                                    onPress: () =>null)),
                            Container(
                                margin: EdgeInsets.only(top:12.0),
                                decoration: AppDecoration.watchTrailerDecoration,
                                width: getScreenWidth(context)*.62,
                                height: Dimens.buttonHeightTickets,
                                child:Center(
                                  child: AppTextIcons(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    isScrollingText: false,

                                    textStyle: Style.roboto(
                                        color: AppColors.white,
                                        size: 14.0,
                                        fontWeight: FontWeight.w600),
                                    label: CString.watchTrailer,
                                    iconWidgetLeading:
                                    SvgWidget(imgPath: Assets.icWatch,fit: BoxFit.contain,alignment: Alignment.center,),
                                    iconWidgetEndHid: false,
                                    leftMargin: 8.0,
                                    padding: EdgeInsets.only(bottom: 0.0),
                                  ),
                                )
                            )

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child:Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20.0,top: 13.0,right: 20.0),
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: AppText(
                            text: CString.genres,
                            textStyle: Style.roboto(
                                color: AppColors.black, size: 16.0, fontWeight: FontWeight.w500),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          )),
                      Expanded(
                          child: response.genres.length>0?ListView.builder(
                              itemCount: response.genres.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    alignment: Alignment.center,

                                    margin: EdgeInsets.only(right: 5.0),
                                    decoration: getDecorationBox(response.genres[index].name),
                                    child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: AppText(
                                        text:response.genres[index].name,
                                        textStyle: Style.roboto(
                                            color: AppColors.white, size: 12.0, fontWeight: FontWeight.w600),
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                      ),
                                    ));
                              }):Container()),
                      Expanded(
                        flex:10,
                        child: Container(
                          margin: EdgeInsets.only(top: 39.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: CString.overView,
                                textStyle: Style.roboto(
                                    color: AppColors.lightBlue, size: 16.0, fontWeight: FontWeight.w500),
                                maxLines: 1,
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                child: AppText(
                                  text: response.overview,
                                  textStyle: Style.roboto(
                                      color: AppColors.desTextColor, size: 12.0, fontWeight: FontWeight.w400),
                                  maxLines: 12,
                                  textAlign: TextAlign.left,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    ],),

                )),

          ],
        );
      }else {
        return Center(
          child: Container(
            child: AppText(
              text: "No detail found",
              textStyle: Style.roboto(
                  color: AppColors.desTextColor, size: 12.0, fontWeight: FontWeight.w400),
              maxLines: 12,
              textAlign: TextAlign.left,
            ),
          ),
        );
      }
    }));
  }

  @override
  void initState() {
    _movieDetailBloc = BlocProvider.of<MovieDetailBloc>(context);
    getMovieDetail();
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light
        //color set to transperent or set your own color
        ));
  }

  void getMovieDetail() {
    if(_movieDetailBloc!=null)_movieDetailBloc.add(FetchMovieDetail(movieId: int.parse(widget.movieId)));
  }
  @override
  void dispose() {
    if(_movieDetailBloc!=null)_movieDetailBloc.close();
    super.dispose();
  }

  BoxDecoration getDecorationBox(String title) {
    var titleLower = title.toLowerCase();
    return titleLower.contains("fantasy")?AppDecoration.boxDecorationF:titleLower.contains("action")? AppDecoration.boxDecorationAction:titleLower.contains("science")?AppDecoration.boxDecorationS:titleLower.contains("thriller")?AppDecoration.boxDecorationT:AppDecoration.boxDecorationAction;
  }
}
