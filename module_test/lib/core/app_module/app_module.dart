import 'package:flutter/material.dart';
import 'package:module_test/core/app_module/app_dispose_module.dart';
import 'package:provider/single_child_widget.dart';

abstract class AppModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _dependencies;
  AppModule({
    required Map<String, WidgetBuilder> routers,
    List<SingleChildWidget>? dependencies,
  })  : _dependencies = dependencies,
        _routers = routers;
  Map<String, WidgetBuilder> get routers => _routers.map(
        (key, pageBuilder) => MapEntry(
          key,
          (_) => AppDisposeModule(
            page: pageBuilder,
            dependencies: _dependencies,
          ),
        ),
      );
}
