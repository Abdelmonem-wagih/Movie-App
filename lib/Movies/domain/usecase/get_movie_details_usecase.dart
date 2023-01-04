// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies/Movies/domain/entities/movies_detail.dart';
import 'package:movies/Movies/domain/repository/base_movies_repository.dart';
import 'package:movies/core/exception/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(
    this.baseMoviesRepository,
  );

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameter parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameter extends Equatable {
  final int movieId;

  const MovieDetailsParameter({
    required this.movieId,
  });

  @override
  List<Object?> get props => [movieId];
}
