import 'package:daily_message/features/quran/data/datasources/quran_remote_datasource.dart';
import 'package:daily_message/features/quran/data/repositories/quran_repository_impl.dart';
import 'package:daily_message/features/quran/domain/repositories/quran_repository.dart';
import 'package:daily_message/features/quran/domain/usecases/get_authors_usecase.dart';
import 'package:daily_message/features/quran/domain/usecases/get_surahs_usecase.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initLocator() {
  // DataSources
  locator.registerLazySingleton<IQuranDatasource>(
    () => QuranRemoteDataSource(),
  );

  // Repositories
  locator.registerLazySingleton<IQuranRepository>(
    () => QuranRepositoryImpl(locator()),
  );

  // Usrcases
  locator.registerLazySingleton<GetAuthorsUsecase>(
    () => GetAuthorsUsecase(locator()),
  );
  locator.registerLazySingleton<GetSurahsUsecase>(
    () => GetSurahsUsecase(locator()),
  );
}
