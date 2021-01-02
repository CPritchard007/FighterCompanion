import 'package:flutter/material.dart';

class StreetFighterVCharacterInfo extends StatelessWidget {
  final Map<String, dynamic> data;
  final int characterIndex;

  static const routeName = "/streetFighterV/Characters/Info";

  const StreetFighterVCharacterInfo({
    Key key,
    @required this.characterIndex,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectionTitles = data.keys.toList().sublist(1);
    print(data.keys.toList());
    return Scaffold(
      appBar: AppBar(
        title: Text(data["Name"]),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: selectionTitles.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: FlatButton(
              onPressed: () {
                switch (index) {
                  case 0:
                  case 1:
                    Navigator.pushNamed(
                        context, "/StreetFighterV/Characters/Info/Frames",
                        arguments: RouteCharacterIndex(this.characterIndex));
                    break;
                  case 2:
                  case 3:
                  case 4:
                  default:
                    break;
                }
              },
              child: Center(
                child: Text(
                  selectionTitles[index],
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

class RouteCharacterIndex {
  final int characterIndex;
  RouteCharacterIndex(this.characterIndex);
}
