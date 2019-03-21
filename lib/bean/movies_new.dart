import 'package:json_annotation/json_annotation.dart';

part 'movies_new.g.dart';
//尝试使用json_serializable 序列化 反序列化 https://pub.dartlang.org/packages/json_serializable
@JsonSerializable(nullable: false)
class MoviesNew {
  int count;
  int start;
  int total;
  List<Subject> subjects;
  String title;
  MoviesNew(this.count,this.start,this.total,this.title,List<Subject> subjects)
  :subjects = subjects?? <Subject>[];

  factory MoviesNew.fromJson(Map<String, dynamic> json) =>_$MoviesNewFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesNewToJson(this);
}
@JsonSerializable(nullable: false)
class Subject {

  String title;
  String year;
  ImageUrl images;

  Subject(this.title,this.year,this.images);

  factory Subject.fromJson(Map<String, dynamic> json) =>_$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
@JsonSerializable(nullable: false)
class ImageUrl {

  String small;
  String large;
  String medium;

  ImageUrl(this.small,this.large,this.medium);


  factory ImageUrl.fromJson(Map<String, dynamic> json) =>_$ImageUrlFromJson(json);
  Map<String, dynamic> toJson() => _$ImageUrlToJson(this);
}
