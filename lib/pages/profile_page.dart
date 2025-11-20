import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_card.dart';
import '../widgets/skill_item.dart';
import '../widgets/hobby_item.dart';
import '../data/data.dart';

// Halaman Profil Mahasiswa
class ProfilePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;

  const ProfilePage({
    super.key,
    required this.onToggleTheme,
    required this.isDark,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile profile;

  int selectedTab = 0; // 0 = skill, 1 = hobi

  @override
  void initState() {
    super.initState();
    profile = ProfileData.defaultProfile;
  }

  void _toggleStatus() {
    setState(() {
      if (profile.status == StatusMahasiswa.aktif) {
        profile.status = StatusMahasiswa.cuti;
      } else if (profile.status == StatusMahasiswa.cuti) {
        profile.status = StatusMahasiswa.alumni;
      } else {
        profile.status = StatusMahasiswa.aktif;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: Icon(widget.isDark ? Icons.wb_sunny : Icons.dark_mode),
          ),
          IconButton(
            onPressed: _toggleStatus,
            icon: const Icon(Icons.swap_horiz),
          ),
        ],
      ),

      body: SafeArea(
        child: Stack(
          children: [
            // ==========================================
            // BACKGROUND GOLD / DARK GOLD GRADIENT (FIX)
            // ==========================================
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 160,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.isDark
                        ? [
                            Color(0xFF8B6C0A), // Darker gold
                            Color(0xFF6E5208),
                          ]
                        : [
                            Color(0xFF8B0000), // dark crimson
                            Color(0xFFB80F0A), // bright crimson
                          ],
                  ),
                ),
              ),
            ),

            // ==========================================
            // MAIN CONTENT
            // ==========================================
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Column(
                children: [
                  // HEADER PROFIL
                  SizedBox(
                    height: 120,
                    child: Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 6,
                          child: Container(
                            width: 110,
                            height: 110,
                            padding: const EdgeInsets.all(6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/me.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                profile.nama,
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                profile.jurusan,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              const SizedBox(height: 6),

                              Chip(label: Text(profile.statusLabel())),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  Expanded(
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InfoCard(
                                icon: Icons.email,
                                title: 'Email',
                                subtitle: profile.email,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: InfoCard(
                                icon: Icons.phone,
                                title: 'Telepon',
                                subtitle: profile.telepon,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tentang Saya',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Halo! saya ${profile.nama}, mahasiswa ${profile.jurusan}. '
                                  'Saya tertarik pada pengembangan aplikasi mobile dan UI/UX.',
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.school),
                                title: const Text('Kuliah'),
                                subtitle: Text(profile.kuliah),
                              ),
                              const Divider(height: 1),
                              ListTile(
                                leading: const Icon(Icons.badge),
                                title: const Text('NIM'),
                                subtitle: Text(profile.nim),
                              ),
                              const Divider(height: 1),
                              ListTile(
                                leading: const Icon(Icons.self_improvement),
                                title: const Text('Agama'),
                                subtitle: Text(profile.agama),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        // ======= SWITCH BUTTON =======
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() => selectedTab = 0);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedTab == 0
                                      ? (widget.isDark
                                            ? Colors.grey[700]
                                            : Colors.red[800])
                                      : (widget.isDark
                                            ? Colors.grey[850]
                                            : Colors.grey[300]),
                                ),
                                child: const Text("Skill"),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() => selectedTab = 1);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedTab == 1
                                      ? (widget.isDark
                                            ? Colors.grey[700]
                                            : Colors.red[800])
                                      : (widget.isDark
                                            ? Colors.grey[850]
                                            : Colors.grey[300]),
                                ),
                                child: const Text("Hobi"),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // ======= CONTENT SWITCH =======
                        if (selectedTab == 0)
                          // ==== SKILL ====
                          SizedBox(
                            height: 160,
                            child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 3,
                                  ),
                              itemCount: profile.skill.length,
                              itemBuilder: (context, index) =>
                                  SkillItem(skillName: profile.skill[index]),
                            ),
                          )
                        else
                          // ==== HOBI ====
                          SizedBox(
                            height: 48,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: profile.hobi.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: HobbyItem(hobby: profile.hobi[index]),
                              ),
                            ),
                          ),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
