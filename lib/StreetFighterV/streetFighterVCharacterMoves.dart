import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StreetFighterVCharacterMoves extends StatefulWidget {
  static const routeName = "/StreetFighterV/Characters/Info/Moves";
  final Map<String, dynamic> data;
  final int characterIndex;

  const StreetFighterVCharacterMoves({
    Key key,
    @required this.data,
    @required this.characterIndex,
  }) : super(key: key);

  @override
  _StreetFighterVCharacterMovesState createState() =>
      _StreetFighterVCharacterMovesState(data, data["Name"]);
}

class _StreetFighterVCharacterMovesState
    extends State<StreetFighterVCharacterMoves> {
  final Map<String, dynamic> data;
  final String name;
  _StreetFighterVCharacterMovesState(this.data, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${data["Name"]} Move List"),
        ),
        body: FutureBuilder(
          future: getCharacterMoveData(),
          builder: (context, snapshot) {
            final simpleName = name.replaceAll(" ", "");
            final headers = snapshot.data[simpleName]["moves"].keys.toList();

            var relativeIndex = 0;
            var subtractedIndex = 0;
            var capIndex = 0;
            var currentSelection = 0;

            print(
                snapshot.data[simpleName]["moves"][headers[currentSelection]]);

            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: 65,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0)
                    capIndex = snapshot
                        .data[simpleName]["moves"][headers[currentSelection]]
                        .length;
                  if (capIndex == 0 || capIndex == relativeIndex)
                    currentSelection++;
                  relativeIndex = index - subtractedIndex;
                  if (relativeIndex == capIndex) subtractedIndex += capIndex;
                  print(
                      "$index : [ $relativeIndex ] - ${index - capIndex} -> $currentSelection");

                  if (relativeIndex == 0) {
                    return Container(
                        child: Text(
                      "HEADER",
                      textAlign: TextAlign.center,
                    ));
                  } else
                    return Row(
                      children: [Text("")],
                    );
                },
              );
            } else {
              return CircularProgressIndicator(
                  value: 0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green));
            }
          },
        ));
  }

  Future<Map<String, dynamic>> getCharacterMoveData() async {
    const URL =
        "https://raw.githubusercontent.com/D4RKONION/fatsfvframedatajson/master/sfv.json";

    final response = await http.get(URL);

    final responseJson = jsonDecode(response.body);

    return responseJson;
  }

  Header(String value) {
    return Text(value);
  }
}
