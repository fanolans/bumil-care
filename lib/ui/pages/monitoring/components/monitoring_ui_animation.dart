import 'package:flutter/material.dart';

import '../../../../common/constant/assets_constant.dart';

class MonitoringAnimation extends StatelessWidget {
  const MonitoringAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('${assetImages}animation-consultation.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
