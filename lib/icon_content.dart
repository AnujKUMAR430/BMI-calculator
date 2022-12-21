import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final Color iconcolor;

  IconContent(this.icon, this.title, this.color, this.iconcolor);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: iconcolor,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 18.0, color: color),
        ),
      ],
    );
  }
}