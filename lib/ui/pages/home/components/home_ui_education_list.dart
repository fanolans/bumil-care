import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/education/education_cubit.dart';
import '../../../../data/models/education.dart';

class EducationList extends StatelessWidget {
  const EducationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Rekomendasi Edukasi',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
