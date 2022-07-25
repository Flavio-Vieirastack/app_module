import 'package:module_test/core/app_module/app_module.dart';
import 'package:module_test/home_page/data/datasource/home_datasource_impl.dart';
import 'package:module_test/home_page/data/repository/home_repository_impl.dart';
import 'package:module_test/home_page/domain/usecase/home_usecase_impl.dart';
import 'package:module_test/home_page/presenter/cubit/home_cubit.dart';
import 'package:module_test/home_page/presenter/home_page.dart';
import 'package:provider/provider.dart';

class HomeModule extends AppModule {
  HomeModule()
      : super(
          dependencies: [
            Provider(
              create: (context) => HomeDatasourceImpl(),
            ),
            Provider(
              create: (context) => HomeRepositoryImpl(
                homeDatasource: context.read<HomeDatasourceImpl>(),
              ),
            ),
            Provider(
              create: (context) => HomeUsecaseImpl(
                homeRepository: context.read<HomeRepositoryImpl>(),
              ),
            ),
            Provider(
              create: (context) => HomeCubit(
                homeUsecase: context.read<HomeUsecaseImpl>(),
              ),
            ),
          ],
          routers: {
            '/home': (_) => const HomePage(),
          },
        );
}
