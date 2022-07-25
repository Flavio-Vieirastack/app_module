import 'package:module_test/core/app_module/app_module.dart';
import 'package:module_test/login_page/data/datasource/login_data_source.dart';
import 'package:module_test/login_page/data/datasource/login_data_source_impl.dart';
import 'package:module_test/login_page/data/repository/login_repository_impl.dart';
import 'package:module_test/login_page/domain/repository/login_repository.dart';
import 'package:module_test/login_page/domain/usecase/login_use_case.dart';
import 'package:module_test/login_page/domain/usecase/login_use_case_impl.dart';
import 'package:module_test/login_page/presenter/cubit/login_cubit.dart';
import 'package:module_test/login_page/presenter/login_page.dart';
import 'package:provider/provider.dart';

class LoginModule extends AppModule {
  LoginModule()
      : super(
          dependencies: [
            Provider<LoginDataSource>(
              create: (context) => LoginDataSourceImpl(),
            ),
            Provider<LoginRepository>(
              create: (context) => LoginRepositoryImpl(
                loginDataSource: context.read<LoginDataSource>(),
              ),
            ),
            Provider<LoginUseCase>(
              create: (context) => LoginUseCaseImpl(
                loginRepository: context.read<LoginRepository>(),
              ),
            ),
            Provider<LoginCubit>(
              create: (context) => LoginCubit(
                loginUseCase: context.read<LoginUseCase>(),
              ),
            )
          ],
          routers: {
            '/login': (_) => const LoginPage(),
          },
        );
}
