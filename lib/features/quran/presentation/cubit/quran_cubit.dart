import 'package:daily_message/features/quran/domain/entities/author_entity.dart';
import 'package:daily_message/features/quran/domain/usecases/get_authors_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this._getAuthorsUsecase) : super(QuranInitial());

  final GetAuthorsUsecase _getAuthorsUsecase;

  Future<void> getAuthors() async {
    emit(QuranLoading());
    final res = await _getAuthorsUsecase.call();

    res.fold(
      (failrue) => emit(QuranError(failrue.message ?? 'hata')),
      (authors) => emit(AuthorLoaded(authors)),
    );
  }
}
