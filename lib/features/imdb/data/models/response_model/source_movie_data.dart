import 'package:json_annotation/json_annotation.dart'; 

part 'source_movie_data.g.dart';

@JsonSerializable()
class SourceMovieData {
  @JsonKey(name: 'i')
  I? i;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'l')
  String? l;
  @JsonKey(name: 's')
  String? s;

  SourceMovieData({this.i, this.id, this.l, this.s});

   factory SourceMovieData.fromJson(Map<String, dynamic> json) => _$SourceMovieDataFromJson(json);

   Map<String, dynamic> toJson() => _$SourceMovieDataToJson(this);
}

@JsonSerializable()
class I {
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'imageUrl')
  String? imageUrl;
  @JsonKey(name: 'width')
  int? width;

  I({this.height, this.imageUrl, this.width});

   factory I.fromJson(Map<String, dynamic> json) => _$IFromJson(json);

   Map<String, dynamic> toJson() => _$IToJson(this);
}

