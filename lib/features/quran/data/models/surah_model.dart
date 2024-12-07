import 'package:daily_message/features/quran/domain/entities/surah_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'surah_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SurahListModel {
  SurahListModel({
    required this.data,
  });

  final List<SurahModel>? data;

  factory SurahListModel.fromJson(Map<String, dynamic> json) =>
      _$SurahListModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurahListModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SurahModel {
  SurahModel({
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

  @JsonKey(name: 'name_en')
  final String? nameEn;
  final String? slug;

  @JsonKey(name: 'verse_count')
  final int? verseCount;

  @JsonKey(name: 'page_number')
  final int? pageNumber;

  @JsonKey(name: 'name_original')
  final String? nameOriginal;
  final AudioModel? audio;

  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurahModelToJson(this);

  SurahEntity toEntity() {
    return SurahEntity(
      id: id,
      name: name,
      nameEn: nameEn,
      slug: slug,
      verseCount: verseCount,
      pageNumber: pageNumber,
      nameOriginal: nameOriginal,
      audio: audio?.toEntity(),
    );
  }
}

@JsonSerializable()
class AudioModel {
  AudioModel({
    required this.mp3,
    required this.duration,
    required this.mp3En,
    required this.durationEn,
  });

  final String? mp3;
  final int? duration;

  @JsonKey(name: 'mp3_en')
  final String? mp3En;

  @JsonKey(name: 'duration_en')
  final int? durationEn;

  factory AudioModel.fromJson(Map<String, dynamic> json) =>
      _$AudioModelFromJson(json);

  Map<String, dynamic> toJson() => _$AudioModelToJson(this);

  AudioEntity toEntity() {
    return AudioEntity(
      mp3: mp3,
      duration: duration,
      mp3En: mp3En,
      durationEn: durationEn,
    );
  }
}
