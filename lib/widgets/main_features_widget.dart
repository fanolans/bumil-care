import 'package:flutter/material.dart';

class MainFeaturesWidget extends StatelessWidget {
  const MainFeaturesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => null,
          child: Card(
            elevation: 5,
            shadowColor: Colors.black,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.assignment,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Skrining',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Ayo Prediksi Risiko pada kehamilan anda',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () => null,
          child: Card(
            elevation: 5,
            shadowColor: Colors.black,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.chat,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Konsultasi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Sampaikan keluhan anda dengan bidan',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
