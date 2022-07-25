import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_test/login_page/domain/usecase/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginCubit({
    required LoginUseCase loginUseCase,
  })  : _loginUseCase = loginUseCase,
        super(
          LoginInitial(),
        );

  testMethod() {
    _loginUseCase.call();
  }
}
