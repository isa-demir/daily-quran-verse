import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable {
  const AuthorEntity({
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

  AuthorEntity copyWith({
    int? id,
    String? description,
    String? language,
    String? name,
    String? url,
  }) {
    return AuthorEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      language: language ?? this.language,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory AuthorEntity.fromJson(Map<String, dynamic> json) {
    return AuthorEntity(
      id: json["id"],
      description: json["description"],
      language: json["language"],
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "language": language,
        "name": name,
        "url": url,
      };

  @override
  List<Object?> get props => [
        id,
        description,
        language,
        name,
        url,
      ];
}
