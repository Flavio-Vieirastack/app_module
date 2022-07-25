import 'package:module_test/login_page/data/datasource/login_data_source.dart';
import 'package:module_test/login_page/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;
  LoginRepositoryImpl({required LoginDataSource loginDataSource})
      : _loginDataSource = loginDataSource;
  @override
  void call() {
    _loginDataSource.call();
  }
}
