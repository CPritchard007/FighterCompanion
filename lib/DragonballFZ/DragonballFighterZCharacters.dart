import 'package:flutter/material.dart';

/**
 * 
 *      Currently Disabled, the page will skip to the character
 *  
 * 
 * Curtis Pritchard
 */
class DragonballFighterZCharacters extends StatelessWidget {
  final List<dynamic> data;

  DragonballFighterZCharacters(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Characters"),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: (MediaQuery.of(context).size.width / 120).floor(),
          children: List.generate(data.length, (index) {
            return Container(
              margin: EdgeInsets.all(5),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {},
                child: Center(
                  child: Text(
                    data[index]["Name"],
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
