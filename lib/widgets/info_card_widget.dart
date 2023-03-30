import 'package:flutter/material.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 13,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Usia',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('21 Tahun'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'BMI 20.4',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Normal'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Kehamilan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Risiko Tinggi'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
