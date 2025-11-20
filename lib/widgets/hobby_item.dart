import 'package:flutter/material.dart';


class HobbyItem extends StatelessWidget {
  final String hobby;


  const HobbyItem({super.key, required this.hobby});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
      ),
      child: Text(hobby),
    );
  }
}