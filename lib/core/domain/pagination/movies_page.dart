import 'package:equatable/equatable.dart';


///
/// Carry the movie requests result from network layer to the presentation layer
///

class MoviesPage<T> extends Equatable {
  final List<T> items;
  final bool isLastPage;
  final int? total;
  final int page;

  const MoviesPage({
    required this.items,
    this.isLastPage = false,
    this.total,
    this.page = 1,
  });

  @override
  List<Object> get props => [isLastPage, page, items];

  MoviesPage<T> copyWith({
    List<T>? items,
    bool? isLastPage,
    int? total,
    int? page,
  }) =>
      MoviesPage<T>(
        items: items ?? this.items,
        page: page ?? this.page,
        total: total ?? this.total,
        isLastPage: isLastPage ?? this.isLastPage,
      );
}
