import 'gaji_model.dart';

class SalaryModel {

  int? id;
  String? idJabatan, namaKaryawan, status, tanggalMasuk, nomorHp, username;
  List<GajiModel>? gaji;

  SalaryModel({
    required this.id,
    required this.idJabatan,
    required this.namaKaryawan,
    required this.status,
    required this.tanggalMasuk,
    required this.nomorHp,
    required this.username,
    required this.gaji,
  });

  factory SalaryModel.fromJson(Map<String, dynamic> json) {
    return SalaryModel(
      id : json['id'],
      idJabatan : json['id_jabatan'],
      namaKaryawan: json['nama_karyawan'],
      status: json['status'],
      tanggalMasuk: json['tanggal_masuk'],
      nomorHp: json['nomor_hp'],
      username: json['username'],
      gaji: json['gaji'].map<GajiModel>((e) => 
      GajiModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'id_jabatan' : idJabatan,
      'nama_karyawan' : namaKaryawan,
      'status' : status,
      'tanggal_masuk' : tanggalMasuk,
      'nomor_hp' : nomorHp,
      'username' : username,
      'gaji' : gaji!.map((e) => e.toJson()).toList(),
    };
  }
}