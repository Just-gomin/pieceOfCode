// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantDetailModel _$RestaurantDetailModelFromJson(
        Map<String, dynamic> json) =>
    RestaurantDetailModel(
      id: json['id'] as String,
      thumbUrl: pathToUrl(json['thumbUrl'] as String),
      name: json['name'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      priceRange: $enumDecode(_$RestaurantPiceRangeEnumMap, json['priceRange']),
      ratings: (json['ratings'] as num).toDouble(),
      ratingsCount: json['ratingsCount'] as int,
      deliveryTime: json['deliveryTime'] as int,
      deliveryFee: json['deliveryFee'] as int,
      detail: json['detail'] as String,
      products: RestaurantDetailModel.jsonListToProductList(
          json['products'] as List<Map<String, dynamic>>),
    );

Map<String, dynamic> _$RestaurantDetailModelToJson(
        RestaurantDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thumbUrl': instance.thumbUrl,
      'name': instance.name,
      'tags': instance.tags,
      'priceRange': _$RestaurantPiceRangeEnumMap[instance.priceRange]!,
      'ratings': instance.ratings,
      'ratingsCount': instance.ratingsCount,
      'deliveryTime': instance.deliveryTime,
      'deliveryFee': instance.deliveryFee,
      'detail': instance.detail,
      'products': instance.products,
    };

const _$RestaurantPiceRangeEnumMap = {
  RestaurantPiceRange.expensive: 'expensive',
  RestaurantPiceRange.medium: 'medium',
  RestaurantPiceRange.cheap: 'cheap',
};

RestaurantProductModel _$RestaurantProductModelFromJson(
        Map<String, dynamic> json) =>
    RestaurantProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imgUrl: pathToUrl(json['imgUrl'] as String),
      detail: json['detail'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$RestaurantProductModelToJson(
        RestaurantProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
      'detail': instance.detail,
      'price': instance.price,
    };
