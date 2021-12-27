class LoginKaryawanModel {
  int? id;
  String? idJabatan;
  String? namaKaryawan;
  String? status;
  String? tanggalMasuk;
  String? nomorHp;

  LoginKaryawanModel({
    required this.id,
    required this.idJabatan,
    required this.namaKaryawan,
    required this.status,
    required this.tanggalMasuk,
    required this.nomorHp
  });

  factory LoginKaryawanModel.fromJson(Map<String, dynamic> json) {
    return LoginKaryawanModel(
      id : json['id'],
      idJabatan : json['id_jabatan'],
      namaKaryawan: json['nama_karyawan'],
      status: json['status'],
      tanggalMasuk: json['tanggal_masuk'],
      nomorHp: json['nomor_hp']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'id_jabatan' : idJabatan,
      'nama_karyawan' : namaKaryawan,
      'status' : status,
      'tanggal_masuk' : tanggalMasuk,
      'nomor_hp' : nomorHp
    };
  }
}