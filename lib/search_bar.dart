/*import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/home_screen.dart';

class SearchBar extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final HomeScreen homeScreen;

  SearchBar({Key? key, required this.homeScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Container(
              width: 200,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    hintText: 'enter Search',
                    hintStyle: TextStyle(
                      color: Colors.white24,
                    )),
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          MaterialButton(
              child: Text(
                'Show more',
                style: TextStyle(color: Colors.white70),
              ),
              onPressed: () {
                homeScreen.state.setState(() {
                  homeScreen.state.searched = true;
                });
              })
        ],
      ),
    );
  }
}
*/