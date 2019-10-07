import 'package:flutter/material.dart';
import 'package:flutter_search_api/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eudeka! Flutter Basic'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SearchPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Image.network(
          'https://github.githubassets.com/images/modules/logos_page/Octocat.png',
        ),
      ),
    );
  }
}
