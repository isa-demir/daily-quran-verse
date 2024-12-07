import 'dart:math';

import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
import 'package:daily_message/features/quran/domain/entities/surah_entity.dart';
import 'package:daily_message/features/quran/domain/entities/verse_entity.dart';
import 'package:daily_message/features/quran/domain/usecases/get_authors_usecase.dart';
import 'package:daily_message/features/quran/domain/usecases/get_surahs_usecase.dart';
import 'package:daily_message/features/quran/domain/usecases/get_verse_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(
      this._getAuthorsUsecase, this._getSurahsUsecase, this._getVerseUsecase)
      : super(QuranInitial());
  QuranPageState? _quranPageState;
  final GetAuthorsUsecase _getAuthorsUsecase;
  final GetSurahsUsecase _getSurahsUsecase;
  final GetVerseUsecase _getVerseUsecase;

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
      (surahs) async {
        emit(SurahLoaded(surahs));
        _quranPageState = _quranPageState?.copyWith(surahs: surahs);
        int surahIndex = getRandom(surahs.length);
        var surahEntity = surahs[surahIndex];
        int verseNo = getRandom(surahEntity.verseCount ?? 1);
        await getVerse(
            surahEntity.id!, verseNo, _quranPageState!.selectedAuthor!.id!);
      },
    );
  }

  Future<void> getVerse(int surahId, int verseNo, int authorId) async {
    emit(QuranLoading());
    final res = await _getVerseUsecase.call(surahId, verseNo, authorId);

    res.fold(
      (failrue) => emit(QuranError(failrue.message)),
      (verse) {
        _quranPageState = _quranPageState?.copyWith(verse: verse);
        emit(_quranPageState!);
      },
    );
  }

  int getRandom(int max) {
    var random = Random();
    int randomNumber = random.nextInt(max);
    return randomNumber;
  }
}
