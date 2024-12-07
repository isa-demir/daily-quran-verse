class Failure {
  String? message;

  Failure([String message = 'Bir hata olustu!']);
}

class ServerFailure extends Failure {
  ServerFailure([String? message])
      : super(message ?? 'Sunucu hatasi meydana geldi!');
}
