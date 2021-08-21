import 'package:flutter/material.dart';

class CinsiyetKutusu extends StatelessWidget {
  final String? cinsiyet;
  final IconData? ikon;

  CinsiyetKutusu({@required this.cinsiyet, this.ikon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(ikon, size: 50),
        Text(
          "$cinsiyet",
          style: TextStyle(fontSize: 25),
        ),
      ],
    );
  }
}
