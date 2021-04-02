class MetodeTopup {
  String kode;
  String logo;
  String nama;
  String rekening;
  TipeTopup tipeTopup = TipeTopup.Bank;
  MetodeTopup.instance(
    this.kode,
    this.nama,
    this.rekening,
    this.logo,
    this.tipeTopup,
  );
}

enum TipeTopup { Bank, EMoney, PaymentGateway }
