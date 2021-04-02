import 'package:advertising/domain/kategori_produk.dart';

class ProdukService {
  Future<List<KategoriProdukVM>> getKategori() {
    return Future.delayed(Duration(seconds: 2), () {
      return List.empty();
    });
  }
}
