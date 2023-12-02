import "package:actual_flutter/common/const/colors.dart";
import "package:actual_flutter/common/const/data.dart";
import "package:actual_flutter/common/layout/default_layout.dart";
import "package:actual_flutter/product/component/product_card.dart";
import "package:actual_flutter/restaurant/component/restaurant_card.dart";
import "package:actual_flutter/restaurant/model/restaurant_detail_model.dart";
import "package:dio/dio.dart";
import "package:flutter/material.dart";

class RestaurantDetailScreen extends StatelessWidget {
  final String id;

  const RestaurantDetailScreen({
    super.key,
    required this.id,
  });

  Future<Map<String, dynamic>> getRestaurantDetail() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get(
      'http://$ip/restaurant/$id',
      options: Options(headers: {
        'authorization': 'Bearer $accessToken',
      }),
    );

    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: "불타는 떡볶이",
        child: FutureBuilder<Map<String, dynamic>>(
          future: getRestaurantDetail(),
          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: PRIMARY_COLOR,
                ),
              );
            }
            final restaurantDetail = RestaurantDetailModel.fromJson(json: snapshot.data!);

            return CustomScrollView(
              slivers: [
                renderTop(restaurantDetail: restaurantDetail),
                renderLabel(),
                renderProducts(products: restaurantDetail.products),
              ],
            );
          },
        ));
  }

  SliverToBoxAdapter renderTop({required RestaurantDetailModel restaurantDetail}) {
    return SliverToBoxAdapter(
      child: RestaurantCard(
        image: Image.network(restaurantDetail.thumbUrl),
        name: restaurantDetail.name,
        tags: restaurantDetail.tags,
        ratingsCount: restaurantDetail.ratingsCount,
        deliveryTime: restaurantDetail.deliveryTime,
        deliveryFee: restaurantDetail.deliveryFee,
        ratings: restaurantDetail.ratings,
        isDetail: true,
        detail: restaurantDetail.detail,
      ),
    );
  }

  SliverPadding renderLabel() {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          "메뉴",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  SliverPadding renderProducts({required List<RestaurantProductModel> products}) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final RestaurantProductModel product = products[index];

            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ProductCard.fromModel(
                model: product,
              ),
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }
}
