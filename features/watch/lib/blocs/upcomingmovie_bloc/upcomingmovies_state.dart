part of 'upcomingmovies_bloc.dart';

abstract class UpComingMoviesState {}

class UpComingMoviesInitial extends UpComingMoviesState {}
class UpComingMoviesLoading extends UpComingMoviesState {}


class UpComingMoviesLoaded extends UpComingMoviesState {
  UpComingMoviesResponse upComingMoviesResponse;
  UpComingMoviesLoaded({this.upComingMoviesResponse});
}


class UpComingMoviesError extends UpComingMoviesState {
  String message;
  int httpStatus=0;
  UpComingMoviesError({this.message,this.httpStatus});
}

