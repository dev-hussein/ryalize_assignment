import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ryalize_assignment/constants/app_string_constants.dart';
import 'package:ryalize_assignment/features/imdb/domain/entities/movie_data.dart';
import 'package:ryalize_assignment/features/imdb/presentation/manager/bloc/movie_feeds_bloc.dart';
import 'package:ryalize_assignment/features/imdb/presentation/manager/bloc/movie_feeds_event.dart';
import 'package:ryalize_assignment/features/imdb/presentation/manager/bloc/movie_feeds_state.dart';
import 'package:ryalize_assignment/features/imdb/presentation/tiles/imdb_movie_tile.dart';
import 'package:ryalize_assignment/utils/localization/app_localization.dart';
import 'package:ryalize_assignment/utils/services/di/injection_container.dart';

class ImdbPage extends StatefulWidget {
  const ImdbPage({Key? key}) : super(key: key);

  @override
  State<ImdbPage> createState() => _PageImdbState();
}

class _PageImdbState extends State<ImdbPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locator<MoviesBloc>().add(GetMovieFeedsEvents(searchQuery: 'game'));
  }


  ///
  /// [maybeWhen] is a good practice to listen on the state returned from the bloc
  /// According to the state you can handle the UI
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizationKeys.kViewImdbText.translate),
      ),

      body: SafeArea(
        child: BlocBuilder<MoviesBloc , MovieStates>(
          bloc: locator<MoviesBloc>(),
            buildWhen: (oldState , newState) =>
            oldState != newState,
            builder: (_ , state){
            return state.maybeWhen(
                orElse: () => _buildError(AppLocalizationKeys.kSomethingWentWrongText.translate),
              loading: (isPaginating) => const Center(
                child: CircularProgressIndicator(),
              ),
              moviesLoaded: (movies) => _buildMovies(movies),
              error: (error) => _buildError(error),
            );

        }),
      ),
    );
  }


  _buildMovies(List<MovieData> movies){
    return ListView.builder(
      itemCount: movies.length,
        shrinkWrap: true,
        itemBuilder: (_ , index){
        return ImdbMovieTile(item: movies.elementAt(index));
    }
    );
  }

  _buildError(String error) {
    return Center(
      child: Text(error),
    );
  }
}
