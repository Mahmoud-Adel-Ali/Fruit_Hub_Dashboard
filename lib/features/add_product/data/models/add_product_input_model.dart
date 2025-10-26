// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io' show File;

import '../../domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
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

  const AddProductInputModel({
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
  });

  AddProductInputModel copyWith({
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
  }) {
    return AddProductInputModel(
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
    };
  }

  // form AddProductInputEntity to AddProductInputModel
  factory AddProductInputModel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputModel(
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
    );
  }
}
