import 'package:module_test/login_page/domain/repository/login_repository.dart';
import 'package:module_test/login_page/domain/usecase/login_use_case.dart';

class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepository _loginRepository;
  LoginUseCaseImpl({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;
  @override
  void call() {
    return _loginRepository.call();
  }
}
