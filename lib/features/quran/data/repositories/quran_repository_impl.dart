import 'package:daily_message/core/exceptions/failure.dart';
import 'package:daily_message/features/quran/data/datasources/quran_remote_datasource.dart';
import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
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
        final authors =
            resp.data!.map((e) => AuthorEntity.fromJson(e.toJson())).toList();
        return Right(authors);
      } else {
        return Left(Failure('Yazarlar yuklenemedi!'));
      }
    } catch (e) {
      return Left(Failure('Hata :${e.toString()}'));
    }
  }
}
