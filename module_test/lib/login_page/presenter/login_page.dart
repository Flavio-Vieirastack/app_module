import 'package:flutter/material.dart';
import 'package:module_test/core/permanent_class_test/permanent_class.dart';
import 'package:module_test/login_page/presenter/cubit/login_cubit.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final permanent = context.read<PermanentClass>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login module'),
      ),
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () => cubit.testMethod(),
              child: const Text(
                'Testar função',
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
              child: const Text(
                'Ir para a home',
              ),
            ),
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
    );
  }
}
