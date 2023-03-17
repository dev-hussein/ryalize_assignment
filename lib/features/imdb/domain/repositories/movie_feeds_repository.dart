
import 'package:dartz/dartz.dart';
import 'package:ryalize_assignment/core/data/error/failure/failure.dart';
import 'package:ryalize_assignment/core/domain/pagination/movies_page.dart';
import 'package:ryalize_assignment/features/imdb/data/models/request_model/movie_feeds_request.dart';
import 'package:ryalize_assignment/features/imdb/domain/entities/movie_data.dart';

abstract class MovieFeedsRepository {
  Future<Either<Failure, MoviesPage<MovieData>>> getMoviesList(MovieFeedsRequest request);
}
