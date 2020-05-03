// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
  // #enddocregion build
}
// #enddocregion MyApp

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  final List<Item> _item = List();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Todo Application'),
      ),
      body: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: TextField(
                  controller: _controller,
                )),
            Expanded(
                flex: 1,
                child: RaisedButton(
                  child: Text("add"),
                  onPressed: () {
                    setState(() {
                      _item.add(Item(
                        content: _controller.text,
                      ));
                      _controller.clear();
                    });
                  },
                ))
          ],
        ),
        Expanded(
            child: Column(
          children: _item,
        ))
      ]),
    );
  }
}

class Item extends StatelessWidget {
  final String content;

  Item({@required this.content});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 50.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.lightBlue[200]))),
        child: Center(
          child: Text(content,
              style: TextStyle(
                fontSize: 18.0,
              )),
        ),
      ),
    );
  }
}
