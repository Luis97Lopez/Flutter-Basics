import 'package:flutter/material.dart';

void main() => runApp(AppDemo());

class AppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: 'Title',
        home: TabControllerWidget(),
        // home:
        //   Scaffold(
        //     appBar: AppBar(title: Text('AppDemo -  Ejemplo')),
        //     drawer: ScreenDrawer(),
        //     body: SnackBarPage(),
        //   ),
    );
  }
}

// Tabs
class TabControllerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs:[
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ]
          )
        ),
        body: TabBarView(
          children: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ]
        )
      ),
    );
  }
}


// SNACKBAR How to make it
class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: Text('Muestra el SnackBar'),
      onPressed: () {
        final snackBar = SnackBar(
            content: Text('Ahuevo un SnackBar'),
            action: SnackBarAction(
              label: 'Zafo',
              onPressed: () {},
            ));
        Scaffold.of(context).showSnackBar(snackBar);
      },
    ));
  }
}


// DRAWER
class ScreenDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            child: Text('Saludos'),
            decoration: BoxDecoration(
              color: Colors.blue,
            )
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: (){
              Navigator.pop(context);
            }
          )
        ]
      )
    );
  }
}
