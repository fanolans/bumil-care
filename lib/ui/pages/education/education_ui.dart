import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quiz/cubit/education/education_cubit.dart';

import 'component/item_widget.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducationCubit, EducationState>(
      builder: (context, state) {
        if (state is EducationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is EducationSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var educations = state.educations[index];
              return ItemWidget(education: educations);
            },
            itemCount: state.educations.length,
          );
        }
        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
