import 'package:actual_flutter/common/const/data.dart';
import 'package:actual_flutter/restaurant/model/restaurant_model.dart';

class RestaurantDetailModel extends RestaurantModel {
  /// 음식점 상세 소개
  final String detail;

  /// 음식점 판매 상품 목록
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

  factory RestaurantDetailModel.fromJson({required Map<String, dynamic> json}) {
    return RestaurantDetailModel(
      id: json['id'],
      thumbUrl: 'http://$ip${json['thumbUrl']}',
      name: json['name'],
      tags: List<String>.from(json['tags']),
      priceRange: RestaurantPiceRange.values.firstWhere((element) => element.name == json['priceRange']),
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      deliveryTime: json['deliveryTime'],
      deliveryFee: json['deliveryFee'],
      detail: json['detail'],
      products: List<RestaurantProductModel>.from(json['products'].map(
        (e) => RestaurantProductModel.fromJson(json: e),
      )),
    );
  }
}

/// 음식점에서 판매되는 상품
class RestaurantProductModel {
  final String id;
  final String name;
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

  factory RestaurantProductModel.fromJson({required Map<String, dynamic> json}) {
    return RestaurantProductModel(
      id: json['id'],
      name: json['name'],
      imgUrl: 'http://$ip${json['imgUrl']}',
      detail: json['detail'],
      price: json['price'],
    );
  }
}
