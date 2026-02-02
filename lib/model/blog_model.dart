import 'package:json_annotation/json_annotation.dart';

part 'blog_model.g.dart'; // This tells build_runner where to generate code
@JsonSerializable()
class BlogModel {
  final String id;

  @JsonKey(name: 'user_id')
  final String userId;

  final String title;
  final String content;

  final List<String> category;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'is_public')
  final bool isPublic;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  BlogModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.category,
    required this.imageUrl,
    required this.isPublic,
    required this.createdAt,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlogModelToJson(this);
}
