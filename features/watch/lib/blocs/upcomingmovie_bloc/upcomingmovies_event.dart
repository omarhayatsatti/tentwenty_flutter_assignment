part of 'upcomingmovies_bloc.dart';

abstract class UpComingMoviesEvent {}

class FetchUpComingMovies extends UpComingMoviesEvent {
  int page;
  FetchUpComingMovies({this.page});

}