import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String avatarUrl;
  final String login;

  const UserCard({@required this.avatarUrl, @required this.login});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(50), offset: Offset(0.0, 6.0), blurRadius: 2.0)],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Hero(
              tag: 'avatar',
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(avatarUrl),
              ),
            ),
            Text(
              ' $login',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
