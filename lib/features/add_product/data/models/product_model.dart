import 'dart:io';

import '../../domain/entities/product_entity.dart';
import 'review_model.dart';

class ProductModel {
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
  final List<ReviewModel> reviews;

  const ProductModel({
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

  ProductModel copyWith({
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
    List<ReviewModel>? reviews,
  }) {
    return ProductModel(
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'code': code,
      'description': description,
      'isFeatured': isFeatured,
      'imgUrl': imgUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'numOfCalories': numOfCalories,
      'unitAmount': unitAmount,
      'avarageRating': avarageRating,
      'ratingCount': ratingCount,
      'reviews': reviews.map((item) => item.toJson()).toList(),
    };
  }

  // form AddProductInputEntity to AddProductInputModel
  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      price: entity.price,
      code: entity.code,
      description: entity.description,
      image: entity.image,
      isFeatured: entity.isFeatured,
      imgUrl: entity.imgUrl,
      expirationMonths: entity.expirationMonths,
      isOrganic: entity.isOrganic,
      numOfCalories: entity.numOfCalories,
      unitAmount: entity.unitAmount,
      avarageRating: entity.avarageRating,
      ratingCount: entity.ratingCount,
      reviews: entity.reviews.map((x) => ReviewModel.fromEntity(x)).toList(),
    );
  }
}
