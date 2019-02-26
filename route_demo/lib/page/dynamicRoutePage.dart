import 'package:flutter/material.dart';

class DynamicRoutePage extends StatelessWidget {
  final int _countData;
  DynamicRoutePage(this._countData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('动态路由页面'),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Center(child: Text('传过来的 count: $_countData')),
              ),
              RaisedButton(
                color: Colors.grey[350],
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child: Text('退出当前路由页'),
              ),
            ],
          ),
        ));
  }
}
