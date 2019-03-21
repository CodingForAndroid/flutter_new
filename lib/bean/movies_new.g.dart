// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesNew _$MoviesNewFromJson(Map<String, dynamic> json) {
  return MoviesNew(
      json['count'] as int,
      json['start'] as int,
      json['total'] as int,
      json['title'] as String,
      (json['subjects'] as List)
          .map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList());
}

Map<String, dynamic> _$MoviesNewToJson(MoviesNew instance) => <String, dynamic>{
      'count': instance.count,
      'start': instance.start,
      'total': instance.total,
      'subjects': instance.subjects,
      'title': instance.title
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return Subject(json['title'] as String, json['year'] as String,
      ImageUrl.fromJson(json['images'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'images': instance.images
    };

ImageUrl _$ImageUrlFromJson(Map<String, dynamic> json) {
  return ImageUrl(json['small'] as String, json['large'] as String,
      json['medium'] as String);
}

Map<String, dynamic> _$ImageUrlToJson(ImageUrl instance) => <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
      'medium': instance.medium
    };
