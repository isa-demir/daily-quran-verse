import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthorListModel extends Equatable {
  const AuthorListModel({
    required this.data,
  });

  final List<AuthorModel>? data;

  factory AuthorListModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorListModelToJson(this);

  @override
  List<Object?> get props => [
        data,
      ];
}

@JsonSerializable()
class AuthorModel extends Equatable {
  const AuthorModel({
    required this.id,
    required this.description,
    required this.language,
    required this.name,
    required this.url,
  });

  final int? id;
  final String? description;
  final String? language;
  final String? name;
  final String? url;

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);

  AuthorEntity toEntity() {
    return AuthorEntity(
      id: id,
      description: description,
      language: language,
      name: name,
      url: url,
    );
  }

  @override
  List<Object?> get props => [
        id,
        description,
        language,
        name,
        url,
      ];
}
