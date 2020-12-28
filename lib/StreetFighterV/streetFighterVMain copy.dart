import 'package:flutter/material.dart';

class StreetFighterVCompanion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const NUMBER_OF_ITEMS = 5;

    const collectionTitles = ["Characters", "Other", "Other", "Other", "Other"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Street Fighter V"),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(NUMBER_OF_ITEMS, (index) {
            return FlatButton(
              onPressed: () {
                switch (index) {
                  case 0:
                    Navigator.pushNamed(context, "/streetFighterV/Characters");
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
                  collectionTitles[index],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
