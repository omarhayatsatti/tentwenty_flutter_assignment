part of 'upcomingmovie_loadmore_bloc.dart';

abstract class UpComingMoviesLoadMoreEvent {}


class FetchUpComingMoviesLoadMore extends UpComingMoviesLoadMoreEvent {
  int page;
  FetchUpComingMoviesLoadMore({this.page});

}
class UpComingMoviesLoadMoreFinishEvent extends UpComingMoviesLoadMoreEvent{}