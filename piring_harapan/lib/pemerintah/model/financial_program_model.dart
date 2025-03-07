class FinancialProgramModel {
  String kodePengiriman;
  String namaToko;
  String alamatPengiriman;
  String catatanPemesanan;
  String nomorPesanan;
  String metodePembayaran;
  String waktuPembayaran;
  DetailPemesanan detailPemesanan;
  String subtotalPengiriman;
  String totalPembayaran;

  FinancialProgramModel.fromJson(Map json)
      : kodePengiriman = json['kode_pengiriman'] as String,
        namaToko = json['nama_toko'] as String,
        alamatPengiriman = json['alamat_pengiriman'] as String,
        catatanPemesanan = json['catatan_pemesanan'] as String,
        nomorPesanan = json['nomor_pesanan'] as String,
        metodePembayaran = json['metode_pembayaran'] as String,
        waktuPembayaran = json['waktu_pembayaran'] as String,
        detailPemesanan = DetailPemesanan.fromJson(json['detail_pemesanan']),
        subtotalPengiriman = json['subtotal_pengiriman'] as String,
        totalPembayaran = json['total_pembayaran'] as String;
}

class DetailPemesanan {
  String namaBahan;
  String jumlah;
  String subtotalProduk;

  DetailPemesanan.fromJson(Map json)
      : namaBahan = json['nama_bahan'] as String,
        jumlah = json['jumlah'] as String,
        subtotalProduk = json['subtotal_produk'] as String;
}
