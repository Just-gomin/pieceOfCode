import 'package:actual_flutter/common/function/url.dart';
import 'package:actual_flutter/restaurant/model/restaurant_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_detail_model.g.dart';

@JsonSerializable()
class RestaurantDetailModel extends RestaurantModel {
  /// 음식점 상세 소개
  final String detail;

  /// 음식점 판매 상품 목록
  @JsonKey(fromJson: jsonListToProductList)
  final List<RestaurantProductModel> products;

  RestaurantDetailModel({
    required super.id,
    required super.thumbUrl,
    required super.name,
    required super.tags,
    required super.priceRange,
    required super.ratings,
    required super.ratingsCount,
    required super.deliveryTime,
    required super.deliveryFee,
    required this.detail,
    required this.products,
  });

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) => _$RestaurantDetailModelFromJson(json);
  Map<String, dynamic> toJSon() => _$RestaurantDetailModelToJson(this);

  static jsonListToProductList(List<Map<String, dynamic>> value) {
    return List<RestaurantProductModel>.from(value.map((e) => RestaurantDetailModel.fromJson(e)));
  }
}

/// 음식점에서 판매되는 상품
@JsonSerializable()
class RestaurantProductModel {
  final String id;
  final String name;
  @JsonKey(fromJson: pathToUrl)
  final String imgUrl;
  final String detail;
  final int price;

  RestaurantProductModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.detail,
    required this.price,
  });

  factory RestaurantProductModel.fromJson(Map<String, dynamic> json) => _$RestaurantProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantProductModelToJson(this);
}
