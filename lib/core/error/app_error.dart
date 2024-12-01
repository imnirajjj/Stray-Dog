abstract class AppError implements Exception {}

class InternalAppError extends AppError {

  InternalAppError({
    this.message = 'An Error Occurred',
  });
  final String message;
}

class NetworkError extends AppError {}
