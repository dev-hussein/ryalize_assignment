import 'package:equatable/equatable.dart';


///
/// Handle the request parameters for the movies request
///
/// [page] it's the current page you want to request by default "1"
/// [pageSize] the size you want to return by default "10"
/// [searchQuery] what you search for.
///
class MovieFeedsRequest extends Equatable {
  final int page;
  final int pageSize;
  final String searchQuery;

  const MovieFeedsRequest({
    this.page = 1,
    this.pageSize = 10,
    required this.searchQuery,
  });

  @override
  List<Object?> get props =>[page, pageSize, searchQuery];
}
