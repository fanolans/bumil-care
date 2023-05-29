import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../common/constant/assets_constant.dart';
import '../../../../data/datasources/firebase_database_datasource.dart';

class ConsultationButton extends StatelessWidget {
  const ConsultationButton({
    super.key,
  });
  Future<bool> checkEligbleTakeQuiz() async {
    final user = FirebaseAuth.instance.currentUser!;
    final account = await FirebaseDatabaseDatasource().getAccount(user.uid);
    if (account.age == '' || account.height == '' || account.weight == '') {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 10,
      width: MediaQuery.of(context).size.width / 2,
      child: ElevatedButton(
        onPressed: () async {
          if (!await checkEligbleTakeQuiz()) {
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content:
                    Text('Lengkapi dulu data pribadi anda di halaman profil'),
              ),
            );
            return;
          } else {
            // ignore: use_build_context_synchronously
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return const ChatPage();
            //     },
            //   ),
            // );
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 3,
          foregroundColor: Colors.red.shade200,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(
            double.infinity,
            MediaQuery.of(context).size.height / 5,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: ImageIcon(
                AssetImage('${assetIcons}icon-consultation.png'),
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Konsultasi',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Sampaikan keluhan anda dengan bidan',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    letterSpacing: 0,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
