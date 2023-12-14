import 'package:dashboard_gestantes/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mamãe ID'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url =
      'https://app.powerbi.com/view?r=eyJrIjoiMzMyYzlkNzYtNDlmYS00MmRiLWExZmYtZTJhZjU5ZTZiYjY1IiwidCI6ImRjMzQ5NmU3LWIyNmYtNDdjMy05ZDgwLWFmNDdiYzI0MzU3NyJ9';

  @override
  void initState() {
    WebView.platform = WebWebViewPlatform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFBCCE),
        title: SizedBox(
          width: 170,
          child: Image.asset(
            '../assets/logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: [
              CustomCard(
                height: 0.6,
                flex: 2,
                child: WebView(
                  initialUrl: url,
                ),
              ),
              CustomCard(
                title: 'Proporção: Gestantes Identificadas x Vacinadas',
                height: 0.6,
                flex: 1,
                child: Row(
                  children: [
                    SizedBox(
                        height: 100,
                        child: SvgPicture.asset('assets/gestante.svg'))
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              CustomCard(
                flex: 1,
                title: 'Proporção: Gestantes Identificadas x Vacinadas',
                height: 0.6,
                child: Column(
                  children: [],
                ),
              ),
              CustomCard(
                flex: 1,
                title: 'Cadastrar Gestante',
                height: 0.6,
                child: Column(
                  children: [
                    Row(
                      children: [
                        DropdownButton(
                          value: 'Vamos vers',
                          items: const [
                            DropdownMenuItem(
                                child: Text(
                                    'NÍVEL FUNDAMENTAL COMPLETO(1º GRAU COMPLETO')),
                            DropdownMenuItem(
                                child: Text(
                                    'NÍVEL FUNDAMENTAL INCOMPLETO(1º GRAU INCOMPLETO)')),
                            DropdownMenuItem(
                                child: Text(
                                    'NÍVEL MÉDIO COMPLETO(2º GRAU INCOMPLETO)')),
                          ],
                          hint: Text('Nível de Escolaridade'),
                          onChanged: (value) {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
