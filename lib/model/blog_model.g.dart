// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  category: (json['category'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  imageUrl: json['image_url'] as String,
  isPublic: json['is_public'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'title': instance.title,
  'content': instance.content,
  'category': instance.category,
  'image_url': instance.imageUrl,
  'is_public': instance.isPublic,
  'created_at': instance.createdAt.toIso8601String(),
};
