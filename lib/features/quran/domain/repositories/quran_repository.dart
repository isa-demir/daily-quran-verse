import 'package:daily_message/core/exceptions/failure.dart';
import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IQuranRepository {
  Future<Either<Failure, List<AuthorEntity>>> getAuthors();
}
