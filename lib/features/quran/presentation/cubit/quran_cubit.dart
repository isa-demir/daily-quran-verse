import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
import 'package:daily_message/features/quran/domain/entities/surah_entity.dart';
import 'package:daily_message/features/quran/domain/usecases/get_authors_usecase.dart';
import 'package:daily_message/features/quran/domain/usecases/get_surahs_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this._getAuthorsUsecase, this._getSurahsUsecase)
      : super(QuranInitial());
  QuranPageState? _quranPageState;
  final GetAuthorsUsecase _getAuthorsUsecase;
  final GetSurahsUsecase _getSurahsUsecase;

  Future<void> getAuthors() async {
    emit(QuranLoading());
    final res = await _getAuthorsUsecase.call();

    res.fold(
      (failrue) => emit(QuranError(failrue.message)),
      (authors) async {
        emit(AuthorLoaded(authors));
        _quranPageState =
            QuranPageState(authors: authors, selectedAuthor: authors.first);
        await getSurahs();
      },
    );
  }

  Future<void> getSurahs() async {
    emit(QuranLoading());
    final res = await _getSurahsUsecase.call();

    res.fold(
      (failrue) => emit(QuranError(failrue.message)),
      (surahs) {
        emit(SurahLoaded(surahs));
        _quranPageState = _quranPageState?.copyWith(surahs: surahs);
      },
    );
  }
}
