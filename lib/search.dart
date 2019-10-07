import 'package:flutter/material.dart';
import 'package:flutter_search_api/api_client.dart';
import 'package:flutter_search_api/model.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();
  bool onSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: editingController,
          autofocus: true,
          decoration: InputDecoration(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                onSearch = true;
              });
            },
          ),
        ],
      ),
      body: onSearch ? SearchContent(editingController.text) : Container(),
    );
  }
}

class SearchContent extends StatelessWidget {
  final String users;

  SearchContent(this.users);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<GitHubUsers>(
        future: ApiClient.getUsers(users),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          GitHubUsers gitHubUsers = snapshot.data;
          bool connect = snapshot.connectionState == ConnectionState.done;
          if (snapshot.hasData && connect) {
            return ListView.builder(
              itemCount: gitHubUsers.items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(gitHubUsers.items[index].login),
                  onTap: () {
                    SnackBar snackbar = SnackBar(
                      content: Text(
                        gitHubUsers.items[index].login,
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
                  },
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
