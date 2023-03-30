import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Bumil Care',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('${assetImages}background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Halo,',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Farrel Nolan Syahdony',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Card(
                elevation: 5,
                shadowColor: Colors.black,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.40,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Text(
                              'Usia',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('21 Tahun'),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              'BMI 20.4',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Normal'),
                          ],
                        ),
                        Column(
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
              ),
              const SizedBox(
                height: 35,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Fitur Utama',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
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
                                  height: 120,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
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
                                  height: 120,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Rekomendasi Edukasi',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
