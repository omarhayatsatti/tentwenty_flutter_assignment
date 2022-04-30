part of 'upcomingmovie_loadmore_bloc.dart';

abstract class UpComingMoviesLoadMoreState {}

class UpComingMoviesLoadMoreInitial extends UpComingMoviesLoadMoreState {}
class UpComingMoviesLoadMoreLoading extends UpComingMoviesLoadMoreState {}
class UpComingMoviesLoadMoreFinish extends UpComingMoviesLoadMoreState {}

class UpComingMoviesLoadMoreLoaded extends UpComingMoviesLoadMoreState {
  UpComingMoviesResponse upComingMoviesResponse;
  UpComingMoviesLoadMoreLoaded({this.upComingMoviesResponse});

}

class UpComingMoviesLoadMoreError extends UpComingMoviesLoadMoreState {
  String message;
  int httpStatus=0;
  UpComingMoviesLoadMoreError({this.message,this.httpStatus});
}


