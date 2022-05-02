import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:network/network.dart';
part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MoviesRepositoryImp repository = MoviesRepositoryImp();
  MovieDetailResponse movieDetailResponse;

  MovieDetailBloc() : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
      MovieDetailEvent event,
      ) async* {
   if(event is FetchMovieDetail){
      yield* _mapEventFetchOrdersLoadMoreToState(event);
    }else if(event is MovieDetailFinishEvent){
     yield MovieDetailFinish();
   }
  }

  Stream<MovieDetailState>  _mapEventFetchOrdersLoadMoreToState(
      FetchMovieDetail event,
      ) async* {
    yield MovieDetailLoading();
    try {
      movieDetailResponse = await repository.fetchMovieDetail(event.movieId);
      if (movieDetailResponse!=null && isSuccessState(movieDetailResponse.httpStatus)) {
        yield MovieDetailLoaded(movieDetailResponse: movieDetailResponse);
      } else {
        if(movieDetailResponse!=null) {

            yield MovieDetailError(message: AppConstant.errorMessage,
                httpStatus: movieDetailResponse.httpStatus);
        }else{
          yield MovieDetailError(message: AppConstant.errorMessage);
        }
      }
    } catch (e) {
      yield MovieDetailError(message: e.toString());
    }
  }

}
