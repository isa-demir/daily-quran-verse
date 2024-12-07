// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahListModel _$SurahListModelFromJson(Map<String, dynamic> json) =>
    SurahListModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SurahModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurahListModelToJson(SurahListModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

SurahModel _$SurahModelFromJson(Map<String, dynamic> json) => SurahModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      nameEn: json['name_en'] as String?,
      slug: json['slug'] as String?,
      verseCount: (json['verse_count'] as num?)?.toInt(),
      pageNumber: (json['page_number'] as num?)?.toInt(),
      nameOriginal: json['name_original'] as String?,
      audio: json['audio'] == null
          ? null
          : AudioModel.fromJson(json['audio'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SurahModelToJson(SurahModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_en': instance.nameEn,
      'slug': instance.slug,
      'verse_count': instance.verseCount,
      'page_number': instance.pageNumber,
      'name_original': instance.nameOriginal,
      'audio': instance.audio?.toJson(),
    };

AudioModel _$AudioModelFromJson(Map<String, dynamic> json) => AudioModel(
      mp3: json['mp3'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      mp3En: json['mp3_en'] as String?,
      durationEn: (json['duration_en'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AudioModelToJson(AudioModel instance) =>
    <String, dynamic>{
      'mp3': instance.mp3,
      'duration': instance.duration,
      'mp3_en': instance.mp3En,
      'duration_en': instance.durationEn,
    };
