import 'package:get_it/get_it.dart';
import 'package:movies/Movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies/Movies/data/repository/movies_repository.dart';
import 'package:movies/Movies/domain/repository/base_movies_repository.dart';
import 'package:movies/Movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_toprated_movies_usecase.dart';
import 'package:movies/Movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies/Movies/presentation/controller/movies_bloc.dart';

GetIt sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(
      () => MoviesBloc(sl(), sl(), sl()),
    );

    sl.registerLazySingleton(() => MovieDetailsBloc(sl(), sl()));
    
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    //here we went to add baseMovieRemoteDatasource
    //but now we use SingleTon for create a simple code
    //we replace baseMovieRemoteDatasource => sl()
    //sl() mean it have object from which you went
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    sl.registerLazySingleton<BaseMovieRemoteDatasource>(
        () => MovieRemoteDataSource());
  }
}
