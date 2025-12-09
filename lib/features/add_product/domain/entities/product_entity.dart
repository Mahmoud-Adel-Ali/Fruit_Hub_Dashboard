import 'dart:io' show File;

import 'review_entity.dart';

class ProductEntity {
  final String name;
  final num price;
  final String code;
  final String description;
  final File image;
  final bool isFeatured;
  final String? imgUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numOfCalories;
  final int unitAmount;
  final num avarageRating;
  final int ratingCount;
  final List<ReviewEntity> reviews;

  const ProductEntity({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.image,
    required this.isFeatured,
    this.imgUrl,
    required this.expirationMonths,
    required this.isOrganic,
    required this.numOfCalories,
    required this.unitAmount,
    this.avarageRating = 0,
    this.ratingCount = 0,
    this.reviews = const [],
  });

  ProductEntity copyWith({
    String? name,
    num? price,
    String? code,
    String? description,
    File? image,
    bool? isFeatured,
    String? imgUrl,
    int? expirationMonths,
    bool? isOrganic,
    int? numOfCalories,
    int? unitAmount,
    num? avarageRating,
    int? ratingCount,
    List<ReviewEntity>? reviews,
  }) {
    return ProductEntity(
      name: name ?? this.name,
      price: price ?? this.price,
      code: code ?? this.code,
      description: description ?? this.description,
      image: image ?? this.image,
      isFeatured: isFeatured ?? this.isFeatured,
      imgUrl: imgUrl ?? this.imgUrl,
      expirationMonths: expirationMonths ?? this.expirationMonths,
      isOrganic: isOrganic ?? this.isOrganic,
      numOfCalories: numOfCalories ?? this.numOfCalories,
      unitAmount: unitAmount ?? this.unitAmount,
      avarageRating: avarageRating ?? this.avarageRating,
      ratingCount: ratingCount ?? this.ratingCount,
      reviews: reviews ?? this.reviews,
    );
  }
}
