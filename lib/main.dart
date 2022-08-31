import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hernane',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
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
  int _counter = 0;

  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultadoIMC = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Calculadora de IMC',
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controllerPeso,
                decoration: const InputDecoration(
                    labelText: 'Peso *',
                    hintText: 'digite seu peso',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)))),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controllerAltura,
                decoration: const InputDecoration(
                    labelText: 'Altura *',
                    hintText: 'digite sua altura',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)))),
              ),
              const SizedBox(height: 32),
              Text(
                resultadoIMC,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Container(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        num numAux = (num.parse(controllerPeso.text) /
                            (num.parse(controllerAltura.text) *
                                num.parse(controllerAltura.text)));
                        resultadoIMC = numAux.toStringAsFixed(2);
                      });
                    },
                    child: const Text('Calcular')),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            resultadoIMC = '';
          });
        },
        tooltip: 'Increment',
        child: const Text('Limpar'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
