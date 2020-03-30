import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

final TextStyle _biggerFont = TextStyle(fontSize: 18.0);
final List<WordPair> _saved = <WordPair>[];

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//          appBar: AppBar(
//            title: Text(_title),
//            actions: <Widget>[
//              IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
//            ],
//          ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        tooltip: 'Favorite List',
        child: Icon(Icons.favorite),
        onPressed: _pushSaved,
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildSuggestionRow(_suggestions[index]);
        });
  }

  Widget _buildSuggestionRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: IconButton(
          icon: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null),
          onPressed: () {
            setState(() {
              if (alreadySaved) {
                _saved.remove(pair);
              } else {
                _saved.add(pair);
              }
            });
          }),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return SavedWordsPage();
        },
      ),
    );
  }
}

class SavedWordsPage extends StatefulWidget {
  @override
  _SavedWordsPageState createState() => _SavedWordsPageState();
}

class _SavedWordsPageState extends State<SavedWordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: _buildSavedList(),
    );
  }

  Widget _buildSavedList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i >= _saved.length) return null;

          return Column(children: <Widget>[
            ListTile(
              title: Text(
                _saved[i].asPascalCase,
                style: _biggerFont,
              ),
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _saved.removeAt(i);
                    });
                  }),
            ),
            Divider()
          ]);
        });
  }
}
