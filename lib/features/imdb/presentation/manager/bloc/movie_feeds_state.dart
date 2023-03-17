
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ryalize_assignment/features/imdb/domain/entities/movie_data.dart';


part 'movie_feeds_state.freezed.dart';


///
/// The states will returned from bloc to the UI
///

@freezed
class MovieStates with _$MovieStates {
  const factory MovieStates.initial() = Initial;

  ///
  /// [isPaginating] used to declare if the loading for the first page or not
  ///
  const factory MovieStates.loading({bool? isPaginating}) = Loading;

  const factory MovieStates.moviesLoaded({required List<MovieData> results}) = MoviesLoaded;

  const factory MovieStates.error({required String message}) = Error;

}