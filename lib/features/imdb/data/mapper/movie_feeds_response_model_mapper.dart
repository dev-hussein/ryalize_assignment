

import 'package:ryalize_assignment/features/imdb/data/models/response_model/source_movie_data.dart';
import 'package:ryalize_assignment/features/imdb/domain/entities/movie_data.dart';


///
/// It's important part
///
/// You can get the data for the same page from different sources with different responses structure
/// So every source will return it's response with its' structure
///
/// After that you can map the response and convert to the same entity then this will pass
/// to the presentation layer
///

extension MovieFeedsResponseModelMapper on SourceMovieData {
  MovieData toEntity() => MovieData(
        id: id ?? '',
    image: i == null
        ? null
        : FileData(
      imageUrl: i?.imageUrl ?? '',
      width: i?.width ?? 0,
      height: i?.height ?? 0
    ),
    name: l ?? '',
    description: s ?? '',

      );

}
