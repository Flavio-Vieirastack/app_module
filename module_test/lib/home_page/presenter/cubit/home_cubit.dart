import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_test/home_page/domain/usecase/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUsecase _homeUsecase;
  HomeCubit({required HomeUsecase homeUsecase})
      : _homeUsecase = homeUsecase,
        super(
          HomeInitial(),
        );
  void callUseCase() {
    _homeUsecase.call();
  }
}
