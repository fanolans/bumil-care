import 'package:flutter/material.dart';
import 'package:flutter_quiz/ui/widget/appbar.dart';

import '../../../common/constant/string_constant.dart';

class MonitoringPage extends StatelessWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: StringConstant.monitoringTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                onPressed: () {},
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_outlined,
                      size: 35,
                      color: Colors.red.shade200,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Column(
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
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'FAQ',
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
