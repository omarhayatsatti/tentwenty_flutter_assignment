import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';
import 'package:network/network.dart';
import 'package:widgets/text.dart';
import 'package:widgets/widgets.dart';
import 'package:values/values.dart';
import '../blocs/upcomingmovie_bloc/upcomingmovies_bloc.dart';
import '../blocs/upcomingmovie_loadmore_bloc/upcomingmovie_loadmore_bloc.dart';

class WatchPage extends StatefulWidget {
  @override
  WatchPageState createState() => WatchPageState();
}

class WatchPageState extends State<WatchPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<UpComingMoviesBloc>(
        create: (context) => UpComingMoviesBloc(),
      ),
      BlocProvider<UpComingMoviesLoadMoreBloc>(
        create: (context) => UpComingMoviesLoadMoreBloc(),
      ),
    ], child: WatchPageView());
  }
}

class WatchPageView extends StatefulWidget {
  @override
  _WatchPageViewState createState() => _WatchPageViewState();
}

class _WatchPageViewState extends State<WatchPageView>
    with TickerProviderStateMixin {
  UpComingMoviesBloc _upComingMoviesBloc;
  UpComingMoviesLoadMoreBloc _upComingMoviesLoadMoreBloc;
  List<Results> results = [];
  ScrollController controllerActive;
  bool isLoading = false;
  int page = 1;
  int totalPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<UpComingMoviesBloc, UpComingMoviesState>(
            listener: (context, state) {
          // if(state is ActiveOrderError){
          //   showDialogMessage(message: state.message,context: context);
          // }
        }, builder: (context, state) {
          if (state is UpComingMoviesLoading) {
            return Column(children: [
              Expanded(
                child: LoadingDots(),
              )
            ]);
          } else if (state is UpComingMoviesLoaded) {
            if (state.upComingMoviesResponse.results != null &&
                state.upComingMoviesResponse.results.length != 0) {
              if (results.isEmpty) {
                results.addAll(state.upComingMoviesResponse.results);
              }
              page++;
              totalPage = state.upComingMoviesResponse.totalPages;
              return Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: AppColors.white,
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 10,
                            child: AppText(
                              text: 'Watch',
                              textStyle: Style.roboto(
                                  color: AppColors.navyBlueColor,
                                  size: 16.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: SvgWidget(
                              imgPath: Assets.ic_search,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      color: AppColors.lightGreyColor,
                      child: RefreshIndicator(
                          child: ListView.builder(
                              controller: controllerActive,
                              itemCount: results.length,
                              itemBuilder: (BuildContext context, int index) {
                                var response = results[index];
                                return InkWell(
                                  onTap: ()=>moveToMovieDetailPage(movieId: response.id.toString()),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: getScreenHeight(context) * 0.30,
                                        margin: EdgeInsets.only(
                                            left: 12.0, right: 15.0, top: 20.0),
                                        width: getScreenWidth(context),
                                        child: Hero(
                                          tag: 'bannerHeader${response.id}',
                                          child: NetworkImageService(
                                            fit: BoxFit.cover,
                                            imageUrl: response.posterPath != null
                                                ? ApiConstant.baseUrlImage +
                                                    response.posterPath
                                                : "https://cdn.pixabay.com/photo/2019/04/24/21/55/cinema-4153289__340.jpg",
                                            isMovieDetailPage: true,
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
                                      ),
                                      Positioned(
                                          bottom: 20,
                                          left: 30,
                                          right: 10,
                                          child: AppText(
                                            text: response.title,
                                            textStyle: Style.roboto(
                                                color: AppColors.white,
                                                size: 18.0,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 2,
                                            textAlign: TextAlign.left,
                                          )),
                                    ],
                                  ),
                                );
                              }),
                          onRefresh: _refreshMarketList),
                    ),
                  ),
                  BlocConsumer<UpComingMoviesLoadMoreBloc,
                          UpComingMoviesLoadMoreState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is UpComingMoviesLoadMoreLoading) {
                          return LoadingDots();
                        }
                        if (state is UpComingMoviesLoadMoreLoaded) {
                          updateList(state.upComingMoviesResponse,
                              state.upComingMoviesResponse.httpStatus);
                          BlocProvider.of<UpComingMoviesLoadMoreBloc>(context)
                              .add(UpComingMoviesLoadMoreFinishEvent());
                          return Container();
                        }
                        return Container();
                      }),
                ],
              );
              ;
            } else {
              return Container(
                child: AppText(text: "no movie found"),
              );
            }
          } else {
            return Container();
          }
        }),
      ),
    );
  }

  updateList(UpComingMoviesResponse upComingMoviesResponse, int statusCode) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (upComingMoviesResponse.results.length != 0) {
          this.results.addAll(upComingMoviesResponse.results);
          controllerActive
              .jumpTo(controllerActive.position.maxScrollExtent + 200);
          //page++;
        }
        this.isLoading = false;
      });
    });
  }

  void _scrollListener() {
    if (!isLoading &&
        controllerActive.position.pixels ==
            controllerActive.position.maxScrollExtent &&
        page <= totalPage) {
      isLoading = true;
      _upComingMoviesLoadMoreBloc.add(FetchUpComingMoviesLoadMore(page: page));
    }
  }

  @override
  void initState() {
    _upComingMoviesBloc = BlocProvider.of<UpComingMoviesBloc>(context);
    _upComingMoviesLoadMoreBloc =
        BlocProvider.of<UpComingMoviesLoadMoreBloc>(context);
    controllerActive = new ScrollController()..addListener(_scrollListener);
    getUpComingMoviesList();
    super.initState();
  }

  getUpComingMoviesList() {
    _upComingMoviesBloc.add(FetchUpComingMovies(page: page));
  }

  Future<void> _refreshMarketList() async {
    results.clear();
    page = 1;
    totalPage = 1;
    _upComingMoviesBloc.add(FetchUpComingMovies(page: page));
  }

  moveToMovieDetailPage({String movieId}) {
      Application.router.navigateTo(
        context,
        "${Routes.movieDetailPage}${"/"}${movieId}",
        transition: TransitionType.inFromLeft,
      );

  }
}
