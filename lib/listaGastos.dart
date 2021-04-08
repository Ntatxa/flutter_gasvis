import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaGastos extends StatelessWidget {
  final int semana;
  final int year;

  ListaGastos(this.semana, this.year);

  String semanaFormateada() {
    var primerDia = DateTime(this.year, 1, 1);
    var dias = 7 * semana;
    var duracionDias = Duration(days: dias);
    var fechaSemana = primerDia.add(duracionDias);
    var lunes = fechaSemana.subtract(Duration(days: fechaSemana.weekday - 1));
    var domingo = fechaSemana.add(Duration(days: fechaSemana.weekday - 1));

    var del_dia =
        "Del ${lunes.day.toString()}/${lunes.month.toString()}/${lunes.year.toString()} ";
    var al_dia =
        "al ${domingo.day.toString()}/${domingo.month.toString()}/${domingo.year.toString()} ";
    return del_dia + al_dia;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(semana.toString()),
        title: Text(this.semanaFormateada()),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                    child: Row(
                  children: [
                    Text("Dia", style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("Concepto",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("Tipo", style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("Importe",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                )

                    // Header

                    ),
                Expanded(child: getLista())
              ],
            )
            //  getLista()

            /*
            Row(children: [
              Text("Dia", style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Text("Concepto", style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Text("Tipo", style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Text("Importe", style: TextStyle(fontWeight: FontWeight.bold))
            ]),
            Divider(),
            Row(children: [Text("Cuerpo")]),
            Divider(),
            Row(children: [Text("Cuerpo")]),
            */
            //  ]),
            ),
      ),
      persistentFooterButtons: <Widget>[
        IconButton(icon: Icon(Icons.add), onPressed: () {})
      ],
    );
  }
}

Widget getLista() {
  var listview = ListView(children: <Widget>[
    ListTile(title: Text("111")),
    ListTile(title: Text("222")),
    ListTile(title: Text("333")),
  ]);
  return listview;
}

Widget getListView() {
  var listview = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("LandScape"),
        subtitle: Text("Beautiful View..!"),
        trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.access_alarm),
        title: Text("Alarm"),
        subtitle: Text("Good morning.!"),
        trailing: Icon(Icons.cloud_circle),
      ),
      ListTile(
        leading: Icon(Icons.beach_access),
        title: Text("Beach"),
        subtitle: Text("Beach View..!"),
        trailing: Icon(Icons.beach_access),
      ),
      ListTile(
        leading: Icon(Icons.satellite),
        title: Text("Satellite"),
        subtitle: Text("Satellite Signal..!"),
        trailing: Icon(Icons.scatter_plot),
      ),
      ListTile(
        leading: Icon(Icons.save),
        title: Text("Save Data"),
        subtitle: Text("Save File..!"),
        trailing: Icon(Icons.gps_fixed),
      ),
      ListTile(
        leading: Icon(Icons.phone),
        title: Text("Call"),
        subtitle: Text("856848***11..!"),
        trailing: Icon(Icons.cached),
      ),
      ListTile(
        leading: Icon(Icons.print),
        title: Text("Printer"),
        subtitle: Text("Print Page..!"),
        trailing: Icon(Icons.pages),
      ),
      ListTile(
        leading: Icon(Icons.gamepad),
        title: Text("Game Pad"),
        subtitle: Text("Game Lover..!"),
        trailing: Icon(Icons.games),
      )
    ],
  );
  return listview;
}

Widget _myListView(BuildContext context) {
  // backing data
  final europeanCountries = [
    'Albania',
    'Andorra',
    'Armenia',
    'Austria',
    'Azerbaijan',
    'Belarus',
    'Belgium',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Croatia',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Estonia',
    'Finland',
    'France',
    'Georgia',
    'Germany',
    'Greece',
    'Hungary',
    'Iceland',
    'Ireland',
    'Italy',
    'Kazakhstan',
    'Kosovo',
    'Latvia',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macedonia',
    'Malta',
    'Moldova',
    'Monaco',
    'Montenegro',
    'Netherlands',
    'Norway',
    'Poland',
    'Portugal',
    'Romania',
    'Russia',
    'San Marino',
    'Serbia',
    'Slovakia',
    'Slovenia',
    'Spain',
    'Sweden',
    'Switzerland',
    'Turkey',
    'Ukraine',
    'United Kingdom',
    'Vatican City'
  ];

  return ListView.builder(
    itemCount: europeanCountries.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(europeanCountries[index]),
      );
    },
  );
}
