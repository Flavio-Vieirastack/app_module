import 'package:module_test/home_page/domain/repository/home_repository.dart';
import 'package:module_test/home_page/domain/usecase/home_usecase.dart';

class HomeUsecaseImpl implements HomeUsecase {
  final HomeRepository _homeRepository;
  HomeUsecaseImpl({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;
  @override
  void call() {
    return _homeRepository.call();
  }
}
