import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

@immutable
class AppDisposeModule extends StatefulWidget {
  @protected
  final List<SingleChildWidget>? _dependencies;
  @protected
  final WidgetBuilder _page;
  const AppDisposeModule({
    Key? key,
    List<SingleChildWidget>? dependencies,
    required WidgetBuilder page,
  })  : _dependencies = dependencies,
        _page = page,
        super(key: key);

  @override
  State<AppDisposeModule> createState() => _AppDisposeModuleState();
}

class _AppDisposeModuleState extends State<AppDisposeModule> {
  @override
  void initState() {
    super.initState();
    log(
      '${widget._page.toString().replaceAll('Closure: (BuildContext) => ', '')} Page Initialized', name: 'Actual Page',
    );
  }

  @override
  void dispose() {
    super.dispose();
    log(
      '',
      error:
          '${widget._page.toString().replaceAll('Closure: (BuildContext) => ', '')} Dependencies disposed', name: 'Dispose',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: widget._dependencies ??
          [
            Provider(
              create: (_) => Object(),
            ),
          ],
      child: Builder(
        builder: (context) => widget._page(context),
      ),
    );
  }
}
