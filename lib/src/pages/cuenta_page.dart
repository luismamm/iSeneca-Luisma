import 'package:flutter/material.dart';

class CuentaPage extends StatelessWidget {
  final String value;

  const CuentaPage({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment(0, -0.55), children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                decoration: new BoxDecoration(color: Colors.lightBlue[900]),
                child: Center(
                  child: new Text('iSéneca',
                      style: TextStyle(color: Colors.white, fontSize: 70.0)),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: _botones(context)),
            ],
          ),
        ),
        Card(
          child: Container(
              width: displayWidth(context) * 0.85,
              height: displayHeight(context) * 0.26,
              child: Column(
                children: [
                  ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.person_add),
                      onPressed: () {},
                    ),
                    title: Text('$value'),
                    subtitle: Text('I.E.S. Llanes\nPerfil Dirección'),
                  ),
                  Container(
                    height: displayHeight(context) * 0.10,
                    width: displayWidth(context) * 0.9,
                    color: Colors.blue,
                    child: Row(
                      children: <Widget>[
                        FlatButton.icon(
                          icon: Icon(Icons.timer),
                          label: Text('Avisos'),
                          onPressed: () {},
                        ),
                        FlatButton.icon(
                          icon: Icon(Icons.book),
                          label: Text('Bandeja de firmas'),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ]),
      bottomNavigationBar: _botonNavigationBar(),
    );
  }

  Widget _botonNavigationBar() {
    return Container(
      child: BottomNavigationBar(
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.home, size: 30.0, color: Colors.grey),
                onPressed: () {},
              ),
              title: Text('Inicio',
                  style: TextStyle(color: Colors.grey, fontSize: 10.0))),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.timer, size: 30.0, color: Colors.grey),
                onPressed: () {},
              ),
              title: Text('Agenda',
                  style: TextStyle(color: Colors.grey, fontSize: 10.0))),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.chat, size: 30.0, color: Colors.grey),
                onPressed: () {},
              ),
              title: Text('Comunicaciones',
                  style: TextStyle(color: Colors.grey, fontSize: 10.0))),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.menu, size: 30.0, color: Colors.grey),
                onPressed: () {},
              ),
              title: Text('Menú',
                  style: TextStyle(color: Colors.grey, fontSize: 10.0))),
        ],
      ),
    );
  }

  Widget _botones(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          Container(
            height: displayHeight(context) * 0.17,
            margin: EdgeInsets.all(15.0),
          ),
          Container(
            height: displayHeight(context) * 0.17,
            margin: EdgeInsets.all(15.0),
          ),
          Container(
            height: displayHeight(context) * 0.17,
            margin: EdgeInsets.all(15.0),
          )
        ]),
        TableRow(children: [
          Container(
            height: displayHeight(context) * 0.17,
            margin: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset('assets/sombrero.png', scale: 6.0),
                Text('Alumnado del centro', textAlign: TextAlign.center)
              ],
            ),
          ),
          Container(
            height: displayHeight(context) * 0.17,
            margin: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset('assets/profesor.png', scale: 6.5),
                Text('Personal del centro', textAlign: TextAlign.center)
              ],
            ),
          ),
          Container(
            height: displayHeight(context) * 0.17,
            margin: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset('assets/covid.png', scale: 6.2),
                Text('Información Covid', textAlign: TextAlign.center)
              ],
            ),
          )
        ]),
        TableRow(children: [
          Container(
            height: displayHeight(context) * 0.20,
            margin: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset('assets/campana.png', scale: 5.0),
                Text('Tablón de anuncios', textAlign: TextAlign.center)
              ],
            ),
          ),
          Container(
            height: displayHeight(context) * 0.19,
            margin: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/calendario.png',
                  scale: 5.0,
                ),
                Text('Calendario escolar', textAlign: TextAlign.center)
              ],
            ),
          ),
          Container(
            height: displayHeight(context) * 0.19,
            margin: EdgeInsets.all(15.0),
          )
        ])
      ],
    );
  }

  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }
}
