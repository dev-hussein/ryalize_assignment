import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ryalize_assignment/core/data/datasources/utils.dart';
import 'package:ryalize_assignment/core/data/models/generic_api_model.dart';
import 'package:ryalize_assignment/features/imdb/data/models/request_model/movie_feeds_request.dart';
import 'package:ryalize_assignment/features/imdb/data/models/response_model/source_movie_data.dart';
import 'package:ryalize_assignment/features/imdb/data/services/movie_feeds_api_services.dart';
import 'package:ryalize_assignment/utils/services/di/injection_container.dart';
import 'package:ryalize_assignment/utils/services/network/service_manager.dart';


///
/// data source layer witch responsible for getting data from different sources e.g. [Network , Database , ...]
///
/// Add the methods you want to the abstract class and will be override to implementation class
///

abstract class MoviesRemoteDataSource {
  Future<GenericApiResponseModel<List<SourceMovieData>>> getMoviesList(MovieFeedsRequest request);
}

@LazySingleton(as: MoviesRemoteDataSource)
class MovieRemoteDataSourceImpl implements MoviesRemoteDataSource {
  late final MovieFeedsApiServices _apiServices;

  MovieRemoteDataSourceImpl(){
    _apiServices = MovieFeedsApiServices(locator.get<ServiceManger>().networkClient);
  }

  @override
  Future<GenericApiResponseModel<List<SourceMovieData>>> getMoviesList(MovieFeedsRequest request) async =>
      resolveOrThrow(() async => _apiServices.getMoviesList(
          searchQuery: request.searchQuery
        ));



}
