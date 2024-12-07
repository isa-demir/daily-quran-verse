import 'package:daily_message/core/exceptions/failure.dart';
import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
import 'package:daily_message/features/quran/domain/entities/surah_entity.dart';
import 'package:daily_message/features/quran/domain/entities/verse_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IQuranRepository {
  Future<Either<Failure, List<AuthorEntity>>> getAuthors();
  Future<Either<Failure, List<SurahEntity>>> getSurahs();
  Future<Either<Failure, VerseEntity>> getVerse(
      int surahId, int verseNo, int authorId);
}
