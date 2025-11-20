import '../models/profile.dart';

class ProfileData {
  // Data hobi default
  static const List<String> hobbies = [
    'Basketball',
    'Gaming',
    'Menggambar',
    'Coding',
  ];

  // Data skill default
  static const List<String> skills = ['Dart', 'Git', 'Flutter', 'UI/UX'];

  // Profile default (pindahan dari profile_page.dart)
  static final Profile defaultProfile = Profile(
    nama: 'Adhitia Ridwanulloh',
    nim: '23552011065',
    jurusan: 'Teknik Informatika',
    email: 'arurofu@gmail.com',
    telepon: '+62 812 3456 7890',
    kuliah: 'Universitas Teknologi Bandung',
    agama: 'Islam',
    hobi: hobbies,
    skill: skills,
    status: StatusMahasiswa.aktif,
    avatarUrl: null,
  );
}
