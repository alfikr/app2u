import 'package:advertising/domain/LaporanVM.dart';

class LaporanService {
  Future<List<LaporanVM>> getLaporan(DateTime awal, DateTime akhir) {
    return Future.delayed(Duration(seconds: 2), () {
      return List.empty();
    });
  }
}
