import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // 整个 APP 的 UI 风格
      theme: new ThemeData(
        // 风格设置
        primaryColor: Colors.red[600],
      ),
      home: new LikeList(),
    );
  }
}

class LikeListState extends State<LikeList> {
  /// 所有列表
  final _likeListAll = <WordPair>[];

  /// 喜欢列表
  final _likedList = new Set<WordPair>();

  // 字体 style
  final _rowFont = const TextStyle(fontSize: 18, color: Color(0xFFFF9000));

  /// body
  Widget _renderBody() {
    /// 渲染列表
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 每一行渲染的时候都会调用一次itemBuilder
        itemBuilder: (context, i) {
          // 在偶数行，该函数会为单词对添加一个ListTile row.
          // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;

          // 如果是渲染到最后一个，接着再生成10个单词对，并添加到列表
          if (index >= _likeListAll.length) {
            _likeListAll.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_likeListAll[index]);
        });
  }

  /// 列表每一行的实例
  Widget _buildRow(WordPair pair) {
    final isLiked = _likedList.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _rowFont,
      ),

      // 每行尾部画心
      trailing: new Icon(
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked ? Colors.red : null,
      ),

      // 点击事件
      onTap: () {
        setState(() {
          if (isLiked) {
            _likedList.remove(pair);
          } else {
            _likedList.add(pair);
          }
        });
      },
    );
  }

  /// 添加一个路由, 并跳转到一个新的页面，这个页面都是喜欢的列表 && 可以删除此项
  void _goToLikedPage() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      // 将 likedListTile 列表实例为 ListTile 控件
      final likedListTile = _likedList.map((v) => _buildRow(v));
      final divided = ListTile.divideTiles(
        context: context,
        tiles: likedListTile,
      ).toList();

      return new Scaffold(
        appBar: new AppBar(
          title: new Text('liked List'),
        ),
        body: new ListView(children: divided),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('all List'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _goToLikedPage,
          ),
        ],
      ),
      body: new Center(
        child: _renderBody(),
      ),
    );
  }
}

class LikeList extends StatefulWidget {
  @override
  createState() => new LikeListState();
}
