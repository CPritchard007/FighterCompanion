import 'package:flutter/material.dart';

class StreetFighterVCharacterFrames extends StatefulWidget {
  static const routeName = "/StreetFighterV/Characters/Info/Frames";
  final List<dynamic> data;
  final int characterIndex;

  const StreetFighterVCharacterFrames({
    Key key,
    @required this.data,
    @required this.characterIndex,
  }) : super(key: key);

  @override
  _StreetFighterVCharacterFramesState createState() =>
      _StreetFighterVCharacterFramesState(data);
}

class _StreetFighterVCharacterFramesState
    extends State<StreetFighterVCharacterFrames> {
  final List<dynamic> data;

  _StreetFighterVCharacterFramesState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.calculate,
                color: Colors.white,
              ),
              onPressed: null)
        ],
        title: Text("Frames"),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: 0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: FlatButton(
              onPressed: () {
                switch (index) {
                  case 0:
                  case 1:
                  case 2:
                  case 3:
                  case 4:
                  default:
                    break;
                }
              },
              child: Center(
                child: Text(
                  "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
