import 'package:daily_message/core/exceptions/failure.dart';
import 'package:daily_message/features/quran/domain/entities/surah_entity.dart';
import 'package:daily_message/features/quran/domain/repositories/quran_repository.dart';
import 'package:dartz/dartz.dart';

class GetSurahsUsecase {
  final IQuranRepository _quranRepository;

  GetSurahsUsecase(this._quranRepository);

  Future<Either<Failure, List<SurahEntity>>> call() async {
    return await _quranRepository.getSurahs();
  }
}
