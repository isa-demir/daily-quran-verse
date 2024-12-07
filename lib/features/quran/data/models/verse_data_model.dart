import 'package:daily_message/features/quran/data/models/author_model.dart';
import 'package:daily_message/features/quran/data/models/surah_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verse_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VerseDataModel {
  VerseDataModel({
    required this.data,
  });

  final VerseModel? data;

  factory VerseDataModel.fromJson(Map<String, dynamic> json) =>
      _$VerseDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerseDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VerseModel {
  VerseModel({
    required this.id,
    required this.surah,
    required this.verseNumber,
    required this.verse,
    required this.verseSimplified,
    required this.page,
    required this.juzNumber,
    required this.verseWithoutVowel,
    required this.transcription,
    required this.transcriptionEn,
    required this.translation,
  });

  final int? id;
  final SurahModel? surah;

  @JsonKey(name: 'verse_number')
  final int? verseNumber;
  final String? verse;

  @JsonKey(name: 'verse_simplified')
  final String? verseSimplified;
  final int? page;

  @JsonKey(name: 'juz_number')
  final int? juzNumber;

  @JsonKey(name: 'verse_without_vowel')
  final String? verseWithoutVowel;
  final String? transcription;

  @JsonKey(name: 'transcription_en')
  final String? transcriptionEn;
  final TranslationModel? translation;

  factory VerseModel.fromJson(Map<String, dynamic> json) =>
      _$VerseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TranslationModel {
  TranslationModel({
    required this.id,
    required this.author,
    required this.text,
    required this.footnotes,
  });

  final int? id;
  final AuthorModel? author;
  final String? text;
  final dynamic footnotes;

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      _$TranslationModelFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationModelToJson(this);
}
