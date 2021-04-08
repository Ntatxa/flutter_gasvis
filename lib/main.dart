import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'listaGastos.dart';

const Color _colorOne = Color(0x33000000);
const Color _colorTwo = Color(0x24000000);
const Color _colorThree = Color(0x1F000000);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text('2020'),
    1: Text('2021'),
    2: Text('2022'),
  };

  final years = [
    DateTime.now().year - 1,
    DateTime.now().year,
    DateTime.now().year + 1
  ];

  //Todo: año dinámico

  //final semanas = ['1', '2', '3'];

  final semanas = List.generate(52, (index) => (index + 1).toString());

  final Map<int, Widget> icons = const <int, Widget>{
    0: Center(
      child: FlutterLogo(
        textColor: Colors.indigo,
        size: 200.0,
      ),
    ),
    1: Center(
      child: FlutterLogo(
        textColor: Colors.teal,
        size: 100.0,
      ),
    ),
    2: Center(
      child: FlutterLogo(
        textColor: Colors.cyan,
        size: 50.0,
      ),
    ),
  };

  int sharedValue = 0;
  int semana = 1;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hola2',
      home: Scaffold(
        appBar: AppBar(title: Text('Gasvis')),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            SizedBox(
              width: 500.0,
              child: CupertinoSegmentedControl<int>(
                children: logoWidgets,
                onValueChanged: (int val) {
                  setState(() {
                    sharedValue = val;
                  });
                },
                groupValue: sharedValue,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32.0,
                  horizontal: 16.0,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 64.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(3.0),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0.0, 3.0),
                        blurRadius: 5.0,
                        spreadRadius: -1.0,
                        color: _colorOne,
                      ),
                      BoxShadow(
                        offset: Offset(0.0, 6.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                        color: _colorTwo,
                      ),
                      BoxShadow(
                        offset: Offset(0.0, 1.0),
                        blurRadius: 18.0,
                        spreadRadius: 0.0,
                        color: _colorThree,
                      ),
                    ],
                  ),
                  child: ListView.builder(
                      itemCount: semanas.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Center(child: Text(semanas[index])),
                            onTap: () => semana = index + 1
                            //print("Semana: ${index + 1}")
                            );
                      }),
                ),
              ),
            ),
            //Divider(),
            Builder(
                builder: (context) => ElevatedButton(
                      onPressed: () {
                        print('pressed');
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new ListaGastos(
                                    semana, years[sharedValue].toInt())));
                      },
                      child: Text('Gastos'),
                    ))
          ],
        ),
      ),
    );
  }
}
