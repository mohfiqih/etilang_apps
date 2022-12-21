import 'dart:convert';

List<Tilang> tilangFromJson(String str) =>
    List<Tilang>.from(json.decode(str).map((x) => Tilang.fromJson(x)));

String tilangToJson(List<Tilang> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tilang {
  Tilang({
    this.no_plat,
    this.filename,
    this.pelanggaran,
    this.filename_pelanggaran,
    this.akurasi,
    this.tanggal,
    this.id,
  });

  String no_plat;
  String filename;
  String pelanggaran;
  String filename_pelanggaran;
  String akurasi;
  String tanggal;
  int id;

  factory Tilang.fromJson(Map<String, dynamic> json) => Tilang(
        no_plat: json["no_plat"],
        filename: json["filename"],
        pelanggaran: json["pelanggaran"],
        filename_pelanggaran: json["filename_pelanggaran"],
        akurasi: json["akurasi"],
        tanggal: json["tanggal"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "no_plat": no_plat,
        "filename": filename,
        "pelanggaran": pelanggaran,
        "filename_pelanggaran": filename_pelanggaran,
        "akurasi": akurasi,
        "tanggal": tanggal,
        "id": id,
      };
  @override
  String toString() {
    String result = no_plat;
    return result;
  }
}
