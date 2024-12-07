// ignore_for_file: unnecessary_question_mark

import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
import 'package:daily_message/features/quran/domain/entities/surah_entity.dart';
import 'package:equatable/equatable.dart';

class VerseEntity extends Equatable {
  const VerseEntity({
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
  final SurahEntity? surah;
  final int? verseNumber;
  final String? verse;
  final String? verseSimplified;
  final int? page;
  final int? juzNumber;
  final String? verseWithoutVowel;
  final String? transcription;
  final String? transcriptionEn;
  final TranslationEntity? translation;

  VerseEntity copyWith({
    int? id,
    SurahEntity? surah,
    int? verseNumber,
    String? verse,
    String? verseSimplified,
    int? page,
    int? juzNumber,
    String? verseWithoutVowel,
    String? transcription,
    String? transcriptionEn,
    TranslationEntity? translation,
  }) {
    return VerseEntity(
      id: id ?? this.id,
      surah: surah ?? this.surah,
      verseNumber: verseNumber ?? this.verseNumber,
      verse: verse ?? this.verse,
      verseSimplified: verseSimplified ?? this.verseSimplified,
      page: page ?? this.page,
      juzNumber: juzNumber ?? this.juzNumber,
      verseWithoutVowel: verseWithoutVowel ?? this.verseWithoutVowel,
      transcription: transcription ?? this.transcription,
      transcriptionEn: transcriptionEn ?? this.transcriptionEn,
      translation: translation ?? this.translation,
    );
  }

  factory VerseEntity.fromJson(Map<String, dynamic> json) {
    return VerseEntity(
      id: json["id"],
      surah: json["surah"] == null ? null : SurahEntity.fromJson(json["surah"]),
      verseNumber: json["verse_number"],
      verse: json["verse"],
      verseSimplified: json["verse_simplified"],
      page: json["page"],
      juzNumber: json["juz_number"],
      verseWithoutVowel: json["verse_without_vowel"],
      transcription: json["transcription"],
      transcriptionEn: json["transcription_en"],
      translation: json["translation"] == null
          ? null
          : TranslationEntity.fromJson(json["translation"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah": surah?.toJson(),
        "verse_number": verseNumber,
        "verse": verse,
        "verse_simplified": verseSimplified,
        "page": page,
        "juz_number": juzNumber,
        "verse_without_vowel": verseWithoutVowel,
        "transcription": transcription,
        "transcription_en": transcriptionEn,
        "translation": translation?.toJson(),
      };

  @override
  List<Object?> get props => [
        id,
        surah,
        verseNumber,
        verse,
        verseSimplified,
        page,
        juzNumber,
        verseWithoutVowel,
        transcription,
        transcriptionEn,
        translation,
      ];
}

class TranslationEntity extends Equatable {
  const TranslationEntity({
    required this.id,
    required this.author,
    required this.text,
    required this.footnotes,
  });

  final int? id;
  final AuthorEntity? author;
  final String? text;
  final dynamic footnotes;

  TranslationEntity copyWith({
    int? id,
    AuthorEntity? author,
    String? text,
    dynamic? footnotes,
  }) {
    return TranslationEntity(
      id: id ?? this.id,
      author: author ?? this.author,
      text: text ?? this.text,
      footnotes: footnotes ?? this.footnotes,
    );
  }

  factory TranslationEntity.fromJson(Map<String, dynamic> json) {
    return TranslationEntity(
      id: json["id"],
      author:
          json["author"] == null ? null : AuthorEntity.fromJson(json["author"]),
      text: json["text"],
      footnotes: json["footnotes"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author?.toJson(),
        "text": text,
        "footnotes": footnotes,
      };

  @override
  List<Object?> get props => [
        id,
        author,
        text,
        footnotes,
      ];
}
