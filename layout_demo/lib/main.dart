import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red[600],
      ),
      home: new LayoutPage(),
    );
  }
}

class LayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LayoutState();
  }
}

class LayoutState extends State<LayoutPage> {
  bool _isCollection = false; // 是否收藏

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('layout demo')),
      body: new ListView(
        children: <Widget>[
          _renderBanner(),      // 标题部分
          _renderTittle(),      // 收藏部分
          new Divider(),
          _renderEntryBtns(),   // 按钮导航部分
          new Divider(),
          _renderText(),  // 纯文本部分
          _renderListGridview(),  // 格子部分
        ],
      ),
    );
  }

  // banner 部分
  Widget _renderBanner() {
    return new Image.asset(
      'images/night.png',
      height: 240.0,
      fit: BoxFit.cover,
    );
  }

  // title 部分
  Widget _renderTittle() {
    // 左边的两行标题
    Widget leftTitle = new Expanded( // 被 Expanded 包装的控件会说明该控件在该行所占的比例
        flex: 1,    // 默认是1， 占满剩余空间
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 左对齐
          children: [
            new Container(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: new Text(
                '上面一行的标题',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Text(
              '下面的标题说明',
              style: new TextStyle(
                color: Colors.grey[500],
              )
            )
          ]
        )
      );

    // 星星按钮
    Widget middleIcon = new IconButton(
        icon: _isCollection ? new Icon(Icons.star) : new Icon(Icons.star_border),
        color: _isCollection ? Colors.yellow[800] : null,
        onPressed: () {
          setState(() {
            _isCollection = !_isCollection;
          });
        }
      );

    return new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          leftTitle,
          middleIcon,
          new Text(_isCollection ? '23' : '22'),
        ],
      ),
    );
  }

  // 按钮部分
  Widget _renderEntryBtns() {
    // mock 数据，假如后端穿过来有这么几个按钮
    final List<Map<String, String> > iconList = [
      {'type': 'call', 'label': '电话'},
      {'type': 'near_me', 'label': '导航'},
      {'type': 'share', 'label': '分享'},
    ];

    final iconListWidgets = iconList.map((v) {
      return new Column(
          children: <Widget>[
            new Icon(
              v['type'] == 'call' ? Icons.call : v['type'] == 'share' ? Icons.share : Icons.near_me,
              color: Colors.blue
            ),
            new Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: new Text(
                v['label'],
                style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400
                )
              )
            )
          ]
        );
    }).toList();

    return new Container(
      padding: new EdgeInsets.all(5),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // 水平居中
        children: iconListWidgets
      ),
    );
  }

  Widget _renderText() {
    return new Container(
      margin: EdgeInsets.all(0),
      padding: const EdgeInsets.all(30),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(0.5)),
      ),
      child: new Text(
        '关于布局的 demo， 这是文本部分 - Text',
        textAlign: TextAlign.center,
      ),
    );
  }

  // 生成盒子列表
  Widget _renderListGridview() {
    // 格子列表的假数据
    var mockGridData = new List<Container>.generate(
      20,
      (int index) => new Container(
        child: new Center(
          child: new Text( '格子布局部分-Gridview')
        )
      )
    );

    return new Container(
      height: 300,
      color: Colors.blue[50],
      child: GridView.count(
        crossAxisCount: 3,  // 每行放三个格子
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        padding: const EdgeInsets.all(4.0),
        childAspectRatio: 1,
        children: mockGridData
      ),
    );
  }
}
