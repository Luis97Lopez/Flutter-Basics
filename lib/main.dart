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
      length: 4,
      child: Scaffold(
        drawer: ScreenDrawer(),
        appBar: AppBar(
          title: Text('AppDemo -  Ejemplo'),
          bottom: TabBar(
            tabs:[
              Tab(icon: Icon(Icons.android_outlined)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.airplay_sharp)),
            ]
          )
        ),
        body: TabBarView(
          children: [
            SnackBarPage(),
            TabPageNumberTwo(),
            ImageNetworkTabPage(),
            ImageNetworkTabPage(),
          ]
        )
      ),
    );
  }
}

class ImageNetworkTabPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          "https://i.ytimg.com/vi/6MthakDxovc/maxresdefault.jpg"
        )
      )
    );
  }
}


class TabPageNumberTwo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Tab #2')
      ),
      body: Center(
          child: Row(
              children: <Widget> [
                FlatButton(onPressed: (){}, child: Icon(Icons.android)),
                Text("Hola todos")
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
