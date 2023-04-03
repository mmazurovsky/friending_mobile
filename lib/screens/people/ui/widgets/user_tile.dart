import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String nickname;
  final int age;
  final List<String> interests;
  final String photoUrl;

  UserTile({
    required this.nickname,
    required this.age,
    required this.interests,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(photoUrl),
      ),
      title: Text(nickname),
      subtitle: Text('Age: $age'),
      trailing: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: interests.map((interest) {
          return Chip(
            label: Text(interest),
          );
        }).toList(),
      ),
    );
  }
}
