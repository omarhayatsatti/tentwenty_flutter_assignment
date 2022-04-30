import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:network/network.dart';
part 'upcomingmovie_loadmore_event.dart';
part 'upcomingmovie_loadmore_state.dart';

class UpComingMoviesLoadMoreBloc extends Bloc<UpComingMoviesLoadMoreEvent, UpComingMoviesLoadMoreState> {
  MoviesRepositoryImp repository = MoviesRepositoryImp();
  UpComingMoviesResponse upComingMoviesResponse;

  UpComingMoviesLoadMoreBloc() : super(UpComingMoviesLoadMoreInitial());

  @override
  Stream<UpComingMoviesLoadMoreState> mapEventToState(
      UpComingMoviesLoadMoreEvent event,
      ) async* {
   if(event is FetchUpComingMoviesLoadMore){
      yield* _mapEventFetchOrdersLoadMoreToState(event);
    }else if(event is UpComingMoviesLoadMoreFinishEvent){
     yield UpComingMoviesLoadMoreFinish();
   }
  }

  Stream<UpComingMoviesLoadMoreState>  _mapEventFetchOrdersLoadMoreToState(
      FetchUpComingMoviesLoadMore event,
      ) async* {
    yield UpComingMoviesLoadMoreLoading();
    try {
      upComingMoviesResponse = await repository.fetchUpComingMovies(event.page);
      if (upComingMoviesResponse!=null && isSuccessState(upComingMoviesResponse.httpStatus)) {
        yield UpComingMoviesLoadMoreLoaded(upComingMoviesResponse: upComingMoviesResponse);
      } else {
        if(upComingMoviesResponse!=null) {

            yield UpComingMoviesLoadMoreError(message: AppConstant.errorMessage,
                httpStatus: upComingMoviesResponse.httpStatus);
        }else{
          yield UpComingMoviesLoadMoreError(message: AppConstant.errorMessage);
        }
      }
    } catch (e) {
      yield UpComingMoviesLoadMoreError(message: e.toString());
    }
  }

}
