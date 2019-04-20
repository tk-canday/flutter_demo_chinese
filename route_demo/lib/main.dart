import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './page/dynamicRoutePage.dart';
import './page/staticRoutePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Route Demo'),
      // 注册静态路由表
      routes: {
        'staticRoute1': (context) => StaticRoute1('只能传递静态参数'),
        'staticRoute2': (context) => StaticRoute2('只能传递静态参数'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _mainData = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('''Route Demo:
                点击蓝色按钮进入动态路由管理的页面，会将下面的 count 值传递给新页面；
                点击黄色按钮进入静态路由(命名路由)管理的页面；
                ''', textAlign: TextAlign.center),
            Text('count：$_mainData', textAlign: TextAlign.center),
            RaisedButton(
              color: Colors.blue[300],
              child: Text('动态路由跳转'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) {
                    return DynamicRoutePage(_mainData);
                  })
                );
              },
            ),

            RaisedButton(
              color: Colors.yellow[600],
              onPressed: () {
                Navigator.pushNamed(context, 'staticRoute1');
              },
              child: Text('静态路由跳转 1'),
            ),
            RaisedButton(
              color: Colors.yellow[600],
              onPressed: () {
                Navigator.pushNamed(context, 'staticRoute2');
              },
              child: Text('静态路由跳转 2'),
            ),
          ],
        ),
      ),

      // 加号按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _mainData++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
