import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

final rowFont = const TextStyle(fontSize: 18, color: Color(0xFFFF9000));

class LikedPage extends StatefulWidget {
  final Set<WordPair> _likedList;

  LikedPage(this._likedList);
  createState() => new LikedPageState(_likedList);
}

class LikedPageState extends State<LikedPage> {
  final Set<WordPair> _likedList;
  LikedPageState(this._likedList);
  @override
  Widget build(BuildContext context) {
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
  }

  /// 每一行，点击取消喜欢
  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: rowFont,
      ),

      // 每行尾部画心
      trailing: new Icon(
        Icons.favorite,
        color: Colors.red,
      ),

      // 点击事件
      onTap: () {
        setState(() {
          _likedList.remove(pair);
        });
      },
    );
  }
}