import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import '../../../../common/constant/string_constant.dart';
import '../../profile/profile_ui.dart';

class HomeUserProfileCard extends StatelessWidget {
  const HomeUserProfileCard({
    super.key,
    required this.name,
    required this.imagePath,
  });

  final String name;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 36,
      ),
      child: Row(
        children: [
          InkWell(
            customBorder: const CircleBorder(),
            enableFeedback: true,
            radius: 30,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ProfilePage();
                  },
                ),
              );
            },
            child: AvatarGlow(
              endRadius: 45,
              animate: true,
              curve: Curves.fastOutSlowIn,
              showTwoGlows: true,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  imagePath,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringConstant.homeHello,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
