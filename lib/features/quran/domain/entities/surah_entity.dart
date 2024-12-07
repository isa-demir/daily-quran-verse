import 'package:equatable/equatable.dart';

class SurahEntity extends Equatable {
  const SurahEntity({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.slug,
    required this.verseCount,
    required this.pageNumber,
    required this.nameOriginal,
    required this.audio,
  });

  final int? id;
  final String? name;
  final String? nameEn;
  final String? slug;
  final int? verseCount;
  final int? pageNumber;
  final String? nameOriginal;
  final AudioEntity? audio;

  SurahEntity copyWith({
    int? id,
    String? name,
    String? nameEn,
    String? slug,
    int? verseCount,
    int? pageNumber,
    String? nameOriginal,
    AudioEntity? audio,
  }) {
    return SurahEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEn: nameEn ?? this.nameEn,
      slug: slug ?? this.slug,
      verseCount: verseCount ?? this.verseCount,
      pageNumber: pageNumber ?? this.pageNumber,
      nameOriginal: nameOriginal ?? this.nameOriginal,
      audio: audio ?? this.audio,
    );
  }

  factory SurahEntity.fromJson(Map<String, dynamic> json) {
    return SurahEntity(
      id: json["id"],
      name: json["name"],
      nameEn: json["name_en"],
      slug: json["slug"],
      verseCount: json["verse_count"],
      pageNumber: json["page_number"],
      nameOriginal: json["name_original"],
      audio: json["audio"] == null ? null : AudioEntity.fromJson(json["audio"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_en": nameEn,
        "slug": slug,
        "verse_count": verseCount,
        "page_number": pageNumber,
        "name_original": nameOriginal,
        "audio": audio?.toJson(),
      };

  @override
  List<Object?> get props => [
        id,
        name,
        nameEn,
        slug,
        verseCount,
        pageNumber,
        nameOriginal,
        audio,
      ];
}

class AudioEntity extends Equatable {
  const AudioEntity({
    required this.mp3,
    required this.duration,
    required this.mp3En,
    required this.durationEn,
  });

  final String? mp3;
  final int? duration;
  final String? mp3En;
  final int? durationEn;

  AudioEntity copyWith({
    String? mp3,
    int? duration,
    String? mp3En,
    int? durationEn,
  }) {
    return AudioEntity(
      mp3: mp3 ?? this.mp3,
      duration: duration ?? this.duration,
      mp3En: mp3En ?? this.mp3En,
      durationEn: durationEn ?? this.durationEn,
    );
  }

  factory AudioEntity.fromJson(Map<String, dynamic> json) {
    return AudioEntity(
      mp3: json["mp3"],
      duration: json["duration"],
      mp3En: json["mp3_en"],
      durationEn: json["duration_en"],
    );
  }

  Map<String, dynamic> toJson() => {
        "mp3": mp3,
        "duration": duration,
        "mp3_en": mp3En,
        "duration_en": durationEn,
      };

  @override
  List<Object?> get props => [
        mp3,
        duration,
        mp3En,
        durationEn,
      ];
}
