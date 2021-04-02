import 'package:advertising/domain/topupVM.dart';

class PPOBService {
  Future<TopupVM> inquiryTopup(
    String kodeBank,
    double nominal,
  ) async {
    return Future.delayed(Duration(seconds: 2), () {
      return null;
    });
  }
}
