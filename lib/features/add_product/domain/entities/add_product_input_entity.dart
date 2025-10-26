// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io' show File;

class AddProductInputEntity {
  final String name;
  final num price;
  final String code;
  final String description;
  final File image;
  final bool isFeatured;
  final String? imgUrl;

  const AddProductInputEntity({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.image,
    required this.isFeatured,
    this.imgUrl,
  });

  AddProductInputEntity copyWith({
    String? name,
    num? price,
    String? code,
    String? description,
    File? image,
    bool? isFeatured,
    String? imgUrl,
  }) {
    return AddProductInputEntity(
      name: name ?? this.name,
      price: price ?? this.price,
      code: code ?? this.code,
      description: description ?? this.description,
      image: image ?? this.image,
      isFeatured: isFeatured ?? this.isFeatured,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }
}
