import 'package:daily_message/core/exceptions/failure.dart';
import 'package:daily_message/features/quran/data/datasources/quran_remote_datasource.dart';
import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
import 'package:daily_message/features/quran/domain/entities/surah_entity.dart';
import 'package:daily_message/features/quran/domain/entities/verse_entity.dart';
import 'package:daily_message/features/quran/domain/repositories/quran_repository.dart';
import 'package:dartz/dartz.dart';

class QuranRepositoryImpl implements IQuranRepository {
  final IQuranDatasource _quranRemoteDatasource;

  QuranRepositoryImpl(this._quranRemoteDatasource);

  @override
  Future<Either<Failure, List<AuthorEntity>>> getAuthors() async {
    try {
      final resp = await _quranRemoteDatasource.getAuthors();

      if (resp.data != null) {
        final authors = resp.data!.map((e) => e.toEntity()).toList();
        return Right(authors);
      } else {
        return Left(Failure(message: 'Yazarlar yuklenemedi!'));
      }
    } catch (e) {
      return Left(Failure(message: 'Hata :${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<SurahEntity>>> getSurahs() async {
    try {
      final resp = await _quranRemoteDatasource.getSurahs();

      if (resp.data != null) {
        final surahs = resp.data!.map((e) => e.toEntity()).toList();
        return Right(surahs);
      } else {
        return Left(Failure(message: 'Sureler yuklenemedi!'));
      }
    } catch (e) {
      return Left(Failure(message: 'Hata :${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, VerseEntity>> getVerse(
      int surahId, int verseNo, int authorId) async {
    try {
      final resp =
          await _quranRemoteDatasource.getVerse(surahId, verseNo, authorId);

      if (resp.data != null) {
        final verse = resp.data!.toEntity();
        return Right(verse);
      } else {
        return Left(Failure(message: 'Ayet yuklenemedi!'));
      }
    } catch (e) {
      return Left(Failure(message: 'Hata :${e.toString()}'));
    }
  }
}
