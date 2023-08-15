import 'package:flutter/material.dart';
import 'package:sqflite_project/utils/app_string.dart';

import '../../../widgets/custom_text.dart';

class HomePageTopBar extends StatelessWidget {
  const HomePageTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple.shade100,
      shadowColor: Colors.purple.shade100,
      elevation: 11,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(AppStrin.imgURL),
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomText(
                    text: AppStrin.name,
                    color: Colors.black,
                    size: 18,
                    maxline: 1,
                    fontWeight: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: AppStrin.cards,
                    color: Colors.black,
                    size: 24,
                    maxline: 1,
                    fontWeight: FontWeight.w500),
                const Icon(
                  Icons.search,
                  size: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
