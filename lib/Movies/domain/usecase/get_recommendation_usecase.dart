// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies/Movies/domain/entities/recommendation.dart';
import 'package:movies/Movies/domain/repository/base_movies_repository.dart';
import 'package:movies/core/exception/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  
  GetRecommendationUseCase(this.baseMoviesRepository);
  
  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
