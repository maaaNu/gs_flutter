import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gs_flutter/Actions.dart';
import 'package:gs_flutter/container/FirstScreen.dart';
import 'package:gs_flutter/container/SecondScreen.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Flutter Demo Home'),
        '/first': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            // Column is also layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new StoreConnector<int, String>(
                  builder: (context, state) {
                    return new Text(
                      state,
                      style: Theme.of(context).textTheme.display1,
                    );
                  },
                  converter: (store) => store.state.toString()),
              Text(
                'You have pushed the button this many times:',
              ),
              RaisedButton(
                child: Text('Goto FirstScreen'),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/first');
                },
              ),
              RaisedButton(
                child: Text('Goto SecondScreen'),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
              )
            ],
          ),
        ),
        floatingActionButton: new StoreConnector<int, VoidCallback>(
          converter: (store) {
            return () => store.dispatch(IncrementingButtonAction.IncrementButton);
          },
          builder: (context, callback) {
            return FloatingActionButton(
              onPressed: callback,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          }, // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}


class StoreWrapper extends StatelessWidget {
  final Store<int> store;
  StoreWrapper(this.store);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<int>(
      store: store,
      child: App(),
    );
  }
}

