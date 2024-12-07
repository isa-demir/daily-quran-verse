// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verse_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerseDataModel _$VerseDataModelFromJson(Map<String, dynamic> json) =>
    VerseDataModel(
      data: json['data'] == null
          ? null
          : VerseModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerseDataModelToJson(VerseDataModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

VerseModel _$VerseModelFromJson(Map<String, dynamic> json) => VerseModel(
      id: (json['id'] as num?)?.toInt(),
      surah: json['surah'] == null
          ? null
          : SurahModel.fromJson(json['surah'] as Map<String, dynamic>),
      verseNumber: (json['verse_number'] as num?)?.toInt(),
      verse: json['verse'] as String?,
      verseSimplified: json['verse_simplified'] as String?,
      page: (json['page'] as num?)?.toInt(),
      juzNumber: (json['juz_number'] as num?)?.toInt(),
      verseWithoutVowel: json['verse_without_vowel'] as String?,
      transcription: json['transcription'] as String?,
      transcriptionEn: json['transcription_en'] as String?,
      translation: json['translation'] == null
          ? null
          : TranslationModel.fromJson(
              json['translation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerseModelToJson(VerseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'surah': instance.surah?.toJson(),
      'verse_number': instance.verseNumber,
      'verse': instance.verse,
      'verse_simplified': instance.verseSimplified,
      'page': instance.page,
      'juz_number': instance.juzNumber,
      'verse_without_vowel': instance.verseWithoutVowel,
      'transcription': instance.transcription,
      'transcription_en': instance.transcriptionEn,
      'translation': instance.translation?.toJson(),
    };

TranslationModel _$TranslationModelFromJson(Map<String, dynamic> json) =>
    TranslationModel(
      id: (json['id'] as num?)?.toInt(),
      author: json['author'] == null
          ? null
          : AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
      text: json['text'] as String?,
      footnotes: json['footnotes'],
    );

Map<String, dynamic> _$TranslationModelToJson(TranslationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author?.toJson(),
      'text': instance.text,
      'footnotes': instance.footnotes,
    };
