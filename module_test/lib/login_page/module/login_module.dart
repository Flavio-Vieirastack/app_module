import 'package:module_test/core/app_module/app_module.dart';
import 'package:module_test/home_page/presenter/home_page.dart';
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
                loginDataSource:
                    ContextHelper<LoginDataSource>().getDependency(context),
              ),
            ),
            Provider<LoginUseCase>(
              create: (context) => LoginUseCaseImpl(
                loginRepository:
                    ContextHelper<LoginRepository>().getDependency(context),
              ),
            ),
            Provider<LoginCubit>(
              create: (context) => LoginCubit(
                loginUseCase:
                    ContextHelper<LoginUseCase>().getDependency(context),
              ),
            )
          ],
          routers: {
            '/login': (_) => const LoginPage(),
          },
        );
}
