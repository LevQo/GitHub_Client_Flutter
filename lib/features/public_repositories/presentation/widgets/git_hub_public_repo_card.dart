import 'package:flutter/material.dart';

class GitHubPublicRepoCard extends StatelessWidget {
  final String name;
  final String description;
  final String owner;
  final Function(String owner, String repoName) onTap;

  const GitHubPublicRepoCard({@required this.name, @required this.description, @required this.owner, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(owner, name),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        elevation: 6.0,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          title: Text(name ?? '-'),
          subtitle: Text(description ?? '-'),
        ),
      ),
    );
  }
}
