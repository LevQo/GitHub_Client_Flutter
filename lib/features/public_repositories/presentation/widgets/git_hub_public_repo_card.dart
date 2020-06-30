import 'package:flutter/material.dart';

class GitHubPublicRepoCard extends StatelessWidget {
  final String name;
  final String description;

  const GitHubPublicRepoCard({@required this.name, @required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 6.0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        title: Text(name ?? '-'),
        subtitle: Text(description ?? '-'),
      ),
    );
  }
}
