import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget? child;
  final VoidCallback? click;

  MyContainer({this.renk = Colors.white, this.child, this.click});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        child: child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: renk,
        ),
        margin: EdgeInsets.all(12.0),
      ),
    );
  }
}
