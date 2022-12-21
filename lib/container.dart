import 'package:flutter/material.dart';

class Reuse extends StatelessWidget {
  final Color colors;
  final Widget childs;

  Reuse(this.colors, this.childs);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: childs,
      ),
    );
  }
}
