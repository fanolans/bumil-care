import 'package:flutter/material.dart';

import '../../../../common/constant/assets_constant.dart';
import '../../../../common/constant/string_constant.dart';

class LoginGoogleButton extends StatelessWidget {
  const LoginGoogleButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10,
          vertical: MediaQuery.of(context).size.height / 20,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(
              MediaQuery.of(context).size.width / 1.5,
              MediaQuery.of(context).size.height / 15,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                '${assetIcons}icon-google.png',
                color: Colors.white,
                height: 25,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                StringConstant.loginWithGoogle,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
