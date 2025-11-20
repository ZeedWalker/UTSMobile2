// Enum status mahasiswa
enum StatusMahasiswa { aktif, cuti, alumni }

// Model data profil mahasiswa
class Profile {
  String nama;
  String nim;
  String jurusan;
  String email;
  String telepon;
  String kuliah;
  String agama;
  List<String> hobi;
  List<String> skill;
  StatusMahasiswa status;
  String? avatarUrl; // optional (null = pakai assets/me.jpg)

  Profile({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.email,
    required this.telepon,
    required this.kuliah,
    required this.agama,
    required this.hobi,
    required this.skill,
    required this.status,
    this.avatarUrl,
  });

  // Label status agar lebih mudah dibaca
  String statusLabel() {
    switch (status) {
      case StatusMahasiswa.aktif:
        return 'Mahasiswa Aktif';
      case StatusMahasiswa.cuti:
        return 'Cuti';
      case StatusMahasiswa.alumni:
        return 'Alumni';
    }
  }

  // Debug print
  @override
  String toString() => '$nama ($nim) - ${statusLabel()}';
}
