import 'package:flutter/material.dart';

class StreetFighterArguments {
  final Map<String, dynamic> data;

  StreetFighterArguments(this.data);
}

class StreetFighterVCompanion extends StatelessWidget {
  final Map<String, dynamic> data;
  StreetFighterVCompanion(this.data);

  @override
  Widget build(BuildContext context) {
    final sectionTitles = data.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Street Fighter V"),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: (MediaQuery.of(context).size.width / 200).floor(),
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
                    case 4:
                    default:
                      break;
                  }
                },
                child: Center(
                  child: Text(
                    sectionTitles[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
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
