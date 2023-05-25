part of 'faq_cubit.dart';

abstract class FaqState {}

class FaqInitial extends FaqState {}

class FaqLoading extends FaqInitial {}

class FaqSuccess extends FaqInitial {
  final List<Faq> faqs;
  FaqSuccess({
    required this.faqs,
  });
}
