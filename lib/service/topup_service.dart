import 'package:advertising/domain/metodeTopup.dart';

class TopupService {
  Future<List<MetodeTopup>> getMetodeTopup() {
    return Future.delayed(Duration(seconds: 2), () {
      return [
        MetodeTopup.instance(
            "001",
            "Mandiri",
            "136xxxxxxx",
            "https://pbs.twimg.com/profile_images/829865693185138688/D1y2Ciyn.jpg",
            TipeTopup.Bank),
      ];
    });
  }
}
