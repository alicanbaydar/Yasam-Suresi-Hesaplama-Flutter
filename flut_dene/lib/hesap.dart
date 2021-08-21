import 'package:flut_dene/user_data.dart';

class Hesap {
  UserData _userData;
  Hesap(this._userData);

  double hesaplama() {
    double sonuc;
    sonuc = 90 + _userData.sporGunu - _userData.icilenSigara;
    sonuc = sonuc + (_userData.boyUzunluk / _userData.kiloAgirlik);

    if (_userData.seciliCinsiyet == 'KADIN')
      return (sonuc + 3);
    else {
      return sonuc;
    }
  }
}
