
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ryalize_assignment/core/data/error/failure/failure.dart';
import 'package:ryalize_assignment/core/domain/pagination/movies_page.dart';
import 'package:ryalize_assignment/features/imdb/data/data_source/movies_remote_data_source.dart';
import 'package:ryalize_assignment/features/imdb/data/mapper/movie_feeds_response_model_mapper.dart';
import 'package:ryalize_assignment/features/imdb/data/models/request_model/movie_feeds_request.dart';
import 'package:ryalize_assignment/features/imdb/data/models/response_model/source_movie_data.dart';
import 'package:ryalize_assignment/features/imdb/domain/entities/movie_data.dart';
import 'package:ryalize_assignment/features/imdb/domain/repositories/movie_feeds_repository.dart';


///
/// The repository for the requests you need to request
///
@LazySingleton(as: MovieFeedsRepository)
class MovieFeedsRepositoryImpl implements MovieFeedsRepository {
  final MoviesRemoteDataSource _feedRemoteDataSource;

  MovieFeedsRepositoryImpl(this._feedRemoteDataSource) ;


  ///
  /// [Either] is a good practice to return the result or the failure according to the response
  ///
  /// [Right] for the result
  /// [Left] for the failure
  ///
  /// Visit https://pub.dev/packages/dartz for more details
  ///

  @override
  Future<Either<Failure, MoviesPage<MovieData>>> getMoviesList(
      MovieFeedsRequest request) async {
    try {
      final result = await _feedRemoteDataSource.getMoviesList(request);
      final videoPage = MoviesPage<MovieData>(
        items: result.data?.map((e) => e.toEntity()).toList() ?? [],
      );
      return Right(videoPage);
    } on Exception catch (e) {
      return Left(dioExceptionsDecoder(e));
    }
  }
}
