import 'package:fighter_companion/StreetFighterV/streetFighterVCharacters.dart';
import 'package:fighter_companion/StreetFighterV/streetFighterVMain%20copy.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (context) => GamesCollection(),
        "/streetFighterV": (context) => StreetFighterVCompanion(),
        "/streetFighterV/Characters": (context) => StreetFighterVCharacters()
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class GamesCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const NUMBER_OF_GAMES = 2;
    const CollectionTitles = [
      "Street Fighter V",
      "Dragonball FighterZ",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Your Poison"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(NUMBER_OF_GAMES, (index) {
          return FlatButton(
            onPressed: () {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, "/streetFighterV");
                  break;
                case 1:
                case 2:
                case 3:
                default:
                  break;
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(CollectionTitles[index]),
              ),
            ),
          );
        }),
      ),
    );
  }

  // showAlert(BuildContext context) {
  //   AlertDialog alert = AlertDialog(
  //     title: Text("This is a standard Alert"),
  //     content: null,
  //     actions: [FlatButton(onPressed: null, child: Text("OK"))],
  //   );
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return alert;
  //       },);
  // }
}
