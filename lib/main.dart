import 'dart:convert';

import 'package:fighter_companion/StreetFighterV/streetFighterVCharacterMoves.dart';
import 'package:fighter_companion/StreetFighterV/streetFighterVCharacterInfo.dart';
import 'package:fighter_companion/StreetFighterV/streetFighterVCharacters.dart';
import 'package:fighter_companion/StreetFighterV/streetFighterVMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor headerColor = Colors.deepPurple;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData("assets/data.json"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          /*


          .########...#######..##.....##.########.########..######.
          .##.....##.##.....##.##.....##....##....##.......##....##
          .##.....##.##.....##.##.....##....##....##.......##......
          .########..##.....##.##.....##....##....######....######.
          .##...##...##.....##.##.....##....##....##.............##
          .##....##..##.....##.##.....##....##....##.......##....##
          .##.....##..#######...#######.....##....########..######.
          
          */
          return MaterialApp(
            title: 'Fighter Companion',
            initialRoute: "/",
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case StreetFighterVCharacterInfo.routeName:
                  RouteCharacterIndex arg = settings.arguments;
                  return MaterialPageRoute(builder: (context) {
                    return StreetFighterVCharacterInfo(
                      data: snapshot.data["Street Fighter V"]["Characters"]
                          [arg.characterIndex],
                      characterIndex: arg.characterIndex,
                    );
                  });
                case StreetFighterVCharacterMoves.routeName:
                  RouteCharacterIndex arg = settings.arguments;
                  return MaterialPageRoute(builder: (context) {
                    return StreetFighterVCharacterMoves(
                      data: snapshot.data["Street Fighter V"]["Characters"]
                          [arg.characterIndex],
                      characterIndex: arg.characterIndex,
                    );
                  });
              }
            },
            routes: <String, WidgetBuilder>{
              "/": (context) => GamesCollection(snapshot.data),
              "/streetFighterV": (context) =>
                  StreetFighterVCompanion(snapshot.data["Street Fighter V"]),
              "/streetFighterV/Characters": (context) =>
                  StreetFighterVCharacters(
                      snapshot.data["Street Fighter V"]["Characters"]),
              "/dragonballFighterZ": (context) =>
                  snapshot.data["Dragonball Fighter Z"],
              "/dragonballFighterZ/Characters": (context) =>
                  snapshot.data["Dragonball Fighter Z"]["Characters"]
            },
            theme: ThemeData(
              primarySwatch: headerColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

Future<Map<String, dynamic>> getData(String assetPath) async {
  return rootBundle.loadString(assetPath).then((json) => jsonDecode(json));
}

class GamesCollection extends StatelessWidget {
  Map<String, dynamic> data;
  GamesCollection(this.data);

  @override
  Widget build(BuildContext context) {
    //########################################

    //########################################
    final gameTitles = data.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Select A Game"),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: (MediaQuery.of(context).size.width / 180).floor(),
          children: List.generate(data.length, (index) {
            return Container(
              child: RaisedButton(
                onPressed: () {
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(
                          context, "/streetFighterV/Characters");
                      break;
                    case 1:
                      Navigator.pushNamed(
                          context, "/dragonballFighterZ/Characters");
                      break;
                    case 2:
                    case 3:
                    default:
                      break;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      gameTitles[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
