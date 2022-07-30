import 'package:module_test/core/permanent_class_test/permanent_class.dart';
import 'package:module_test/home_page/module/home_module.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class PermanentDependencies {
  static List<SingleChildWidget> init() {
    final providers = [
      Provider(
        create: (_) => PermanentClass(),
      ),
      ...PermanentDependencieFromModule().dependency(),
    ];
    return providers;
  }
}
