import 'package:module_test/core/app_module/app_module.dart';
import 'package:module_test/home_page/data/datasource/home_datasource.dart';
import 'package:module_test/home_page/data/datasource/home_datasource_impl.dart';
import 'package:module_test/home_page/data/repository/home_repository_impl.dart';
import 'package:module_test/home_page/domain/repository/home_repository.dart';
import 'package:module_test/home_page/domain/usecase/home_usecase.dart';
import 'package:module_test/home_page/domain/usecase/home_usecase_impl.dart';
import 'package:module_test/home_page/permanent_class_home_module.dart';
import 'package:module_test/home_page/presenter/cubit/home_cubit.dart';
import 'package:module_test/home_page/presenter/home_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class HomeModule extends AppModule {
  HomeModule()
      : super(
          dependencies: [
            Provider<HomeDatasource>(
              create: (context) => HomeDatasourceImpl(),
            ),
            Provider<HomeRepository>(
              create: (context) => HomeRepositoryImpl(
                homeDatasource:
                    AppInject<HomeDatasource>().getDependency(context),
              ),
            ),
            Provider<HomeUsecase>(
              create: (context) => HomeUsecaseImpl(
                homeRepository:
                    AppInject<HomeRepository>().getDependency(context),
              ),
            ),
            Provider<HomeCubit>(
              create: (context) => HomeCubit(
                homeUsecase: AppInject<HomeUsecase>().getDependency(context),
              ),
            ),
          ],
          routers: {
            '/home': (_) => const HomePage(),
          },
        );
}

class PermanentDependencieFromModule {
  List<SingleChildWidget> dependency() {
    return [
      Provider(
        create: (context) =>
            PermanentClassHomeModule(),
      )
    ];
  }
}
