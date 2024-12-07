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
