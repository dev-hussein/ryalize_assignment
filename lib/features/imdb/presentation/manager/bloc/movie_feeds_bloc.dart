import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ryalize_assignment/features/imdb/data/models/request_model/movie_feeds_request.dart';
import 'package:ryalize_assignment/features/imdb/domain/repositories/movie_feeds_repository.dart';

import 'movie_feeds_event.dart';
import 'movie_feeds_state.dart';



@lazySingleton
class MoviesBloc extends Bloc<MoviesEvents, MovieStates> {
  late final MovieFeedsRepository _repository;


  MoviesBloc(this._repository) : super(const MovieStates.initial()) {
    on<GetMovieFeedsEvents>(_getMoviesList);

  }


  ///
  /// Getting the movies items from the data source layer
  ///
  /// [fold] is a good practice to listen on the [Left] or [Right] from [Either]
  ///
  /// Visit https://pub.dev/packages/dartz for more details
  ///


  Future<void> _getMoviesList(GetMovieFeedsEvents events, Emitter emit) async {

    emit(MovieStates.loading(isPaginating : events.page != 1));



    var result = await _repository.getMoviesList(MovieFeedsRequest(searchQuery: events.searchQuery));
    emit(result.fold(
          (failure) =>
              MovieStates.error(message: failure.message),
          (movies) =>
              MovieStates.moviesLoaded(results: movies.items),
    ));

  }

}
