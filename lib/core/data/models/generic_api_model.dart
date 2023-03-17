import 'package:json_annotation/json_annotation.dart';

part 'generic_api_model.g.dart';


///
/// It's important to make the endpoints responses with the same structure
///
/// Only [data] can be generic with the type of [T]
///

@JsonSerializable(genericArgumentFactories: true)
class GenericApiResponseModel<T> extends Object {

  @JsonKey(name: 'v')
  int? version;

  @JsonKey(name: 'q')
  String? query;

  @JsonKey(name: 'd')
  T? data;


  GenericApiResponseModel(this.version,this.query,this.data,);

  factory GenericApiResponseModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$GenericApiResponseModelFromJson<T>(json, fromJsonT);

  }

  Map<String, dynamic> toJson(
      Map<String, dynamic> Function(T value) toJsonT,
      ) {
    return _$GenericApiResponseModelToJson<T>(this, toJsonT);
  }
}


