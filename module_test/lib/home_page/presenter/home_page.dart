import 'package:flutter/material.dart';
import 'package:module_test/core/permanent_class_test/permanent_class.dart';
import 'package:module_test/home_page/presenter/cubit/home_cubit.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final permanent = context.read<PermanentClass>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Module'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => cubit.callUseCase(),
              child: const Text('Call cubit'),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/login'),
              child: const Text('Back to Login'),
            ),
            Center(
            child: TextButton(
              onPressed: () => permanent.callPermanentFunction(),
              child: const Text(
                'Chamar função permanente',
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
