import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final job = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, "");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = ['dev java', 'dev python'];
    return ListView.builder(
        itemBuilder: ((context, index) => ListTile(
              leading: Icon(Icons.location_city),
              title: Text(suggestionList[index]),
            )));
  }
}
