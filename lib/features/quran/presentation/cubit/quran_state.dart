part of 'quran_cubit.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class AuthorLoaded extends QuranState {
  final List<AuthorEntity> authors;

  const AuthorLoaded(this.authors);

  @override
  List<Object> get props => [authors];
}

class QuranError extends QuranState {
  final String errMsg;

  const QuranError(this.errMsg);

  @override
  List<Object> get props => [errMsg];
}

class SurahLoaded extends QuranState {
  final List<SurahEntity> surahs;

  const SurahLoaded(this.surahs);

  @override
  List<Object> get props => [surahs];
}

class QuranPageState extends QuranState {
  final List<AuthorEntity>? authors;
  final AuthorEntity? selectedAuthor;
  final List<SurahEntity>? surahs;

  const QuranPageState({
    this.selectedAuthor,
    this.authors,
    this.surahs,
  });

  QuranPageState copyWith({
    List<AuthorEntity>? authors,
    AuthorEntity? selectedAuthor,
    List<SurahEntity>? surahs,
  }) {
    return QuranPageState(
      authors: authors ?? this.authors,
      selectedAuthor: selectedAuthor ?? this.selectedAuthor,
      surahs: surahs ?? this.surahs,
    );
  }
}
