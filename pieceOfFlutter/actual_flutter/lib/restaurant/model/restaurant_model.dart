import 'package:actual_flutter/common/function/url.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_model.g.dart';

enum RestaurantPiceRange { expensive, medium, cheap }

@JsonSerializable()
class RestaurantModel {
  final String id;
  @JsonKey(
    fromJson: pathToUrl,
  )
  final String thumbUrl;
  final String name;
  final List<String> tags;
  final RestaurantPiceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel({
    required this.id,
    required this.thumbUrl,
    required this.name,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => _$RestaurantModelFromJson(json);
  Map<String, dynamic> toJSon() => _$RestaurantModelToJson(this);
}
