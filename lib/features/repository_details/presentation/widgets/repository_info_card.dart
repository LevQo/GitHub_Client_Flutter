import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final String count;
  final Icon icon;

  const InfoCard({@required this.text, @required this.count, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.lightBlueAccent
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            RichText(
              text: TextSpan(children: [
                WidgetSpan(child: icon,),
                TextSpan(text: '$text ', style: TextStyle(color: Colors.white)),
                TextSpan(text: count, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
              ]),
            )
//            Container(width: 1.0, color: Colors.black,),
          ],
        ),
      ),
    );
  }
}
