import 'package:flutter/material.dart';
import 'package:module_test/core/permanent_class_test/permanent_class.dart';
import 'package:module_test/home_page/presenter/cubit/home_cubit.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    late WebViewController webController;
    final cubit = context.read<HomeCubit>();
    final permanent = context.read<PermanentClass>();
    const embeded =
        '<div class="sketchfab-embed-wrapper"> <iframe title="Angelica" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/27f75fa94c384000bb6a79a3000f8e80/embed"> </iframe> <p style="font-size: 13px; font-weight: normal; margin: 5px; color: #4A4A4A;"> <a href="https://sketchfab.com/3d-models/angelica-27f75fa94c384000bb6a79a3000f8e80?utm_medium=embed&utm_campaign=share-popup&utm_content=27f75fa94c384000bb6a79a3000f8e80" target="_blank" style="font-weight: bold; color: #1CAAD9;"> Angelica </a> by <a href="https://sketchfab.com/NikZava284?utm_medium=embed&utm_campaign=share-popup&utm_content=27f75fa94c384000bb6a79a3000f8e80" target="_blank" style="font-weight: bold; color: #1CAAD9;"> NikZava284 ✓ </a> on <a href="https://sketchfab.com?utm_medium=embed&utm_campaign=share-popup&utm_content=27f75fa94c384000bb6a79a3000f8e80" target="_blank" style="font-weight: bold; color: #1CAAD9;">Sketchfab</a></p></div>';
    final teste = embeded.contains('https://sketchfab.com/3d-models/');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Module'),
      ),
      body: SingleChildScrollView(
        child: Center(
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
              SizedBox(
                height: 450,
                child: WebView(
                  onWebViewCreated: (controller) {
                    webController = controller;
                  },
                  initialUrl:
                      'https://sketchfab.com/3d-models/angelica-27f75fa94c384000bb6a79a3000f8e80?utm_medium=embed&utm_campaign=share-popup&utm_content=27f75fa94c384000bb6a79a3000f8e80',
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Caixa<T> {
  List<T> itens = [];
  void adicionar(T element){

  }
}

class Circulo {}
class Bola {}
class Boneca {}
class Telefone {}