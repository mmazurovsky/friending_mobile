class CustomAuthException implements Exception {
  final String message;
  CustomAuthException(this.message);
}

class CustomNoInternetException implements Exception {
  final String message;
  CustomNoInternetException(this.message);
}

class CustomServerErrorException implements Exception {
  final String message;
  CustomServerErrorException(this.message);
}