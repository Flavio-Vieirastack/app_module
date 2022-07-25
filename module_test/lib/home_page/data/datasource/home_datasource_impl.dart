import 'dart:developer';

import 'package:module_test/home_page/data/datasource/home_datasource.dart';

class HomeDatasourceImpl implements HomeDatasource {
  @override
  void call() {
    log('Home cubit called');
  }
}
