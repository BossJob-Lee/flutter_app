import 'dart:ffi';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(255, 244, 233, 1), onPrimary: Color.fromRGBO(001, 244, 233, 1)),

        ),
        // home: MyHomePage(),
        initialRoute: "/home",
        routes: {
          "/home": (context) => MyHomePage(),
          "/list": (context) => MyListPage(),
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favourite = <WordPair>[];
  void toggleFavourite() {
    if (favourite.contains(current)) {
      favourite.remove(current);
    } else {
      favourite.add(current);
    }

    notifyListeners();
  }

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    IconData icon;
    if (appState.favourite.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    Widget page;
    switch(selectedIndex) {
      case 0:
        page = GeneratorPage(pair: pair, appState: appState, icon: icon);
        break;
      case 1:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError("Error");
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text("嗯哼"),
          ),
          body:
            Row(
              children: [
                SafeArea(child: NavigationRail(
                  extended: constraints.maxWidth > 400,
                  destinations: [
                    NavigationRailDestination(icon: Icon(Icons.home), label: Text("Home")),
                    NavigationRailDestination(icon: Icon(Icons.favorite), label: Text("Favourite"))
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                    switch (value) {
                      case 1:
                        Navigator.pushNamed(context,"/list");
                        break;
                      case 0:
                        Navigator.pushNamed(context,"/home");
                        break;
                    }
                  },
                )
                ),
                Expanded(
                  child: Container(
                      color: Color.fromRGBO(233, 111, 222, 1),
                      child: page
                  ),
                ),
              ],
            ),
        );
      }
    );
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({
    super.key,
    required this.pair,
    required this.appState,
    required this.icon,
  });

  final WordPair pair;
  final MyAppState appState;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('A random idea:'),
      BigCard(pair: pair),
      SizedBox(height: 20),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton.icon(onPressed: () {
            appState.toggleFavourite();
            print(appState.favourite);
          }, label: Text("Save"), icon: Icon(icon)),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: Text("Next"),
          ),
        ],
      ),
      ...appState.favourite.map((wp) {
        return Text(wp.asLowerCase);
      }).toList(),
    ],
          );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return
      Card(
        color: theme.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text("${pair.first} ${pair.second}", style: theme.textTheme.displayMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w900, fontSize: 60),
          ),
        ),
      );
  }
}

class MyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
        backgroundColor: theme.primaryColor,
      ),
      body: ListView(children: [
        ...appState.favourite.map((wp){ return Text(wp.asLowerCase);}).toList()
      ]),
    );
  }
}