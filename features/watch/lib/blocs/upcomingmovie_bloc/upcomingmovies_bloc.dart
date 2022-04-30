import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:network/network.dart';
part 'upcomingmovies_event.dart';
part 'upcomingmovies_state.dart';

class UpComingMoviesBloc extends Bloc<UpComingMoviesEvent, UpComingMoviesState> {
  MoviesRepositoryImp repository = MoviesRepositoryImp();
  UpComingMoviesResponse upComingMoviesResponse;
  UpComingMoviesBloc() : super(UpComingMoviesInitial());

  @override
  Stream<UpComingMoviesState> mapEventToState(
      UpComingMoviesEvent event,
      ) async* {
    if (event is FetchUpComingMovies) {
      yield* _mapEventFetchOrdersToState(event);
    }
  }



  Stream<UpComingMoviesState>_mapEventFetchOrdersToState(
      FetchUpComingMovies event,
      ) async* {
    yield UpComingMoviesLoading();
    try {
      upComingMoviesResponse = await repository.fetchUpComingMovies(event.page);
      if (upComingMoviesResponse!=null && isSuccessState(upComingMoviesResponse.httpStatus)) {
        yield  UpComingMoviesLoaded(upComingMoviesResponse: upComingMoviesResponse);
      } else {
        if(upComingMoviesResponse!=null) {
            yield UpComingMoviesError(message:AppConstant.errorMessage,httpStatus: 0);

        }else{
          yield UpComingMoviesError(message: AppConstant.errorMessage);
        }
      }
    } catch (e) {
      yield UpComingMoviesError(message: AppConstant.errorMessage,httpStatus: 0);
    }
  }
}
