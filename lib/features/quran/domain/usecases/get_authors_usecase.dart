import 'package:daily_message/core/exceptions/failure.dart';
import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
import 'package:daily_message/features/quran/domain/repositories/quran_repository.dart';
import 'package:dartz/dartz.dart';

class GetAuthorsUsecase {
  final IQuranRepository _quranRepository;

  GetAuthorsUsecase(this._quranRepository);

  Future<Either<Failure, List<AuthorEntity>>> call() async {
    return await _quranRepository.getAuthors();
  }
}
