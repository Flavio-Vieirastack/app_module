import 'dart:developer';

import 'package:module_test/login_page/data/datasource/login_data_source.dart';

class LoginDataSourceImpl implements LoginDataSource {
  @override
  void call() {
    return log('Login cubit called');
  }
}
