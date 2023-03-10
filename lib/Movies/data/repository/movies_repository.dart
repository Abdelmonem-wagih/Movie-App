import 'package:movies/Movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies/Movies/domain/entities/movie.dart';
import 'package:movies/Movies/domain/entities/movies_detail.dart';
import 'package:movies/Movies/domain/entities/recommendation.dart';
import 'package:movies/Movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/Movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies/Movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies/core/exception/exception.dart';
import 'package:movies/core/exception/failure.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDatasource baseMovieRemoteDatasource;

  MoviesRepository(this.baseMovieRemoteDatasource);

  @override
  //Either & Right & Left are object from dartz package
  //it used when i went to return two result
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDatasource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
    final result = await baseMovieRemoteDatasource.getPopularMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
    final result = await baseMovieRemoteDatasource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailsParameter parameter) async {
     final result = await baseMovieRemoteDatasource.getMovieDetails(parameter);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async {
   final result = await baseMovieRemoteDatasource.getRecommendation(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
