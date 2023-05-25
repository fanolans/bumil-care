import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/faq/faq_cubit.dart';
import 'monitoring_ui_faq_list.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqCubit, FaqState>(
      builder: (context, state) {
        if (state is FaqLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FaqSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var faqs = state.faqs[index];
              return FaqList(faq: faqs);
            },
            itemCount: state.faqs.length,
          );
        }
        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
