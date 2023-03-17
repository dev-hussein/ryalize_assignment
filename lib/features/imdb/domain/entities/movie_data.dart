import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


///
/// This is the entity will return to presentation layer
///

class MovieData extends Equatable{

  final FileData? image;

  final String id;

  final String name;

  final String description;

  const MovieData({required this.image,required this.id,required this.name,required this.description});


  @override
  // TODO: implement props
  List<Object?> get props => [image, id, name , description];
}

@JsonSerializable()
class FileData extends Equatable{

  final String imageUrl;
  final int height;
  final int width;

  const FileData({required this.height, required this.imageUrl, required this.width});

  @override
  // TODO: implement props
  List<Object?> get props => [height, width, imageUrl];

}

