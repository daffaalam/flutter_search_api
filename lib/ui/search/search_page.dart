import 'package:flutter/material.dart';

import '../../model/github_users.dart';
import '../../network/api_client.dart';
import 'search_content.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  GitHubUsers _gitHubUsers = GitHubUsers();
  bool _onSearch = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: _searchUsers,
              icon: const Icon(Icons.search),
            ),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          autofocus: true,
          onEditingComplete: _searchUsers,
        ),
      ),
      body: _body(),
    );
  }

  Future<void> _searchUsers() async {
    setState(() => _onSearch = true);
    _gitHubUsers = await ApiClient.getUsers(_controller.text);
    setState(() => _onSearch = false);
  }

  Widget _body() {
    if (_onSearch) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SearchContent(
        query: _controller.text,
        users: _gitHubUsers.items,
      );
    }
  }
}
