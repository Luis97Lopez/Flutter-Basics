import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(AppDemo());

class AppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Title',
      initialRoute: '/',
      routes:{
        '/': (context) => TabControllerWidget(),
        '/second': (context) => SecondRoute(),
        '/third': (context) => ThirdRoute(),
        '/fourth': (context) => FourthRoute(),
      }
      // home: TabControllerWidget(),
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
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.android_outlined)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.airplay_sharp)),
              ])),
          body: TabBarView(children: [
            SnackBarPage(),
            TabPageNumberTwo(),
            ImageNetworkTabPage(),
            ToDoTabPage(),
          ])),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("This is the 2ND Route")),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back'))));
  }
}

class FourthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("This is the 4TH Route")),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back'))));
  }
}


class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("This is the 3RD Route")),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => FourthRoute())
                  // );
                    Navigator.pushNamed(context, '/fourth');
                },
                child: Text('Go to the 4th Route'))));
  }
}


class ToDo {
  final String title;
  final String description;

  ToDo(this.title, this.description);
}

class ToDoTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ToDoScreen(
      list: List.generate(20,
              (i) => ToDo(
                'ToDo $i',
                'A description of what needs to be done for ToDo $i'
              )
      )
    );
  }
}


class ToDoScreen extends StatelessWidget{
  final List<ToDo> list;

  ToDoScreen({Key key, @required this.list}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of To Do')
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index].title),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(),
                    settings: RouteSettings(
                        arguments: list[index]
                    )
                  )
                );
              }
            );
          }
      )
    );
  }
}

class DetailScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final ToDo toDo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(toDo.title)
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(toDo.description)
      )
    );
  }
}


// Tests with Image Network and Assets Image
class ImageNetworkTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(

            child: Column(
              children: [
                  Center(child: Image(image: AssetImage("images/jugadores.jpeg"))),
                  Center(child: Image.network( "https://i.ytimg.com/vi/6MthakDxovc/maxresdefault.jpg"))
              ],
            )
      )
    );
  }
}

// Tests with tab pages
class TabPageNumberTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('First Route')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FlatButton(
                    onPressed: (){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => SecondRoute())
                        // );
                        Navigator.pushNamed(context, '/second');
                      },
                    child: Icon(Icons.dangerous)),
                Icon(Icons.arrow_back_outlined),
                Text("      Push for 2nd Route")
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FlatButton(
                  onPressed: (){
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => ThirdRoute())
                      // );
                      Navigator.pushNamed(context, '/third');
                    },
                  child: Icon(Icons.android)),
                Icon(Icons.arrow_back_outlined),
                Text("      Push for 3rd Route")
              ]),
            ],
          )
        )
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
          )),
      ListTile(
        title: Text('Item 1'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
          title: Text('Item 2'),
          onTap: () {
            Navigator.pop(context);
          })
    ]));
  }
}
