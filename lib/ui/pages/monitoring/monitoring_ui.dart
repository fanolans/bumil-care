import 'package:flutter/material.dart';
import 'package:flutter_quiz/ui/pages/monitoring/components/monitoring_ui_faq.dart';
import 'package:flutter_quiz/ui/widget/appbar.dart';

import '../../../common/constant/string_constant.dart';
import 'components/monitoring_ui_consultation_button.dart';

class MonitoringPage extends StatelessWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: StringConstant.monitoringTitle,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ConsultationButton(),
              SizedBox(
                height: 25,
              ),
              Text(
                'FAQ',
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: FaqPage(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
