import 'package:flutter/material.dart';

import '../../model/github_users.dart';

class SearchContent extends StatefulWidget {
  const SearchContent({
    Key? key,
    this.query = '',
    required this.users,
  }) : super(key: key);

  final String query;
  final List<Item> users;

  @override
  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  @override
  Widget build(BuildContext context) {
    if (widget.users.isEmpty) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "We couldn't find any users matching '${widget.query}'",
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Item user = widget.users[index];
        return ListTile(
          leading: CircleAvatar(
            foregroundImage: NetworkImage(user.avatarUrl),
          ),
          title: Text(user.login),
          subtitle: Text(user.type),
          onTap: () {},
        );
      },
      itemCount: widget.users.length,
    );
  }
}
