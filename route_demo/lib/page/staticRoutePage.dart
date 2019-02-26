import 'package:flutter/material.dart';

class StaticRoute1 extends StatelessWidget {
  final String _parentData;
  StaticRoute1(this._parentData);
  @override
    Widget build(BuildContext context) {
      return Scaffold(
      appBar: new AppBar(
        title: new Text('静态路由页面1'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 5.0),
        child: Center(
          child: Text('静态参数: $_parentData')
        ),
      ),
    );
    }
}

class StaticRoute2 extends StatelessWidget {
  final String _parentData;
  StaticRoute2(this._parentData);
  @override
    Widget build(BuildContext context) {
      return Scaffold(
      appBar: new AppBar(
        title: new Text('静态路由页面1'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 5.0),
        child: Center(
          child: Text('静态参数: $_parentData')
        ),
      ),
    );
    }
}