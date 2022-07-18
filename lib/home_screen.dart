import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/material.dart';
import 'package:my_app/data.dart';
import 'package:my_app/filter_local_page.dart';
import 'package:my_app/search_bar.dart';

import 'Result_list.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState state = _HomeScreenState();
  @override
  _HomeScreenState createState() => state;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Search Job"), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ]),
        drawer: Drawer(),
        body: FutureBuilder(
            future: ReadJsonData(),
            builder: (context, data) {
              if (data.hasError) {
                return Center(child: Text('${data.error}'));
              } else if (data.hasData) {
                var items = data.data as List<datas>;
                return ListView.builder(itemBuilder: (context, index) {
                  return Card(
                    elevation: 500,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(items[index].title.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(items[index].text.toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 13, 141, 201))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(items[index].contrat.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                      items[index].description.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ('Home'),
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_post_office),
              label: ('Your Posts'),
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity),
              label: ('Your CV'),
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_sharp),
              label: ('Info'),
              backgroundColor: Colors.amber)
        ]));
  }

  Future<List<datas>> ReadJsonData() async {
    final jsondata =
        await DefaultAssetBundle.of(context).loadString("assets/d1.json");
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => datas.fromJson(e)).toList();
  }
}
