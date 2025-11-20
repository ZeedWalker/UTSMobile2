import 'package:flutter/material.dart';


class SkillItem extends StatelessWidget {
  final String skillName;


  const SkillItem({super.key, required this.skillName});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(child: Text(skillName, style: const TextStyle(fontWeight: FontWeight.w600))),
      ),
    );
  }
}