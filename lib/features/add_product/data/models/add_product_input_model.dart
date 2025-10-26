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

  const AddProductInputModel({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.image,
    required this.isFeatured,
    this.imgUrl,
  });

  AddProductInputModel copyWith({
    String? name,
    num? price,
    String? code,
    String? description,
    File? image,
    bool? isFeatured,
    String? imgUrl,
  }) {
    return AddProductInputModel(
      name: name ?? this.name,
      price: price ?? this.price,
      code: code ?? this.code,
      description: description ?? this.description,
      image: image ?? this.image,
      isFeatured: isFeatured ?? this.isFeatured,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'code': code,
      'description': description,
      'image': image.path,
      'isFeatured': isFeatured,
      'imgUrl': imgUrl,
    };
  }

  factory AddProductInputModel.fromJson(Map<String, dynamic> json) {
    return AddProductInputModel(
      name: json['name'] as String,
      price: json['price'] as num,
      code: json['code'] as String,
      description: json['description'] as String,
      image: File(json['image'] as String),
      isFeatured: json['isFeatured'] as bool,
      imgUrl: json['imgUrl'] != null ? json['imgUrl'] as String : null,
    );
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
    );
  }
}
