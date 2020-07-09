import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  final String message;
  final Function onRetry;

  const ErrorContainer({@required this.message, @required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(message, textAlign: TextAlign.center),
        SizedBox(height: 16.0),
        RaisedButton(
          color: Colors.blue,
          child: Text('Retry', style: TextStyle(color: Colors.white)),
          onPressed: () => onRetry(),
        )
      ],
    );
  }
}
