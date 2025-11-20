import 'package:flutter/material.dart';


class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;


  const InfoCard({super.key, required this.icon, required this.title, required this.subtitle});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(icon, size: 20)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
      ),
    );
  }
}