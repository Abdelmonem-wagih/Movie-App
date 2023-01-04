import 'package:dartz/dartz.dart';
import 'package:movies/Movies/domain/entities/movie.dart';
import 'package:movies/Movies/domain/entities/movies_detail.dart';
import 'package:movies/Movies/domain/entities/recommendation.dart';
import 'package:movies/Movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_recommendation_usecase.dart';
import '../../../core/exception/failure.dart';

abstract class BaseMoviesRepository {

  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure , MovieDetail>> getMovieDetails(MovieDetailsParameter parameter);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
    RecommendationParameters parameters
  );
  

}
