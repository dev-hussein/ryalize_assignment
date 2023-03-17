

import 'package:equatable/equatable.dart';


///
/// The events you want to send to the bloc from the pages
///
/// Add the event for every action
///
abstract class MoviesEvents extends Equatable{}


///
/// This event responsible for getting the movies form the bloc
///
class GetMovieFeedsEvents extends MoviesEvents{
  final int page;
  final String searchQuery;
  GetMovieFeedsEvents({required this.searchQuery, this.page=1});
  @override
  List<Object?> get props => [page];
}