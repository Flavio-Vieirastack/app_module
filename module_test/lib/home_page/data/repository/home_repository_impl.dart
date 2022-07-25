import 'package:module_test/home_page/data/datasource/home_datasource.dart';
import 'package:module_test/home_page/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource _homeDatasource;
  HomeRepositoryImpl({required HomeDatasource homeDatasource})
      : _homeDatasource = homeDatasource;
  @override
  void call() {
    return _homeDatasource.call();
  }
}
