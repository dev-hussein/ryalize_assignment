
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:ryalize_assignment/constants/api_constants.dart';
import 'package:ryalize_assignment/core/data/models/generic_api_model.dart';
import 'package:ryalize_assignment/features/imdb/data/models/response_model/source_movie_data.dart';

part 'movie_feeds_api_services.g.dart';


///
/// This is the services you want to request from the network layer
///

@RestApi(baseUrl: ApiConstants.baseLink)
abstract class MovieFeedsApiServices {
  factory MovieFeedsApiServices(Dio dio) = _MovieFeedsApiServices;

  @GET(ApiConstants.methodAutoComplete)
  Future<GenericApiResponseModel<List<SourceMovieData>>> getMoviesList({
     @Query(ParametersConstants.kSearchQuery) required String searchQuery,
  });


}
