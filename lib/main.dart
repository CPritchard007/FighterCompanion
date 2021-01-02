import 'dart:convert';

import 'package:fighter_companion/StreetFighterV/streetFighterVCharacterFrames.dart';
import 'package:fighter_companion/StreetFighterV/streetFighterVCharacterInfo.dart';
import 'package:fighter_companion/StreetFighterV/streetFighterVCharacters.dart';
import 'package:fighter_companion/StreetFighterV/streetFighterVMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData("assets/data.json"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data["Street Fighter V"]);
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
                case StreetFighterVCharacterFrames.routeName:
                  RouteCharacterIndex arg = settings.arguments;
                  return MaterialPageRoute(builder: (context) {
                    return StreetFighterVCharacterFrames(
                      data: snapshot.data["Street Fighter V"]["Characters"]
                          [arg.characterIndex]["Frames"],
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
                      snapshot.data["Street Fighter V"]["Characters"])
            },
            theme: ThemeData(
              primarySwatch: Colors.red,
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
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(
                          context, "/streetFighterV/Characters");
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
