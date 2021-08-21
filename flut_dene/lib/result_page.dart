import 'package:flut_dene/hesap.dart';
import 'package:flut_dene/sabitler.dart';
import 'package:flut_dene/user_data.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 7,
            child: Center(
                child: Text(
              "Beklenen Yaşam Sürece: ${Hesap(_userData).hesaplama().round().toString()}",
              style: kYaziStyle,
            )),
          ),
          Expanded(
            flex: 2,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Geri Dön",
                  style: TextStyle(color: Colors.pink.shade800, fontSize: 25),
                )),
          )
        ],
      ),
    );
  }
}
