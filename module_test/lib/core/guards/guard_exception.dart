class GuardException implements Exception {
  final Function onError;
  GuardException({required this.onError});
}
