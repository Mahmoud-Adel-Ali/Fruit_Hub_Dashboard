import '../../domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String description;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.description,
  });

  // toJosn
  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
    'rating': rating,
    'date': date,
    'description': description,
  };
  // fromJson
  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    name: json['name'],
    image: json['image'],
    rating: json['rating'],
    date: json['date'],
    description: json['description'],
  );

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) => ReviewModel(
    name: reviewEntity.name,
    image: reviewEntity.image,
    rating: reviewEntity.rating,
    date: reviewEntity.date,
    description: reviewEntity.description,
  );
}
