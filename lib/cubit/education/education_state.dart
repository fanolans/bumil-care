part of 'education_cubit.dart';

@freezed
class EducationState with _$EducationState {
  const factory EducationState.initial() = _Initial;
  const factory EducationState.loading() = _Loading;
  const factory EducationState.loaded(List<Education> listEducation) = _Loaded;
  const factory EducationState.error() = _Error;
}
