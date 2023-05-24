part of 'education_cubit.dart';

abstract class EducationState {}

class EducationInitial extends EducationState {}

class EducationLoading extends EducationInitial {}

class EducationSuccess extends EducationInitial {
  final List<Education> educations;
  EducationSuccess({
    required this.educations,
  });
}
