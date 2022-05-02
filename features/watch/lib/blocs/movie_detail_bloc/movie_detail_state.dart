part of 'movie_detail_bloc.dart';

abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}
class MovieDetailLoading extends MovieDetailState {}
class MovieDetailFinish extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  MovieDetailResponse movieDetailResponse;
  MovieDetailLoaded({this.movieDetailResponse});

}

class MovieDetailError extends MovieDetailState {
  String message;
  int httpStatus=0;
  MovieDetailError({this.message,this.httpStatus});
}


