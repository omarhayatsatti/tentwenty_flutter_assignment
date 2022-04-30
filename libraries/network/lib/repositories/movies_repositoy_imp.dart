import 'package:core/core.dart';
import 'package:network/network.dart';

import 'interface/movies_repository.dart';

class MoviesRepositoryImp {
  MoviesRepository repository;

  MoviesRepositoryImp() {
    repository = new MoviesRepository(NetworkProvider.instance(),
        baseUrl: 'https://api.themoviedb.org/3');
  }

  Future<UpComingMoviesResponse> fetchUpComingMovies(int page) async {
    var response;
    try {
      response = await repository.fetchUpComingMovies(AppConstant.apiKey,page);;
      response.data['httpStatus'] = response.statusCode;
      return UpComingMoviesResponse.fromJson(response.data);
    } catch (e) {
      if (e.response != null) {
        e.response.data['httpStatus'] = e.response.statusCode;
        return UpComingMoviesResponse.fromJson(e.response.data);
      } else {
        return null;
      }
    }
  }

}
