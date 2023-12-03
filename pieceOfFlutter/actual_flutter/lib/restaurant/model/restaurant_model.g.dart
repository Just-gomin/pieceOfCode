// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    RestaurantModel(
      id: json['id'] as String,
      thumbUrl: pathToUrl(json['thumbUrl'] as String),
      name: json['name'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      priceRange: $enumDecode(_$RestaurantPiceRangeEnumMap, json['priceRange']),
      ratings: (json['ratings'] as num).toDouble(),
      ratingsCount: json['ratingsCount'] as int,
      deliveryTime: json['deliveryTime'] as int,
      deliveryFee: json['deliveryFee'] as int,
    );

Map<String, dynamic> _$RestaurantModelToJson(RestaurantModel instance) =>
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
    };

const _$RestaurantPiceRangeEnumMap = {
  RestaurantPiceRange.expensive: 'expensive',
  RestaurantPiceRange.medium: 'medium',
  RestaurantPiceRange.cheap: 'cheap',
};
