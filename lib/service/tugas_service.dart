import 'package:advertising/domain/tugas_harian.dart';

class TugasService {
  Future<List<TugasHarian>> getTugasHarian() {
    return Future.delayed(Duration(seconds: 2), () {
      return List.empty();
    });
  }
}
