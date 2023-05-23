import 'package:flutter/material.dart';

import '../../../../common/constant/string_constant.dart';

class HomeScreeningButton extends StatelessWidget {
  const HomeScreeningButton({
    super.key,
    required this.name,
    this.onPressed,
  });

  final String name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.width / 2.4,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 3,
          foregroundColor: Colors.red.shade300,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(
            double.infinity,
            MediaQuery.of(context).size.height / 5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.assignment,
              size: 20,
              color: Colors.red.shade300,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: const TextStyle(
                letterSpacing: 1,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              StringConstant.homeScreeningButton,
              textAlign: TextAlign.left,
              style: TextStyle(
                letterSpacing: 0,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
