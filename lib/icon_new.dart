import 'package:flutter/material.dart';

class Icons_New extends StatelessWidget {
  final iconImg;
  final newText;

  Icons_New({@required this.iconImg, @required this.newText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconImg,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          newText,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
