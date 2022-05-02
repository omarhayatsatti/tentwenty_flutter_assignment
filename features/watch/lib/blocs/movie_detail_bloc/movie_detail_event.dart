part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent {}


class FetchMovieDetail extends MovieDetailEvent {
  int movieId;
  FetchMovieDetail({this.movieId});

}
class MovieDetailFinishEvent extends MovieDetailEvent{}