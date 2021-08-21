import 'package:flut_dene/result_page.dart';
import 'package:flut_dene/sabitler.dart';
import 'package:flut_dene/user_data.dart';
import 'package:flutter/material.dart';
import './my_container.dart';
import './cinsiyet_kutusu.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0.0;
  double sporGunu = 0.0;
  double boyUzunluk = 170;
  double kiloAgirlik = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink.shade100,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Yaşam Süresi Hesaplama",
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlinedButton("BOY"),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlinedButton("KİLO"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Haftada kaç gün spor yapıyorsunuz?",
                        style: kYaziStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      sporGunu.round().toString(),
                      style: kSayiStyle,
                    ),
                    Slider(
                      divisions: 7,
                      label: sporGunu.round().toString(),
                      activeColor: Colors.purple.shade800,
                      inactiveColor: Colors.pink.shade100,
                      min: 0,
                      max: 7,
                      value: sporGunu,
                      onChanged: (value) {
                        setState(() {
                          sporGunu = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Günde kaç sigara içiyorsunuz?",
                        style: kYaziStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${icilenSigara.round()}",
                      style: kSayiStyle,
                    ),
                    Slider(
                      activeColor: Colors.purple.shade800,
                      inactiveColor: Colors.pink.shade100,
                      min: 0,
                      max: 30,
                      value: icilenSigara,
                      onChanged: (value) {
                        setState(() {
                          icilenSigara = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      click: () {
                        setState(() {
                          seciliCinsiyet = "KADIN";
                        });
                      },
                      renk: seciliCinsiyet == "KADIN"
                          ? Colors.red.shade600
                          : Colors.white,
                      child: CinsiyetKutusu(
                        cinsiyet: "KADIN",
                        ikon: Icons.female,
                      ),
                    ),
                  ),
                  Expanded(
                      child: MyContainer(
                    click: () {
                      setState(() {
                        seciliCinsiyet = "ERKEK";
                      });
                    },
                    renk: seciliCinsiyet == "ERKEK"
                        ? Colors.blue.shade600
                        : Colors.white,
                    child: CinsiyetKutusu(
                      cinsiyet: "ERKEK",
                      ikon: Icons.male,
                    ),
                  )),
                ],
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(UserData(
                            seciliCinsiyet: seciliCinsiyet,
                            icilenSigara: icilenSigara,
                            sporGunu: sporGunu,
                            kiloAgirlik: kiloAgirlik,
                            boyUzunluk: boyUzunluk)),
                      ));
                },
                child: Text(
                  'HESAPLA',
                  style: kSayiStyle,
                ))
          ],
        ));
  }

  Row buildRowOutlinedButton(String metin) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            metin,
            style: kYaziStyle,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            metin == "BOY"
                ? boyUzunluk.round().toString()
                : kiloAgirlik.round().toString(),
            style: kSayiStyle,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  metin == "BOY" ? boyUzunluk++ : kiloAgirlik++;
                });
              },
              child: Icon(
                Icons.arrow_upward,
                color: Colors.green.shade800,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  metin == "BOY" ? boyUzunluk-- : kiloAgirlik--;
                });
              },
              child: Icon(
                Icons.arrow_downward,
                color: Colors.red.shade700,
              ),
            )
          ],
        )
      ],
    );
  }
}
