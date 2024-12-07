import 'package:daily_message/core/exceptions/failure.dart';
import 'package:daily_message/features/quran/domain/entities/verse_entity.dart';
import 'package:daily_message/features/quran/domain/repositories/quran_repository.dart';
import 'package:dartz/dartz.dart';

class GetVerseUsecase {
  final IQuranRepository _quranRepository;

  GetVerseUsecase(this._quranRepository);

  Future<Either<Failure, VerseEntity>> call(
      int surahId, int verseNo, int athorId) async {
    return await _quranRepository.getVerse(surahId, verseNo, athorId);
  }
}
